#version 120

uniform float elapsedTime;

//generate a random value from four points
vec4 rand(vec2 A,vec2 B,vec2 C,vec2 D){ 

	vec2 s=vec2(12.9898,78.233); 
	vec4 tmp=vec4(dot(A,s),dot(B,s),dot(C,s),dot(D,s)); 

	return fract(sin(tmp) * 43758.5453)* 2.0 - 1.0; 
} 

//this is similar to a perlin noise function
float noise(vec2 coord,float d){

	vec2 C[4]; 

	float d1 = 1.0/d;

	C[0]=floor(coord*d)*d1; 

	C[1]=C[0]+vec2(d1,0.0); 

	C[2]=C[0]+vec2(d1,d1); 

	C[3]=C[0]+vec2(0.0,d1);


	vec2 p=fract(coord*d); 

	vec2 q=1.0-p; 

	vec4 w=vec4(q.x*q.y,p.x*q.y,p.x*p.y,q.x*p.y); 

	return dot(vec4(rand(C[0],C[1],C[2],C[3])),w); 
} 

vec3 rgb2hsv(vec3 c)
{
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}

vec3 hsv2rgb(vec3 c)
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

void main(){

	gl_TexCoord[0] = gl_MultiTexCoord0;

	//get our current vertex position so we can modify it
	vec4 pos = gl_ProjectionMatrix * gl_ModelViewMatrix * gl_Vertex;

	vec4 col = gl_Color;
	float n = noise( -elapsedTime*5 + vec2(sin(pos.z/100) + pos.y*100, 100), 1.0);
	gl_PointSize = n * 8 + 10;
	
	float th = 0.9;
	vec4 gridCol = vec4(0.0, n, 1.0, 1.0);
	vec4 decr = vec4(n*2, n*2, 0.7, 1.0);
	if( mix(0.0, 1.0, step(fract(pos.z*200.0+sin(elapsedTime*4.0)), 0.5)) < 1.0 ) {
		col = gridCol;
	} else {
		col = decr;
	}
	//finally set the pos to be that actual position rendered
	gl_Position = pos;
	
	vec3 hsb = rgb2hsv(col.xyz);
	hsb.x += fract(elapsedTime*0.001);
	col.xyz = hsv2rgb(hsb);
	
	gl_FrontColor = col;
}
