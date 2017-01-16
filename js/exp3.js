/*jshint esversion: 6 */
var renderer;
var scene;
var camera;

var lookAt = {
    x: 0.0,
    y: 0.0,
    z: 0.0
};
var rotateOnAxis = {
    x: false,
    y: false,
    z: false,
    xAngle: 0.0,
    yAngle: 0.0,
    zAngle: 0.0
};

var cameraRotateDirection = 'none';
var cameraMoveDirection = 'none';
var currentObject;
var controls;
var axisHelper;
var geos = [];
var lights = [];

//用于关联 dat.gui 的参数类
var Params = function() {
    //camera position
    this.cameraPosX = camera.position.x;
    this.cameraPosY = camera.position.y;
    this.cameraPosZ = camera.position.z;
    //look at
    this.lookAtX = lookAt.x;
    this.lookAtY = lookAt.y;
    this.lookAtZ = lookAt.z;
    //zoom factor
    this.fov = camera.fov;
    this.lens = camera.getFocalLength;
    //camera mode
    this.cameraMode = 'perspective';
    //zoom
    this.zoom = 1.0;
    //about rotation
    this.cameraAutoRotate = false;
    this.cameraRotationSpeed = 2.0;
    this.cameraRotateDirection = 'clockwise';
    //show axisHelper
    this.showAxis = false;
    this.roamSpeed = 2;
    this.zoomSpeed = 10;
    //cube attributes
    this.cubeColor = '#ffffff';
    this.cubeTexture = 'none';
};
var params; //参数类实例

//关联 dat.gui 的光源颜色类
var Light = function() {
    this.x = 0;
    this.y = 0;
    this.z = 0;
    this.color = [0, 0, 0];
};
//三种光源颜色实例
var spotLight, pointLight, directionalLight;

