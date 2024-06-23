//
// Simple passthrough fragment shade
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float percent;
void main()
{
	vec4 color = texture2D(gm_BaseTexture,v_vTexcoord);
	vec2 mid = vec2(0.5)-v_vTexcoord;
	float deg = (180.+degrees(atan(mid.x,-mid.y)));
	if(deg > percent*360.){
		color.a = 0.;
	}
	gl_FragColor = color;
	
}