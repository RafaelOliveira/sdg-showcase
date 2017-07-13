#version 450

#ifdef GL_ES
precision mediump float;
#endif

in vec2 texCoord;
in vec4 color;
out vec4 fragColor;

uniform sampler2D tex;
uniform vec2 resolution;

uniform vec2 point;
uniform vec2 texPos;
uniform vec3 colorProcess;

uniform float average;

uniform float angle;
uniform float scale;
uniform float c;
uniform float s;

float patternz()
{
   float s = sin(angle), c = cos(angle);
   vec2 texPos = texCoord * resolution.xy;
   vec2 point = vec2(c * texPos.x - s * texPos.y, s * texPos.x + c * texPos.y) * scale;

   return (sin(point.x) * sin(point.y)) * 4.0;
   
}

void main()
{
    vec4 color = texture(tex, texCoord);
    float average = (color.r + color.g + color.b) / 3.0;

    fragColor = vec4(vec3(average * 10.0 - 5.0 + patternz()), color.a);    
}