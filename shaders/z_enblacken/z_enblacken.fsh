//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	if(color.a == 1.){
		gl_FragColor = vec4(vec3(0.5),1);
	}
	else{
		gl_FragColor = vec4(0.);
	}
}
