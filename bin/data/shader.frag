#version 120

#define BORDER_SIZE 2

void main()
{
	float xVal = gl_FragCoord.x;
	float yVal = gl_FragCoord.y;
	
	gl_FragColor = gl_Color;
	
	//we use the mod function to only draw pixels if they are every 2 in x or every 4 in y
	if( mod(xVal/4, 2.0) == 0.5 ) {
		//gl_FragColor.xy = vec2(0.1, 0.9);
	}

	vec3 n;
	
	n.xy = gl_PointCoord * 2.0 - 1.0;
	n.z = 1.0 - dot(n.xy, n.xy);
	gl_FragColor.a = n.z;
	if (n.z < 0.0) discard;
	
	return;
}
