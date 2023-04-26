switch(state){
	#region
	case tflames.wait:
		if (not cd){
			counter = 0;
			firebar.image_yscale = .5
			state = tflames.release;
		}
		break;
	#endregion
	
	#region
	case tflames.release:
		cd = true;
		firebar.x = x + 62 * sign(image_yscale);
		firebar.y = y - 13;
		firebar.image_angle = image_angle;
		if (counter <= 20){
			firebar.image_yscale += .25 * sign(image_yscale);
		} else if (counter >= 180 and counter < 200) {
			firebar.image_yscale -= .25 * sign(image_yscale);
		} else if (counter > 200) {
			firebar.x = -100;
			firebar.y = 100;
			alarm[0] = room_speed * 5;
			state = tflames.wait;
		}
		counter++;
		break;
	#endregion
}