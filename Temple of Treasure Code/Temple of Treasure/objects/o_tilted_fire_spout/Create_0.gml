firebar = instance_create_layer(-100, 100, "Hazards", o_fire);
firebar.image_yscale = .5;
cd = false;
counter = 0;

enum tflames {
	wait,
	release
}

state = tflames.release;