bcol.y--;
if (place_meeting(x, y + boxyspeed, o_solid)) {
	while (!place_meeting(x, y + sign(boxyspeed), o_solid)) {
		y += sign(boxyspeed);
	}
	boxyspeed = 0;
} else if (!place_meeting(x, y + 1, o_solid)){
	boxyspeed += gravity_acceleration;
	y+=boxyspeed;
} else {
	if (place_meeting(x, y + 1, o_move) and (!place_meeting(x + o_move.dir, y, o_solid))) {
		x += convspeed * o_move.dir;
	}
}
bcol.x = x;
bcol.y = y;

if (y > room_height){
	with bcol {
		instance_destroy();	
	}
	instance_destroy();
}