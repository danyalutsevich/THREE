import * as THREE from 'three'
import * as dat from 'dat.gui'
import vert from './shaders/vertex.glsl'
import frag from './shaders/fragment.glsl'


const camera = new THREE.PerspectiveCamera(75, innerWidth / innerHeight, 0.1, 1000)
const scene = new THREE.Scene()
const renderer = new THREE.WebGL1Renderer(/*{ antialias: true }*/)

renderer.setSize(innerWidth, innerHeight)
// renderer.setPixelRatio(window.devicePixelRatio)
document.body.appendChild(renderer.domElement)
camera.position.set(0, 0, 2)

let uniforms = {

  time: { type: 'f', value: 0. },
  photo: { value: new THREE.TextureLoader().load('./yeezus.jpg') },
  displacement:{value: new THREE.TextureLoader().load('./yandhi.jpg')},

}


const plane = new THREE.Mesh(new THREE.PlaneGeometry(2.5, 2.5, 10, 10), new THREE.ShaderMaterial({

  vertexShader: vert,
  fragmentShader: frag,
  uniforms
  
}))

scene.add(plane)

let milliseconds=0;


function animate() {
  
  requestAnimationFrame(animate)
  renderer.render(scene, camera)
  
  milliseconds+=new Date().getMilliseconds();
  uniforms.time = {type:"f",value:milliseconds}
  
  // console.log(new Date().getMilliseconds())
}

animate()
