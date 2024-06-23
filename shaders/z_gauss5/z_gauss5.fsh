// gaussian blur shader translated to gml glsl by me. find og source below.
// https://github.com/Jam3/glsl-fast-gaussian-blur
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 resolution;
uniform vec2 direction;
uniform float shadowstrength;

vec4 blur5(sampler2D image, vec2 uv, vec2 resolution, vec2 direction) {
  vec4 color = vec4(0.0);
  vec2 off1 = vec2(1.3333333333333333) * direction;
  color += texture2D(image, uv) * 0.29411764705882354;
  color += texture2D(image, uv + (off1 / resolution)) * 0.35294117647058826;
  color += texture2D(image, uv - (off1 / resolution)) * 0.35294117647058826;
  color.a *= shadowstrength;
  return color;
}


void main()
{
    gl_FragColor = v_vColour * blur5(gm_BaseTexture,v_vTexcoord,resolution,direction);
}