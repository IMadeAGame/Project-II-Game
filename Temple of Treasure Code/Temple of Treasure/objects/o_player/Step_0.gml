#region
right = keyboard_check(vk_right);
left = keyboard_check(vk_left);
up = keyboard_check(vk_up);
down = keyboard_check(vk_down);
shift = keyboard_check(vk_shift);
up_release = keyboard_check_released(vk_up);
#endregion
// CREDIT FOR PARTS OF GRAVITY AND COLLISION HANDLING GOES TO East Pennsboro High School, 2019, Video Game Production, Spring Semester Senior Year, Joseph Gabriel

#region State Machine
switch (state) {
#region Move State
	case player.moving:
		if (xspeed == 0) {
			sprite_index = player_idle;
		} else {
			sprite_index = player_walk;
		}
		if (!place_meeting(x, y + 1, o_solid)) {
			sprite_index = player_jump;
			image_index = (yspeed > 0);
			
			yspeed += gravity_acceleration;
			
			if (up_release and yspeed < -6) {
				yspeed = -3;
			}
		} else {
			yspeed = 0;
			if (up) {
				yspeed = jump_height;
			}
		}
		
		if (xspeed != 0) {
			image_xscale = sign(xspeed);
		}
		
		if (right or left) {
			xspeed += (right - left) * acceleration;
			xspeed = clamp(xspeed, -max_speed, max_speed);
		} else {
			apply_friction();
		}
		
		if (y > room_height){
			x = startx;
			y = starty;
			if (not hurt) {
				take_damage();
			}
		}
		
		if (shift) {
			counter = 0;
			state = player.bash;
		}
		
		if (place_meeting(x, y, o_solid)){
			y--;
		}
		move(o_solid,o_move);
		break;
#endregion
#region Bash State
	case player.bash:
		sprite_index = player_bash;
		xspeed = 10 * sign(image_xscale);
		if (!place_meeting(x, y + 1, o_solid)) {
			yspeed += gravity_acceleration;
		} else {
			yspeed = 0;
		}
		move(o_solid,o_move);
		counter++;
		if (counter >= 16 or place_meeting(x+1, y, o_solid)){
			state = player.moving;
		}
		break;
#endregion
#region Death State
	case player.death:
		sprite_index = player_hurt;
		if (counter < room_speed){
			y-=2;
		}else if (counter >= room_speed and counter < room_speed * 2){
			image_yscale = -1;
			y+=8;
		}else if (counter >= room_speed * 3){
			room_goto(r_title);
		}
		counter++;
		break;
#endregion
#region Climb State
	case player.climb:
		sprite_index = player_climb;
		if (place_meeting(x, y, o_ladder)) {
			
			if (up and !place_meeting(x, y - 2, o_solid)){
				y-=2;
				climbing = true;
			} else if (down and !place_meeting(x, y + 2, o_solid)){
				y+=2;
				climbing = true;
			}
			if (left and !place_meeting(x - 1, y, o_solid)){
				x--;
				climbing = true;
			} else if (right and !place_meeting(x + 1, y, o_solid)){
				x++;
				climbing = true;
			}
			if (!up and !down and !left and !right){
				climbing = false;
			}
			if (climbing) {
				image_index ++;
			}
		} else {
			yspeed = 0;
			state = player.moving;
		}
		break;
#endregion
}
#endregion