switch(state){
	#region
	case flames.wait:
		if (not cd){
			counter = 0;
			firebar.image_yscale = .5
			state = flames.release;
		}
		break;
	#endregion
	
	#region
	case flames.release:
		cd = true;
		firebar.x = x + 13;
		firebar.y = y + 62 * sign(image_yscale);
		if (counter <= 20){
			firebar.image_yscale += .25 * sign(image_yscale);
		} else if (counter >= 180 and counter < 200) {
			firebar.image_yscale -= .25 * sign(image_yscale);
		} else if (counter > 200) {
			firebar.x = -100;
			firebar.y = 100;
			alarm[0] = room_speed * 5;
			state = flames.wait;
		}
		counter++;
		break;
	#endregion
}