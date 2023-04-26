switch(state){
	#region
	case spawn3.wait:
		if (not launchcd){
			state = spawn3.release;
		}
		break;
	#endregion
	
	#region
	case spawn3.release:
		newbox = instance_create_layer(x, y, "Hazards", o_box);
		launchcd = true;
		alarm[0] = room_speed * 5;
		state = spawn3.wait;
		
		break;
	#endregion
}