var renderer;
var scene;
var camera;
var lookAtScene = true;
var lookAt = {
    x: 0,
    y: 0,
    z: 0
};
var rotateOnAxis = {
    x: false,
    y: false,
    z: false,
    xAngle: 0.0,
    yAngle: 0.0,
    zAngle: 0.0
};
var cameraRotateDirection;
var cameraMoveDirection;
var Params = function() {
    //camera position
    this.cameraPosX = camera.position.x;
    this.cameraPosY = camera.position.y;
    this.cameraPosZ = camera.position.z;
    //look at
    this.lookAtX = lookAt.x;
    this.lookAtY = lookAt.y;
    this.lookAtZ = lookAt.z;

    this.fov = camera.fov;
    this.lens = camera.getFocalLength;
    //camera mode
    this.cameraMode = 'perspective';
    //zoom
    this.zoom = 1.0;
    //about rotation
    this.cameraViews = 'default';
    this.cameraRotation = 'default';
};
var params;

function init() {
    //创建场景
    scene = new THREE.Scene();
    //创建一个组合相机
    camera = new THREE.CombinedCamera(window.innerWidth, window.innerHeight, 70, 1, 1000, -500, 1000);
    camera.position.set(200, 200, 200);
    camera.lookAt(new THREE.Vector3(lookAt.x, lookAt.y, lookAt.z));
    scene.add(camera);
    //创建渲染器
    renderer = new THREE.WebGLRenderer();
    //设置背景色为黑色, 设置画布大小
    renderer.setClearColor(0x000000);
    renderer.setSize(window.innerWidth, window.innerHeight);
    //创建辅助坐标轴
    var axisHelper = new THREE.AxisHelper(5000);
    //创建一个底板
    scene.add(axisHelper);
    var planeGeometry = new THREE.PlaneGeometry(260, 260, 1, 1);
    var planeMaterial = new THREE.MeshBasicMaterial({
        color: 0xcccccc
    });
    var plane = new THREE.Mesh(planeGeometry, planeMaterial);
    plane.receiveShadow = true;
    plane.position.set(0, 0, 0);
    plane.rotation.x = -Math.PI / 2;
    scene.add(plane);
    //加载 mtl 文件
    var mtlLoader = new THREE.MTLLoader();
    mtlLoader.setPath('model/');
    mtlLoader.load('teapot.mtl', function(materials) {
        materials.preload();
        //加载 obj 文件
        var objLoader = new THREE.OBJLoader();
        objLoader.setMaterials(materials);
        objLoader.setPath('model/');
        objLoader.load('teapot.obj', function(object) {
            object.position.set(0, 0, 0);
            scene.add(object);
            object.receiveShadow = true;
            // renderer.render(scene, camera);
            render();
        });
    });

    //添加全局环境光
    var ambientLight = new THREE.AmbientLight("#8b8a87", 1.2);
    scene.add(ambientLight);
    //为了增加阴影添加一个点光源
    var spotLight = new THREE.SpotLight(0xffffff);
    spotLight.position.set(-40, 60, -10);
    spotLight.castShadow = true;
    scene.add(spotLight);

    //改变窗口大小的时候改变相机和渲染器的大小
    window.addEventListener('resize', function() {
        camera.setSize(window.innerWidth, window.innerHeight);
        camera.updateProjectionMatrix();
        renderer.setSize(window.innerWidth, window.innerHeight);
    }, false);

    window.addEventListener('keydown', function(key) {
        switch (key.keyCode) {
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
            case 87: //W
                cameraMoveDirection = 'forward';
                break;
            case 83: //S
                cameraMoveDirection = 'back';
                break;
            default:
                break;
        }
    });
    window.addEventListener('keyup', function() {
        cameraRotateDirection = 'none';
        cameraMoveDirection = 'none';
    });
    //将渲染器对应的 dom 节点插入 html
    $("#WebGL").append(renderer.domElement);
    //初始化控制面板
    initDatGui();
    //使用 orbitcontrols 来控制拖动旋转事件
    var controls = new THREE.OrbitControls(camera, renderer.domElement);
    controls.target.set(0, 0, 0);
    controls.addEventListener('change', function() {
        params.cameraPosX = camera.position.x;
        params.cameraPosY = camera.position.y;
        params.cameraPosZ = camera.position.z;
        controls.update();
    });
    //开始绘制
    render();
}

function render() {
    // render using requestAnimationFrame
    // renderer.render(scene, camera);
    var timer = Date.now() * 0.001;
    var radius = 200;
    if (lookAtScene) {
        camera.lookAt(new THREE.Vector3(lookAt.x, lookAt.y, lookAt.z));
    }
    if (cameraRotateDirection != "none") {
        rotateCamera(cameraRotateDirection);
    }
    if (cameraMoveDirection != "none") {
        moveCameraForwardBack(cameraMoveDirection);
    }
    renderer.render(scene, camera);
    requestAnimationFrame(render);
}

function initDatGui() {
    params = new Params();
    var gui = new dat.GUI();

    var f1 = gui.addFolder('Camera Position');
    f1.add(params, 'cameraPosX', -500, 500, 20).name('x').onChange(function(x) {
        camera.position.x = x;
    }).listen();
    f1.add(params, 'cameraPosY', -500, 500, 20).name('y').onChange(function(y) {
        camera.position.y = y;
    }).listen();
    f1.add(params, 'cameraPosZ', -500, 500, 20).name('z').onChange(function(z) {
        camera.position.z = z;
    }).listen();
    f1.open();

    var f2 = gui.addFolder('Look At');
    f2.add(params, 'lookAtX', -500, 500, 20).name('x').onChange(function(x) {
        lookAt.x = x;
        camera.lookAt(new THREE.Vector3(lookAt.x, lookAt.y, lookAt.z));
    }).listen();
    f2.add(params, 'lookAtY', -500, 500, 20).name('y').onChange(function(y) {
        lookAt.y = y;
        camera.lookAt(new THREE.Vector3(lookAt.x, lookAt.y, lookAt.z));
    }).listen();
    f2.add(params, 'lookAtZ', -500, 500, 20).name('z').onChange(function(z) {
        lookAt.z = z;
        camera.lookAt(new THREE.Vector3(lookAt.x, lookAt.y, lookAt.z));
    }).listen();
    f2.open();

    var f3 = gui.addFolder('zoom');
    f3.add(params, 'fov', 30, 180, 10).onChange(function(fov) {
        camera.setFov(fov);
    }).listen();
    f3.add(params, 'zoom', 0.4, 3.0, 0.1).onChange(function(zoom) {
        camera.setZoom(zoom);
    });
    f3.add(params, 'cameraMode', ['perspective', 'orthographic']).onFinishChange(function(mode) {
        if (mode == 'perspective') {
            camera.toPerspective();
        } else if (mode == 'orthographic') {
            camera.toOrthographic();
        }
    });
    f3.open();
}

function rotateCamera(direction) {
    lookAtScene = false;
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

function moveCameraForwardBack(direction) {
    if (direction == 'forward') {
        camera.translateZ(-2);
    } else if (direction == 'back') {
        camera.translateZ(2);
    }
    params.cameraPosX = camera.position.x;
    params.cameraPosY = camera.position.y;
    params.cameraPosZ = camera.position.z;
}
