firebar = instance_create_layer(-100, 100, "Hazards", o_fire);
firebar.image_yscale = 5;

enum sflames2 {
	wait,
	release
}

state = sflames2.wait;