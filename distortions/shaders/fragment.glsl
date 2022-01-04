
uniform sampler2D photo;
varying vec2 vUv;
varying vec3 vertexNormal;

void main(){
    
    gl_FragColor=vec4(texture2D(photo,vUv).xyz,1.);
    
}
