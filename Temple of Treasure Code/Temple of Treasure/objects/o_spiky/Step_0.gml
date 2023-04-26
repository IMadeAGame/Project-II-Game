switch(state){
	#region
	case spiky.moveleft:
		at_wall_left = place_meeting(x-1, y, o_solid);
		floor_left = place_meeting(x - 24, y+2, o_solid);
		if (at_wall_left or !floor_left){
			state = spiky.moveright;
		}
		x--;
		image_xscale = 1;
		break;
	#endregion
	
	#region
	case spiky.moveright:
		at_wall_right = place_meeting(x+1, y, o_solid);
		floor_right = place_meeting(x + 24, y+2, o_solid);
		if (at_wall_right or !floor_right){
			state = spiky.moveleft;
		}
		x++;
		image_xscale = -1;
		break;
	#endregion
}