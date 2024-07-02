//
// Simple outline fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float pixelWidth;
uniform float pixelHeight;

void main()
{
	// Neighbor offset
	vec2 xOffset = vec2(pixelWidth, 0);
	vec2 yOffset = vec2(0, pixelHeight);
	
	// Get texture color + calculate new color based off of alpha
	vec4 col = texture2D( gm_BaseTexture, v_vTexcoord );
	vec4 newCol = vec4(col.r * col.a, col.g * col.a, col.b * col.a, col.a);
	
	// Set alpha based off of neighbors
	newCol.a = max(newCol.a, texture2D( gm_BaseTexture, v_vTexcoord + xOffset).a);
	newCol.a = max(newCol.a, texture2D( gm_BaseTexture, v_vTexcoord - xOffset).a);
	newCol.a = max(newCol.a, texture2D( gm_BaseTexture, v_vTexcoord + yOffset).a);
	newCol.a = max(newCol.a, texture2D( gm_BaseTexture, v_vTexcoord - yOffset).a);
	
	// Set color
    //gl_FragColor = newCol;
    gl_FragColor = col;
}
