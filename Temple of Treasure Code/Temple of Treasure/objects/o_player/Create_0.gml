max_speed = 4;
xspeed = 0;
yspeed = 0;
convspeed = 2;
acceleration = 1;
gravity_acceleration = .5;
jump_height = -9;
counter = 0;
hurt = false;
climbing = false;
startx = x;
starty = y;

enum player {
	moving,
	bash,
	death,
	climb
}

state = player.moving;