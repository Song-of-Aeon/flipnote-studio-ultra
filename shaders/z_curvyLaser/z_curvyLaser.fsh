//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec2 cord = v_vTexcoord.xy/20.;
	float centery = distance(cord,vec2(0.5));
	//gl_FragColor = vec4(1.,1.,1.,centery);
    gl_FragColor = mix(vec4(10.,2.,2.,2.),vec4(-4.,-4.,-4.,-2.),centery);
}
