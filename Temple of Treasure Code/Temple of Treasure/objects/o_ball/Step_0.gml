if (place_meeting(x, y + ballyspeed, o_solid)) {
	while (!place_meeting(x, y + sign(ballyspeed), o_solid)) {
		y += sign(ballyspeed);
	}
	ballyspeed = 0;
} else if (!place_meeting(x, y + 1, o_solid)){
	ballyspeed += gravity_acceleration;
	y+=ballyspeed;
} else {
	if (place_meeting(x, y + 1, o_move) and (!place_meeting(x + o_move.dir, y, o_solid))) {
		x += ballxspeed + convspeed * o_move.dir;
	} else {
		x += ballxspeed;
	}
}

if (place_meeting(x, y, o_solid)){
	instance_destroy();
}

if (y > room_height){
	instance_destroy();
}