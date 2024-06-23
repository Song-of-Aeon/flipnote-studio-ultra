//
// Simple passthrough fragment shade
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 in_TexCoord;

uniform float pixelW;
uniform float pixelH;
uniform vec4 theColor;
uniform float progress;
uniform float outlineSize;

void main()
{
	float prog = 0.5;
	float alpha = texture2D(gm_BaseTexture,v_vTexcoord).a;
	alpha += texture2D(gm_BaseTexture,v_vTexcoord + vec2(pixelW*outlineSize,0.0)).a;
	alpha += texture2D(gm_BaseTexture,v_vTexcoord - vec2(pixelW*outlineSize,0.0)).a;
	alpha += texture2D(gm_BaseTexture,v_vTexcoord + vec2(0.0,pixelH*outlineSize)).a;
	alpha += texture2D(gm_BaseTexture,v_vTexcoord - vec2(0.0,pixelH*outlineSize)).a;
	
	vec2 mid = vec2(0.5)-v_vTexcoord;
	float deg = (180.+degrees(atan(mid.x,-mid.y)));
	
	gl_FragColor = v_vColour * texture2D(gm_BaseTexture,v_vTexcoord);
	if(deg >= progress*360. && gl_FragColor.a == 1.0){
		gl_FragColor.a = 0.25;
	}
	
	if(gl_FragColor.a == 0.0 && alpha > 0.0){
		
		//if( >= progress * 360.){
		
		if(deg <= progress*360.){
			gl_FragColor = theColor;
		}
	}
	
		//}
}