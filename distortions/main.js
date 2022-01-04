import * as THREE from 'three'

import vert from './shaders/vertex.glsl'
import frag from './shaders/fragment.glsl'


const camera = new THREE.PerspectiveCamera(75, innerWidth / innerHeight, 0.1, 1000)
const scene = new THREE.Scene()
const renderer = new THREE.WebGL1Renderer({ antialias: true })

renderer.setSize(innerWidth, innerHeight)
renderer.setPixelRatio(window.devicePixelRatio)
document.body.appendChild(renderer.domElement)
camera.position.set(0, 0, 2)

const plane = new THREE.Mesh(new THREE.PlaneGeometry(2.5, 2.5), new THREE.ShaderMaterial({

  vertexShader: vert,
  fragmentShader: frag,
  uniforms: {
    
    photo: {
     value: new THREE.TextureLoader().load('./yeezus.jpg')
    }
  }
}))

scene.add(plane)



function animate() {
  requestAnimationFrame(animate)
  renderer.render(scene, camera)



}

animate()
