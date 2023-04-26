up = keyboard_check(vk_up);

switch(state){
	#region
	case bouncer.idle:
	if (place_meeting(x, y + yspeed, o_solid)) {
			while (!place_meeting(x, y + sign(yspeed), o_solid)) {
				y += sign(yspeed);
			}
			yspeed = 0;
		} else if (!place_meeting(x, y + 1, o_solid)){
			yspeed += gravity_acceleration;
			y+=yspeed;
		} else if (not cd){
			yspeed = -10;
			y += yspeed;
			state = bouncer.jump;
		}
		break;
	#endregion
	
	#region
	case bouncer.jump:
		yspeed += gravity_acceleration;
		if (image_index <= 2){
			image_index++;
		}
		if (!place_meeting(x, y + 1, o_solid)) {
			y += yspeed;
		} else {
			image_index = 0;
			alarm[3] = room_speed;
			cd = true;
			state = bouncer.idle;
		}
		
		break;
	#endregion
}