function init() {
    //创建场景
    scene = new THREE.Scene();
    //雾化
    scene.fog = new THREE.FogExp2(0xcccccc, 0.0008);

    //创建一个组合相机
    camera = new THREE.CombinedCamera(window.innerWidth, window.innerHeight, 70, 1, 6000, -1, 6000);
    camera.position.set(200, 200, 200);
    camera.lookAt(new THREE.Vector3(lookAt.x, lookAt.y, lookAt.z));
    scene.add(camera);
    //创建渲染器
    renderer = new THREE.WebGLRenderer();
    //设置背景色为黑色, 设置画布大小
    renderer.setPixelRatio(window.devicePixelRatio);
    renderer.setClearColor(scene.fog.color);
    // renderer.setClearColor(0x000000);
    renderer.setSize(window.innerWidth, window.innerHeight);

    //创建辅助坐标轴
    axisHelper = new THREE.AxisHelper(5000);

    //这一段用于导入一个外部模型, 需要 OBJLoader.js 和 MTLLoader.js
    //加载 mtl 文件
    var mtlLoader = new THREE.MTLLoader();
    mtlLoader.setPath('model/');
    mtlLoader.load('teapot.mtl', function(materials) {
        materials.preload();
        //加载 obj 文件
        var objLoader = new THREE.OBJLoader();
        objLoader.setMaterials(materials);
        objLoader.load('model/teapot.obj', function(object) {
            object.position.set(0, 0, 0);
            scene.add(object);
            object.receiveShadow = true;
            render();
        });
    });

    //向场景加入随机方块 3000 个
    var size = 50;
    var cube = new THREE.BoxGeometry(size, size, size);
    var material = new THREE.MeshPhongMaterial({
        //初始化颜色为白色
        //注意使用 Phong 类型材质而不是用 basic 类型
        //basic 类型材质无法接受光源
        color: 0xffffff,
    });
    for (var i = 0; i < 3000; i++) {
        var mesh = new THREE.Mesh(cube, material);
        geos[i] = mesh;
        //注意范围是以「原点」为中心, 边长为3000的立方体空间
        mesh.position.x = 3000 * (2.0 * Math.random() - 1.0);
        mesh.position.y = 3000 * (2.0 * Math.random() - 1.0);
        mesh.position.z = 3000 * (2.0 * Math.random() - 1.0);
        mesh.rotation.x = Math.random() * Math.PI;
        mesh.rotation.y = Math.random() * Math.PI;
        mesh.rotation.z = Math.random() * Math.PI;
        mesh.matrixAutoUpdate = false;
        mesh.updateMatrix();
        scene.add(mesh);
    }

    //添加全局环境光，颜色是偏柔和的白色
    var ambientLight = new THREE.AmbientLight("#8b8a87", 1.2);
    scene.add(ambientLight);

    //光源
    var lightHelpers = [];
    lights[0] = addLight(13.0/255, 174.0/255, 243.0/255, 1000, 0, -200, 'PointLight');
    lights[1] = addLight(230.0/255, 121.0/255, 26.0/255, 0, 0, -200, 'SpotLight');
    lights[2] = addLight(192.0/255, 64.0/255, 68.0/255, 1000, 1000, -200, 'DirectionalLight');
    // lightHelpers[0] = new THREE.PointLightHelper(lights[0]);
    // lightHelpers[1] = new THREE.SpotLightHelper(lights[1]);
    // lightHelpers[2] = new THREE.DirectionalLightHelper(lights[2]);
    // scene.add(lightHelpers[0]);
    // scene.add(lightHelpers[1]);
    // scene.add(lightHelpers[2]);

    //调用函数来添加光源的目的是方便对获得光源对象做其他操作
    //上面注释掉的部分利用这样的处理添加了三个光源指示器
    function addLight(r, g, b, x, y, z, type) {
        var light;
        switch (type) {
            case 'PointLight':
                light = new THREE.PointLight(0xffffff, 1, 2000);
                break;
            case 'SpotLight':
                light = new THREE.SpotLight(0xffffff);
                break;
            case 'DirectionalLight':
                light = new THREE.DirectionalLight(0xffffff, 0.5);
                break;
            default:
        }
        light.color.setRGB(r, g, b);
        light.position.set(x, y, z);
        scene.add(light);
        return light;
    }

    //使用 orbitcontrols 来控制相机的绕轴旋转
    controls = new THREE.OrbitControls(camera, renderer.domElement);
    controls.target.set(0, 0, 0); //设置中心
    controls.enableKeys = false; //由于要自己设置键盘事件所以屏蔽 controls 的事件

    //改变窗口大小的时候改变相机和渲染器的大小
    window.addEventListener('resize', function() {
        camera.setSize(window.innerWidth, window.innerHeight);
        camera.updateProjectionMatrix();
        renderer.setSize(window.innerWidth, window.innerHeight);
    }, false);

    //键盘响应事件
    window.addEventListener('keydown', function(key) {
        params.cameraAutoRotate = controls.autoRotate = false;
        switch (key.keyCode) {
            //控制镜头旋转
            case 37: //左
                cameraRotateDirection = 'left';
                break;
            case 38: //上
                cameraRotateDirection = 'up';
                break;
            case 39: //右
                cameraRotateDirection = 'right';
                break;
            case 40: //下
                cameraRotateDirection = 'down';
                break;
            //控制相机移动
            case 87: //W
                cameraMoveDirection = 'up';
                break;
            case 65: //A
                cameraMoveDirection = 'left';
                break;
            case 83: //S
                cameraMoveDirection = 'down';
                break;
            case 68: //D
                cameraMoveDirection = 'right';
                break;
            //控制相机前后移动
            case 70: //F
                cameraMoveDirection = 'forward';
                break;
            case 66: //B
                cameraMoveDirection = 'back';
                break;
            //控制相机按照顺时针逆时针旋转
            //这里的旋转是以原点为锥尖，绕锥底平面的旋转
            //实际上调用的是 orbitcontrols 的 API
            case 81: //Q
                controls.autoRotate = true;
                controls.autoRotateSpeed = Math.abs(controls.autoRotateSpeed);
                break;
            case 69: //E
                controls.autoRotate = true;
                controls.autoRotateSpeed = -Math.abs(controls.autoRotateSpeed);
                break;
            default:
                break;
        }
    });

    //按键抬起的时候停止所有移动动作
    window.addEventListener('keyup', function() {
        cameraRotateDirection = 'none';
        cameraMoveDirection = 'none';
        cameraRotateAroundZDirection = 'none';
        controls.autoRotate = false;
    });

    //将渲染器对应的 dom 节点插入 html
    //注意插入的就是一个<canvas></canvas>
    //所以在 html 文件里面不手动写 canvas 而是用一个 div 来做父结点
    $("#WebGL").append(renderer.domElement);
    //初始化控制面板
    initDatGui();
    //开始绘制
    render();
}

