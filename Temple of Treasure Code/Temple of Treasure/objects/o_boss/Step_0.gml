switch(state){
	#region
	case bossstate.rise:
		if (counter == 200){
			counter = 0;
			state = bossstate.idle;
		} else {
			y -= 2;
		}
		counter++;
		break;
	#endregion
	
	#region
	case bossstate.idle:
		if (counter == 60){
			counter = 0;
			if (hp == 3){
				hit = false;
				state = bossstate.phase1;
			} else if (hp == 2){
				hit = false;
				laststate = bossstate.phase2;
				state = bossstate.phase2;
			} else {
				hit = false;
				laststate = bossstate.phase3;
				state = bossstate.phase3;
			}
		} else {
			if (y != o_player.y){
				y += sign(o_player.y - y);
			}
			counter++;
		}
		break;
	#endregion
	
	#region
	case bossstate.fire:
		if (counter == 60){
			image_index = 0;
			counter = 0;
			state = bossstate.idle;
		} else if (counter == 15) {
			fireobject = instance_create_layer(x - image_xscale * 108, y - 60, "Hazards", o_fireball);
			image_index = 2;
		} else if (counter == 30) {
			image_index = 3;
		}  else if (counter == 45) {
			image_index = 4;
		}
		counter++;
		break;
	#endregion
	
	#region
	case bossstate.bash:
		if (counter <= 120){
			image_index = 5;
			if (y != o_player.y){
				y += 2 *sign(o_player.y - y);
			}
		} else if ((x <= 128 and image_xscale == 1) or (x >= 608 and image_xscale == -1)) {
			show_debug_message(hit);
			image_blend = c_white;
			image_index = 0;
			image_xscale *= -1
			counter = 0;
			if (hit) {
				part = 1;
			} else {
				part++;
			}
			state = laststate;
		} else if (counter >= 180){
			x -= 10 * image_xscale;
		} else {
			image_blend = c_dkgray;
		}
		counter++;
		break;
	#endregion
	
	#region
	case bossstate.bounce:
		if ((x <= 128 and image_xscale == 1) or (x >= 608 and image_xscale == -1)){
			show_debug_message(hit);
			image_index = 0;
			image_xscale *= -1
			counter = 0;
			yspeed = 0;
			xspeed = 0;
			if (hit) {
				part = 1;
			} else {
				part++;
			}
			state = laststate;
		} else {
			if (place_meeting(x, y, o_solid)) {
				while (place_meeting(x, y, o_solid)) {
					y -= 1;
				} 
			}
			image_index = 1;
			x += xspeed
			if (place_meeting(x, y + yspeed, o_solid)) {
				while (!place_meeting(x, y + sign(yspeed), o_solid)) {
					y += sign(yspeed);
				}
				yspeed = bounce_height;
				xspeed -= acceleration * image_xscale
			} else {
				yspeed += gravity_acceleration;
				y += yspeed;
			}
		}
		break;
	#endregion
	
	#region
	case bossstate.hurt:
		if (hp >= 1){
			image_blend = c_red;
			image_index = 1;
			alarm[1] = room_speed * 3;
			state = bossstate.wait;
		} else {
			image_index = 1;
			if (counter < room_speed){
				y-=8;
			}else if (counter >= room_speed and counter < room_speed * 2){
				image_yscale = -1;
				y+=16;
			}else if (counter >= room_speed * 3){
				tele = instance_create_layer(704, 0, "Level", o_next_teleport);
				tele.image_yscale = 14;
				instance_destroy();
			}
			counter++;
		}
		break;
	#endregion
	
	#region
	case bossstate.phase1:
		hit = false;
		if (part == 1){
			state = bossstate.bounce;
		} else {
			image_index = 6;
			state = bossstate.dizzy;
		}
		break;
	#endregion
	
	#region
	case bossstate.phase2:
		hit = false;
		if (part == 1){
			state = bossstate.bash;
		} else if (part == 2) {
			state = bossstate.bounce;
		}  else {
			image_index = 6;
			state = bossstate.dizzy;
		}
		break;
	#endregion
	
	#region
	case bossstate.phase3:
		hit = false;
		if (!fireobject){
			state = bossstate.fire;
		} else if (part == 1){
			state = bossstate.bash;
		} else if (part == 2) {
			state = bossstate.bash;
		} else if (part == 3) {
			state = bossstate.bounce;
		}  else {
			image_index = 6;
			state = bossstate.dizzy;
		}
		break;
	#endregion
	
	#region
	case bossstate.dizzy:
		part = 1;
		if (fireobject){
			with(fireobject){
				instance_destroy();
			}
			fireobject = pointer_null;
		}
		if (counter == 300) {
			counter = 0;
			image_index = 0;
			state = bossstate.idle;
		}
		if (counter % 25 == 0) {
			if (image_index <= 8){
				image_index += 1;
			} else {
				image_index = 6;
			}
		}
		if (place_meeting(x, y + yspeed, o_solid)) {
			while (!place_meeting(x, y + sign(yspeed), o_solid)) {
				y += sign(yspeed);
			}
			yspeed = 0;
		} else {
			yspeed += gravity_acceleration;
			y += yspeed;
		}
		counter++;
		break;
	#endregion
}