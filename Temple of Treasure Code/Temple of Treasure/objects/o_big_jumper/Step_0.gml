up = keyboard_check(vk_up);

switch(state){
	#region
	case bigjumper.idle:
		if (up and not cd){
			yspeed = -9;
			y += yspeed;
			state = bigjumper.jump;
		}
		break;
	#endregion
	
	#region
	case bigjumper.jump:
		yspeed += gravity_acceleration;
		if (image_index <= 2){
			image_index++;
		}
		if (!place_meeting(x, y + 1, o_solid)) {
			y += yspeed;
		} else {
			image_index = 0;
			alarm[2] = room_speed * 2;
			cd = true;
			state = bigjumper.idle;
		}
		
		break;
	#endregion
}