function render() {
    // render using requestAnimationFrame
    //是否旋转镜头
    if (cameraRotateDirection != 'none') {
        rotateCamera(cameraRotateDirection);
    }
    //是否移动镜头
    if (cameraMoveDirection != 'none') {
        moveCamera(cameraMoveDirection);
        if (cameraMoveDirection == 'forward' || cameraMoveDirection == 'back') {
            cameraMoveDirection = 'none';
        }
    }
    if (controls.autoRotate) {
        //orbitcontrols 的 autoRotate 设置为 true 时必须调用 controls.update()
        //如果不做判断每次都直接 update 会造成卡死的情况，原因暂时不明
        controls.update();
    }
    updateCameraState();
    renderer.render(scene, camera);
    requestAnimationFrame(render);
}

function initDatGui() {
    //这里参考 dat.gui 的文档
    params = new Params();
    var gui = new dat.GUI();

    pointLight = new Light();
    spotLight = new Light();
    directionalLight = new Light();

    var f1 = gui.addFolder('Camera Position');
    f1.add(params, 'cameraPosX', -2000, 2000, 10).name('x').onChange(function(x) {
        camera.position.x = x;
    }).listen();
    f1.add(params, 'cameraPosY', -2000, 2000, 10).name('y').onChange(function(y) {
        camera.position.y = y;
    }).listen();
    f1.add(params, 'cameraPosZ', -2000, 2000, 10).name('z').onChange(function(z) {
        camera.position.z = z;
    }).listen();
    // f1.open();

    var f2 = gui.addFolder('Look At');
    f2.add(params, 'lookAtX', -2000, 2000, 20).name('x').onChange(function(x) {
        lookAt.x = x;
        camera.lookAt(new THREE.Vector3(lookAt.x, lookAt.y, lookAt.z));
    }).listen();
    f2.add(params, 'lookAtY', -2000, 2000, 20).name('y').onChange(function(y) {
        lookAt.y = y;
        camera.lookAt(new THREE.Vector3(lookAt.x, lookAt.y, lookAt.z));
    }).listen();
    f2.add(params, 'lookAtZ', -2000, 2000, 20).name('z').onChange(function(z) {
        lookAt.z = z;
        camera.lookAt(new THREE.Vector3(lookAt.x, lookAt.y, lookAt.z));
    }).listen();
    // f2.open();

    var f3 = gui.addFolder('zoom');
    f3.add(params, 'fov', 30, 180, 10).onChange(function(fov) {
        camera.setFov(fov);
    }).listen();
    f3.add(params, 'zoom', 0.4, 3.0, 0.1).onChange(function(zoom) {
        camera.setZoom(zoom);
    });
    // f3.open();

    var f4 = gui.addFolder('rotation');
    f4.add(params, 'cameraAutoRotate').name('auto rotation').onFinishChange(function(enable) {
        if (enable) {
            controls.autoRotate = true;
        } else {
            controls.autoRotate = false;
        }
    }).listen();
    f4.add(params, 'cameraRotationSpeed', 0, 10, 1).name('rotation speed').onChange(function(speed) {
        controls.autoRotateSpeed = params.cameraRotateDirection == 'clockwise' ? Math.abs(speed) : -Math.abs(speed);
    });
    f4.add(params, 'cameraRotateDirection', ['clockwise', 'anticlockwise']).name('rotate direction').onFinishChange(function(direction) {
        params.cameraRotateDirection = direction;
        controls.autoRotateSpeed = direction == 'clockwise' ? Math.abs(controls.autoRotateSpeed) : -Math.abs(controls.autoRotateSpeed);
    });
    // f4.open();

    var f6 = gui.addFolder('cube material');
    f6.addColor(params, 'cubeColor').onChange(function(color) {
        for (var i = 0; i < geos.length; i++) {
            geos[i].material.setValues({color: color});
        }
        params.cubeColor = color;
    });
    f6.add(params, 'cubeTexture', ['none', 'crate', 'roughness', 'disturb']).onFinishChange(function(texture) {
        var loader = new THREE.TextureLoader();
        switch (texture) {
            case 'none':
                var material = new THREE.MeshPhongMaterial({
                    color: params.cubeColor
                });
                for (var i = 0; i < geos.length; i++) {
                    geos[i].material = material;
                }
                break;
            case 'crate':
                loader.load(
                    'textures/crate.gif',
                    function(texture) {
                        var material = new THREE.MeshPhongMaterial({
                            color: params.cubeColor,
                            map: texture
                        });
                        for (var i = 0; i < geos.length; i++) {
                            geos[i].material = material;
                        }
                    }
                );
                break;
            case 'roughness':
                loader.load(
                    'textures/roughness.jpg',
                    function(texture) {
                        var material = new THREE.MeshPhongMaterial({
                            color: params.cubeColor,
                            map: texture
                        });
                        for (var i = 0; i < geos.length; i++) {
                            geos[i].material = material;
                        }
                    }
                );
                break;
            case 'disturb':
                loader.load(
                    'textures/disturb.jpg',
                    function(texture) {
                        var material = new THREE.MeshPhongMaterial({
                            map: texture
                        });
                        for (var i = 0; i < geos.length; i++) {
                            geos[i].material = material;
                        }
                    }
                );
                break;
            default:
                break;
        }
    });
    f6.open();

    var h, s, v, hsl;
    var f7 = gui.addFolder('point light');
    f7.add(pointLight, 'x', -2000, 2000, 50).onChange(function(x) {
        pointLight.x = x;
        lights[0].position.set(pointLight.x, pointLight.y, pointLight.z);
    }).listen();
    f7.add(pointLight, 'y', -2000, 2000, 50).onChange(function(y) {
        pointLight.y = y;
        lights[0].position.set(pointLight.x, pointLight.y, pointLight.z);
    }).listen();
    f7.add(pointLight, 'z', -2000, 2000, 50).onChange(function(z) {
        pointLight.z = z;
        lights[0].position.set(pointLight.x, pointLight.y, pointLight.z);
    }).listen();
    f7.addColor(pointLight, 'color').onChange(function(color) {
        lights[0].color.setRGB(color[0]/255.0, color[1]/255.0, color[2]/255.0);
    }).listen();
    pointLight.x = lights[0].position.x;
    pointLight.y = lights[0].position.y;
    pointLight.z = lights[0].position.z;
    pointLight.color = [lights[0].color.r*255.0, lights[0].color.g*255.0, lights[0].color.b*255.0];
    f7.open();

    var f8 = gui.addFolder('spot light');
    f8.add(spotLight, 'x', -2000, 2000, 50).onChange(function(x) {
        spotLight.x = x;
        lights[1].position.set(spotLight.x, spotLight.y, spotLight.z);
    }).listen();
    f8.add(spotLight, 'y', -2000, 2000, 50).onChange(function(y) {
        spotLight.y = y;
        lights[1].position.set(spotLight.x, spotLight.y, spotLight.z);
    }).listen();
    f8.add(spotLight, 'z', -2000, 2000, 50).onChange(function(z) {
        spotLight.z = z;
        lights[1].position.set(spotLight.x, spotLight.y, spotLight.z);
    }).listen();
    f8.addColor(spotLight, 'color').onChange(function (color) {
        lights[1].color.setRGB(color[0]/255.0, color[1]/255.0, color[2]/255.0);
    }).listen();
    spotLight.x = lights[1].position.x;
    spotLight.y = lights[1].position.y;
    spotLight.z = lights[1].position.z;
    spotLight.color = [lights[1].color.r*255.0, lights[1].color.g*255.0, lights[1].color.b*255.0];
    f8.open();

    var f9 = gui.addFolder('directional light');
    f9.add(directionalLight, 'x', -2000, 2000, 50).onChange(function(x) {
        directionalLight.x = x;
        lights[2].position.set(directionalLight.x, directionalLight.y, directionalLight.z);
    }).listen();
    f9.add(directionalLight, 'y', -2000, 2000, 50).onChange(function(y) {
        directionalLight.y = y;
        lights[2].position.set(directionalLight.x, directionalLight.y, directionalLight.z);
    }).listen();
    f9.add(directionalLight, 'z', -2000, 2000, 50).onChange(function(z) {
        directionalLight.z = z;
        lights[2].position.set(directionalLight.x, directionalLight.y, directionalLight.z);
    }).listen();
    f9.addColor(directionalLight, 'color').onChange(function(color) {
        lights[2].color.setRGB(color[0]/255.0, color[1]/255.0, color[2]/255.0);
    }).listen();
    directionalLight.x = lights[2].position.x;
    directionalLight.y = lights[2].position.y;
    directionalLight.z = lights[2].position.z;
    directionalLight.color = [lights[2].color.r*255.0, lights[2].color.g*255.0, lights[2].color.b*255.0];
    f9.open();

    var f5 = gui.addFolder('other');
    f5.add(params, 'roamSpeed', 0, 50, 1).onChange(function(speed) {
        params.roamSpeed = speed;
    });
    f5.add(params, 'zoomSpeed', 0, 50, 1).onChange(function(speed) {
        params.zoomSpeed = speed;
    });
    f5.add(params, 'cameraMode', ['perspective', 'orthographic']).onFinishChange(function(mode) {
        if (mode == 'perspective') {
            camera.toPerspective();
        } else if (mode == 'orthographic') {
            camera.toOrthographic();
        }
    });
    f5.add(params, 'showAxis').onFinishChange(function(show) {
        if (!show) {
            scene.remove(axisHelper);
        } else {
            scene.add(axisHelper);
        }
    });
}

