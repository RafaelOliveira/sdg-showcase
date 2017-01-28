#ifdef GL_ES
precision mediump float;
#endif

varying vec2 texCoord;

uniform vec2 resolution;
uniform sampler2D tex;

uniform float angle;
uniform float scale;

float pattern()
{
   float s = sin(angle), c = cos(angle);
   vec2 texPos = texCoord * resolution.xy;
   vec2 point = vec2(
       c * texPos.x - s * texPos.y,
       s * texPos.x + c * texPos.y
   ) * scale;
   return (sin(point.x) * sin(point.y)) * 4.0;
}

void main()
{
   vec4 color = texture2D(tex, texCoord);
   float average = (color.r + color.g + color.b) / 3.0;
   gl_FragColor = vec4(vec3(average * 10.0 - 5.0 + pattern()), color.a);
}
