#version 450

#ifdef GL_ES
precision mediump float;
#endif

in vec2 texCoord;
in vec4 color;
out vec4 fragColor;

uniform sampler2D tex;
uniform float brightness;
uniform float contrast;

void main()
{
    vec4 color = texture(tex, texCoord);
    color.rgb += brightness;

    if (contrast > 0.0)
    {
        color.rgb = (color.rgb - 0.5) / (1.0 - contrast) + 0.5;
    }
    else
    {
        color.rgb = (color.rgb - 0.5) * (1.0 + contrast) + 0.5;
    }
    
    fragColor = color;

}