hp = 3;
counter = 0;
part = 1;
hit = false;
fireobject = pointer_null;
xspeed = 0;
yspeed = 0;
acceleration = 2;
gravity_acceleration = .1;
bounce_height = -5;

enum bossstate {
	wait,
	rise,
	idle,
	dizzy,
	bash,
	bounce,
	hurt,
	phase1,
	phase2,
	phase3,
	fire
}

state = bossstate.wait;

laststate = bossstate.phase1;