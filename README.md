此项目为福州大学2016上学期图形学实践课程 实验三完整项目代码
演示地址：http://123.207.227.220/uploads/webgl/exp3/exp3.html

此项目基于 three.js r82 编写
three.js 官方网址：https://threejs.org
three.js 中文文档：http://techbrood.com/threejs/docs/

---
# 一、使用说明
1. 方向键旋转相机镜头（即环视）
2. WASD 移动相机（即相机的移动）
3. Q/E 绕 Y 轴旋转相机
4. 滑轮或 F/B 前进/后退相机
5. 鼠标拖拽可使照相机绕以原点为中心的球做旋转
6. 其他操作在右侧的 dat.gui 面板上

该项目使用了本地纹理和模型，由于 JS 跨域调用问题，如果在本地运行该项目需要建立本地服务器
或者直接挂自己服务器上

使用 python 的 SimpleHTTPServer 模块建立本地服务器：
```python
pip install SimpleHTTPServer
#已安装过 SimpleHTTPServer 模块的可以不用执行上一步
#进入项目根目录后运行
python -m SimpleHTTPServer
#默认本地服务器地址为 0.0.0.0:8000
```
具体方法和其他运行方式可以查阅《WebGL编程指南》

# 二、外部 js 文件
1. three.js
    three.js 项目地址：https://github.com/mrdoob/three.js
    three.js 更新日志：https://github.com/mrdoob/three.js/wiki/Migration-Guide
    如果使用更高的版本无法运行该项目，请自行查阅更新日志进行针对修改

2. CombinedCamera.js
    用于实现组合相机（正交+透视），为 three.js 官方示例中用到的库
    ```javascript
    var camera;
    //参数分别为：width, height, fov, 透视相机 near, 透视相机 far, 正交相机 near, 正交相机 far
    camera = new THREE.CombinedCamera(window.innerWidth, window.innerHeight, 70, 1, 6000, -1, 6000);
    //设置位置
    camera.position.set(200, 200, 200);
    //注意设置 lookAt 的时候参数必须是一个 THREE.Vector3 对象，直接传三个值会不起作用
    camera.lookAt(new THREE.Vector3(lookAt.x, lookAt.y, lookAt.z));
    scene.add(camera);
    ```
    如果需要获得最新的版本，请自行 clone three.js 源项目代码，文件在 threejs-master/examples/js/camera 目录中
    具体用法请参阅官方文档的 combinedCamera 部分

3. OBJLoader.js / MTLLoader.js
    分别用于加载模型和模型材质，为 three.js 官方示例中使用到的库
    ```js
    var mtlLoader = new THREE.MTLLoader();
    mtlLoader.setPath('model/');    //这句不写下面用绝对路径也可以
    mtlLoader.load('teapot.mtl', function(materials) {
        materials.preload();
        //加载 obj 文件
        var objLoader = new THREE.OBJLoader();
        objLoader.setMaterials(materials);
        objLoader.load('model/teapot.obj', function(object) {
            object.position.set(0, 0, 0);
            scene.add(object);
            //注意这两个函数是异步加载的
            //所以一定要在这里调用含有 requestAnimationFrame() 方法的函数（本实验中是 render())
            render();
        });
    });
    ```
    如果需要获得最新的版本，请自行 clone three.js 源项目代码，这两个文件在 threejs-master/examples/js/loaders 目录中
    具体用法请参阅 three.js 官方文档的 MTLLoader 和 OBJLoader 部分，或本项目中对应代码段

4. OrbitControls.js
    球状轨道控制，为 three.js 官方示例中使用到的库
    本项目中用于支持拖拽事件、 Q/E 健响应事件和滚轮事件
    ```javascript
    var controls = new THREE.OrbitControls(camera, renderer.domElement);
    controls.target.set(0, 0, 0); //设置中心
    ```
    本程序中自己实现了键盘响应逻辑因此禁用了其自带的键盘事件
    ~~其实滚轮事件本来也是自己写的，但是写出来没它滑得顺畅就用它的了~~
    其他使用方法可以参阅 three.js 的 example 中关于 orbitControls 的示例如：https://threejs.org/examples/?q=orbit#misc_controls_orbit
    如果需要获得最新的版本，请自行 clone three.js 源项目代码，文件在 threejs-master/examples/js/controls 目录中

5. dat.gui
    一个轻量级的 js 变量控制库，即本项目中右侧的控制面板
    项目地址：https://github.com/dataarts/dat.gui
    具体用法请参阅官方示例：http://workshop.chromeexperiments.com/examples/gui

# 三、其他
1. 本实验中引入的茶壶模型是 MagicaVoxel 软件自带的模型。
    注意 WebGL 原生 API 不支持导入 3D 模型，three.js 仅支持导入 .obj 格式模型
    由于本实验不以建模为主，因此不讨论建模相关问题，感兴趣请移步该软件项目地址：http://ephtracy.github.io
2. 请不要用 IE11 和 chrome 18 以下的浏览器跑这个项目谢谢
3. 没有在 FF 上测试兼容性，如果有问题请换 Chrome
4. 如果有哪里看不懂可以给我提 issue ~~我不一定会看得到~~
