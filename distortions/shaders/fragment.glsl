
uniform float time;
uniform sampler2D photo;
uniform sampler2D displacement;
varying vec2 vUv;
varying vec3 vertexNormal;

void main(){
    
    vec3 disp = texture2D(displacement,vUv).xyz;

    vec2 dispvUv = vec2(vUv.x +0.01*sin(vUv.y*+time/30.),vUv.y);
    // vec2 dispvUv = vec2(vUv.x +disp.x,vUv.y);

    vec3 ph = texture2D(photo,dispvUv).xyz;
    




    gl_FragColor=vec4(ph,1.);
    // gl_FragColor=vec4(time/10.);
    
}
