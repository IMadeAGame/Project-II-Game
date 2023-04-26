if (counter == 60) {
	instance_destroy();
} else {
	x+=10 * image_xscale;
	y-=10;
	counter++;
}