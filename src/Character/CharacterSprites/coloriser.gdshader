shader_type canvas_item;

uniform float red = 0.5;
uniform float green = 0.1;
uniform float blue = 0.2;

void fragment() {
	vec4 color = texture(TEXTURE, UV);
	
	color *= vec4(red, green, blue, 1);
	
	COLOR = color;
}
