if (place_meeting(x - 1, y, o_solid) or place_meeting(x + 1, y, o_solid)) {
	image_xscale *= -1;
}

if (place_meeting(x, y - 1, o_solid) or place_meeting(x, y + 1, o_solid)) {
	image_yscale *= -1;
}

x-=image_xscale;
y-=image_yscale;