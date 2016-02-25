ifdef GL_ES
precision mediump float;
#endif

#extension GL_OES_standard_derivatives : enable

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;
float check(vec2 uv) { return float((uv.x > .5 && uv.y > .5) || (uv.x < .5 && uv.y < .5)); }
#define time (time*1.5)
void main( void ) {
	vec2 uv = ( gl_FragCoord.xy / resolution.xy );
	const float lps = 32.;
	uv /= dot(uv-.5,uv-.5);

	uv -= .5;
	uv = uv/pow(2.,fract(time));


	float c = check(uv);
	float c2 = check(uv);
	for (float i = 0.; i < lps; i++) {
	    c += check(fract(uv*pow(2.,i)));
	    c2 += check(fract((uv*2.)*pow(2.,i)));
	}
	c /= lps; c2 /= lps;
	c = mix(c,c2,fract(time));
	gl_FragColor = vec4(vec3(c), 1.0 );
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}

