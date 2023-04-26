/// @description move(collision_object)
/// @param collision_object

// CREDIT FOR PARTS OF GRAVITY AND COLLISION HANDLING GOES TO East Pennsboro High School, 2019, Video Game Production, Spring Semester Senior Year, Joseph Gabriel

function move(collision_object,collision_object2) {
	// X Collision
	if (place_meeting(x + xspeed, y, collision_object)) {
		while (!place_meeting(x + sign(xspeed),y, collision_object)) {
			x += sign(xspeed);
		}
		xspeed = 0;
	}
	if (place_meeting(x, y + 1, collision_object2) and (!place_meeting(x + collision_object2.dir, y, collision_object))) {
		col = instance_place(x, y + 1, collision_object2);
		x += xspeed + convspeed * col.dir;
	} else {
		x += xspeed;
	}
	
	// Y Collison
	if (place_meeting(x, y + yspeed, collision_object)) {
		while (!place_meeting(x, y + sign(yspeed), collision_object)) {
			y += sign(yspeed);
		}
		yspeed = 0;
	}
	
	y += yspeed;
}