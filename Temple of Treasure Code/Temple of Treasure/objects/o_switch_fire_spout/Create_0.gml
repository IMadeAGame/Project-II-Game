firebar = instance_create_layer(-100, 100, "Hazards", o_fire);
firebar.image_yscale = 5;

enum sflames {
	wait,
	release
}

state = sflames.release;