var mesh = null;
var id = null;

function init() {
    var scene = new THREE.Scene();
    var camera = new THREE.PerspectiveCamera(90, window.innerWidth / window.innerHeight, 1, 1000);

    var renderer = new THREE.WebGLRenderer();
    renderer.setClearColor(0xEEEEEE);
    renderer.setSize(window.innerWidth, window.innerHeight);

    camera.position.set(100, 100, 100);
    camera.lookAt(scene.position);
    scene.add(camera);

    var loader = new THREE.OBJLoader(); //在init函数中，创建loader变量，用于导入模型
    loader.load('model/teapot.obj', function(obj) { //第一个表示模型路径，第二个表示完成导入后的回调函数，一般我们需要在这个回调函数中将导入的模型添加到场景中
        scene.add(obj); //将导入的模型添加到场景中
    });
    $("#WebGL").append(renderer.domElement);
    renderer.render(scene, camera);
}
