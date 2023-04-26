switch(state){
	#region
	case spawn.wait:
		if (not launchcd){
			state = spawn.release;
		}
		break;
	#endregion
	
	#region
	case spawn.release:
		newball = instance_create_layer(x, y + 64, "Hazards", o_ball_huge);
		launchcd = true;
		alarm[0] = room_speed * 5;
		state = spawn.wait;
		
		break;
	#endregion
}