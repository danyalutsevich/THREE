//thanks Yuri Artiukh for your tutorials
// AND ALSO THANKS TO The Art of Code VIDEO https://www.youtube.com/watch?v=6IWXkV82oyY

uniform float time;
uniform float rotation;
uniform float progress;
uniform float Cy;
uniform float Cx;

uniform vec3 mouse;

varying vec2 vUv;
varying vec3 vertexNormal;
varying vec3 vPosition;

// vec2 rotate(vec2 v,float a){
//     float s=sin(a/2.);
//     float c=cos(a/2.);
//     mat2 m=mat2(c*2.,-s*2.,s*2.,c*2.)*2.;
//     return m*v;
// }

// float map(float value,float min1,float max1,float min2,float max2){
//     return min2+(value-min1)*(max2-min2)/(max1-min1);
// }

const float maxIterations=1000.;

float value(float x, float y, float Cx1, float Cy1) {

	float z1 = x;
	float z2 = y;


	for (float i=0.;i < maxIterations;i+=1.) {

		z1 += (z1 * z1) - (z2 * z2) + Cx;

		z2 += (2.* z1 * z2) + Cy;

		if ((z1 * z1) + (z2 * z2) >= 4.) {

			return i;
		}
		// i++;
	}

	return maxIterations;

}




void main(){
    
   float color = value(vUv.x*5.-2.5,vUv.y*5.-2.5,Cx,Cy);

//    float color = value(0.,0.,vUv.x,vUv.y);

    // float color = 1.
    color= color/(maxIterations/40.);
    gl_FragColor = vec4(color+0.1,color+0.3,color+0.1,1.);

    
}
