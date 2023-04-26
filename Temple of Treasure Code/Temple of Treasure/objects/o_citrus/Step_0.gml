switch(state){
	#region
	case citrus.moveleft:
		at_wall_left = place_meeting(x-1, y, o_solid);
		floor_left = place_meeting(x-16, y+1, o_solid);
		if (place_meeting(x, y + yspeed, o_solid)) {
			while (!place_meeting(x, y + sign(yspeed), o_solid)) {
				y += sign(yspeed);
			}
			yspeed = 0;
		} else if (!place_meeting(x, y + 1, o_solid)){
			yspeed += gravity_acceleration;
			y+=yspeed;
		}
		if (at_wall_left or !floor_left){
			state = citrus.moveright;
		}
		x--;
		image_xscale = -1;
		break;
	#endregion
	
	#region
	case citrus.moveright:
		at_wall_right = place_meeting(x+1, y, o_solid);
		floor_right = place_meeting(x+16, y+1, o_solid);
		if (place_meeting(x, y + yspeed, o_solid)) {
			while (!place_meeting(x, y + sign(yspeed), o_solid)) {
				y += sign(yspeed);
			}
			yspeed = 0;
		} else if (!place_meeting(x, y + 1, o_solid)){
			yspeed += gravity_acceleration;
			y+=yspeed;
		}
		if (at_wall_right or !floor_right){
			state = citrus.moveleft;
		}
		x++;
		image_xscale = 1;
		break;
	#endregion
}