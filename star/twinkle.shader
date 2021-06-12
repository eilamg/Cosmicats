shader_type canvas_item;

uniform vec4 color1 : hint_color;
uniform vec4 color2 : hint_color;
uniform float twinkle_speed : hint_range(0, 10);

uniform float brightness : hint_range(0, 1);
uniform float contrast : hint_range(0, 1);

uniform sampler2D noise_texture;


vec4 apply_brightness_contrast(in vec4 col) {
    col.rgb /= col.a;
    col.rgb = ((col.rgb - 0.5) * contrast) + 0.5;
    col.rgb += brightness;
    col.rgb *= col.a;
    
    return col;
}


vec4 lerp_colors(in vec4 col1, in vec4 col2, in float w) {
    return col1 * (w) + col2 * (1.0 - w);
}


float sin01(in float x) {
    return (sin(x) + 1.0) / 2.0;
}


void fragment() {
    vec4 tex = texture(TEXTURE, UV);
    // tex = apply_brightness_contrast(tex);
    COLOR = lerp_colors(tex, color1, texture(noise_texture, vec2(pow(sin01(TIME * 0.1), 9.0))).x);
    COLOR.a = tex.a;
}