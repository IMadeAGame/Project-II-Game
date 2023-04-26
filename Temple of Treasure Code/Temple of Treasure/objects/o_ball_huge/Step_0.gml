x += ballxspeed
if (place_meeting(x, y + ballyspeed, o_solid)) {
	while (!place_meeting(x, y + sign(ballyspeed), o_solid)) {
		y += sign(ballyspeed);
	}
	
	ballyspeed = bounce_height;
	if (ballxspeed > max_ball_speed){
		ballxspeed -= acceleration
	}
} else {
	ballyspeed += gravity_acceleration;
	y += ballyspeed;
}

if (place_meeting(x, y, o_solid)){
	instance_destroy();
}

if (y > room_height){
	instance_destroy();
}