switch(state){
	#region
	case bat.idle:
		var dis = point_distance(x, y, o_player.x, o_player.y);
		if (dis <= sight){
			state = bat.fly;	
		}
		break;
	#endregion
	
	#region
	case bat.fly:
		if (counter % 60 == 0){
			ydir *= -1
			image_index++;
		}
		if (counter % 20 == 0){
			image_index++;
		}
		y += ydir
		x-=xspeed;
		if (x < 0){
			instance_destroy();	
		}
		counter++;
		break;
	#endregion
}