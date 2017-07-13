#version 450

#ifdef GL_ES
precision mediump float;
#endif

in vec2 texCoord;
in vec4 color;
out vec4 fragColor;

uniform sampler2D tex;

uniform float amount;
uniform float diff;


float rand(vec2 co)
{
    return fract(sin(dot(co.xy, vec2(12.9898, 78.233))) * 43758.5453);
}

void main()
{
    vec4 color = texture(tex, texCoord);

    float diff = (rand(texCoord) - 0.5) * amount;

    color.r += diff;
    color.g += diff;
    color.b += diff;

    fragColor = color;
}