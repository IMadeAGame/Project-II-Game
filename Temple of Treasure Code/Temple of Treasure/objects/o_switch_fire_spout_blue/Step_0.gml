switch(state){
	#region
	case sflames2.wait:
		image_index = 1;
		firebar.x = -100;
		firebar.y = 100;
		if (global.blue){
			state = sflames2.release;
		}
		break;
	#endregion
	
	#region
	case sflames2.release:
		image_index = 0;
		firebar.x = x + 13;
		firebar.y = y + 62 + ((sign(image_yscale) + -1) * 5);;
		if (not global.blue){
			state = sflames2.wait;
		}
		break;
	#endregion
}