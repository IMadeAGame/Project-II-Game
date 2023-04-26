switch(state){
	#region
	case spawn2.wait:
		if (not launchcd){
			state = spawn2.release;
		}
		break;
	#endregion
	
	#region
	case spawn2.release:
		newball = instance_create_layer(x, y + 32, "Hazards", o_ball);
		launchcd = true;
		alarm[0] = room_speed * 5;
		state = spawn2.wait;
		
		break;
	#endregion
}