function rotateCamera(direction) {
    //rotate 方法, 具体参照 three.js 文档的 object3D 对象方法
    switch (direction) {
        case 'up':
            camera.rotateX(Math.PI / 200);
            break;
        case 'down':
            camera.rotateX(-Math.PI / 200);
            break;
        case 'left':
            camera.rotateY(Math.PI / 200);
            break;
        case 'right':
            camera.rotateY(-Math.PI / 200);
            break;
        default:
            break;
    }
}

function updateCameraState() {
    //在相机移动或旋转镜头时更新相机的 lookAt 向量
    //实际上并没有 lookAt 向量这种东西, 用 getWorldDirection 获得的是一个归一化的向量
    //这里为了好看乘了100
    //这段代码具体解释请搜 SO 关键字 "three.js lookat vector"
    var vector = new THREE.Vector3();
    camera.getWorldDirection(vector);
    params.lookAtX = vector.x * 100;
    params.lookAtY = vector.y * 100;
    params.lookAtZ = vector.z * 100;
    params.cameraPosX = camera.position.x;
    params.cameraPosY = camera.position.y;
    params.cameraPosZ = camera.position.z;
}

function moveCamera(direction) {
    //translate 方法, 具体参照 three.js 文档的 object3D 对象方法
    if (direction == 'up') {
        camera.translateY(params.roamSpeed);
    } else if (direction == 'down') {
        camera.translateY(-params.roamSpeed);
    } else if (direction == 'left') {
        camera.translateX(-params.roamSpeed);
    } else if (direction == 'right') {
        camera.translateX(params.roamSpeed);
    } else if (direction == 'forward') {
        camera.translateZ(-params.zoomSpeed);
    } else if (direction == 'back') {
        camera.translateZ(params.zoomSpeed);
    }
}
