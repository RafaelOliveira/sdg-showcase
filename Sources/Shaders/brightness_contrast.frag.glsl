#ifdef GL_ES
precision mediump float;
#endif

varying vec2 texCoord;

uniform sampler2D tex;
uniform float brightness;
uniform float contrast;

void main()
{
    vec4 color = texture2D(tex, texCoord);
    color.rgb += brightness;

    if (contrast > 0.0)
        color.rgb = (color.rgb - 0.5) / (1.0 - contrast) + 0.5;
    else
        color.rgb = (color.rgb - 0.5) * (1.0 + contrast) + 0.5;
    
    gl_FragColor = color;
}