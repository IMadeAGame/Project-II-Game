// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function take_damage(){
	o_player.hurt = true;
	global.hp--;
	if (global.hp == 0) {
		o_player.counter = 0;
		state = player.death;
	} else {
		image_blend = make_colour_rgb(220, 100, 100);
		alarm[0] = room_speed * 3;
	}
}