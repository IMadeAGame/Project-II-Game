switch(state){
	#region
	case sflames.wait:
		image_index = 1;
		firebar.x = -100;
		firebar.y = 100;
		if (not global.blue){
			state = sflames.release;
		}
		break;
	#endregion
	
	#region
	case sflames.release:
		image_index = 0;
		firebar.x = x + 13;
		firebar.y = y + 62 + ((sign(image_yscale) + -1) * 5);
		if (global.blue){
			state = sflames.wait;
		}
		break;
	#endregion
}