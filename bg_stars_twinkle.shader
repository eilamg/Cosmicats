shader_type canvas_item;


uniform sampler2D noise_texture;

float random (vec2 st) {
    // From the Book of Shaders
    return fract(sin(dot(st.xy, vec2(12.9898,78.233)))* 43758.5453123);
}


void fragment() {
    vec4 col = texture(TEXTURE, UV);
    float noise = pow(random(UV + TIME / 10000000.), 0.1);
    
    COLOR = col * noise;
    COLOR.a = col.a;
}