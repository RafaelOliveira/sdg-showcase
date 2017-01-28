#ifdef GL_ES
precision mediump float;
#endif

varying vec2 texCoord;

uniform float amount;
uniform sampler2D tex;

float rand(vec2 co)
{
    return fract(sin(dot(co.xy, vec2(12.9898, 78.233))) * 43758.5453);
}

void main()
{
    vec4 color = texture2D(tex, texCoord);

    float diff = (rand(texCoord) - 0.5) * amount;

    color.r += diff;
    color.g += diff;
    color.b += diff;

    gl_FragColor = color;
}