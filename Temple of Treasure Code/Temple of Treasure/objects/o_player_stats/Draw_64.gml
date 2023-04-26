if (room == r_title) {
	global.blue = false;
	global.pink = true;
	draw_set_halign(fa_center);
	draw_set_font(f_title);
	draw_text_colour(room_width / 2 + 4, 24 + 6, "Temple of Treasure", c_black, c_black, c_black, c_black, 1);
	draw_text_colour(room_width / 2, 24, "Temple of Treasure", c_white, c_white, c_white, c_white, 1);
	draw_set_font(f_small);
	if (global.completed_levels[0]){
		draw_text_colour(room_width / 2 + 104, 96, "COMPLETE", c_black, c_black, c_black, c_black, 1);
		draw_text_colour(room_width / 2 + 100, 90, "COMPLETE", c_yellow, c_yellow, c_lime, c_lime, 1);
	}
	if (global.completed_levels[1]){
		draw_text_colour(room_width / 2 + 104, 166, "COMPLETE", c_black, c_black, c_black, c_black, 1);
		draw_text_colour(room_width / 2 + 100, 160, "COMPLETE", c_yellow, c_yellow, c_lime, c_lime, 1);
	}
	if (global.completed_levels[2]){
		draw_text_colour(room_width / 2 + 104, 230, "COMPLETE", c_black, c_black, c_black, c_black, 1);
		draw_text_colour(room_width / 2 + 100, 224, "COMPLETE", c_yellow, c_yellow, c_lime, c_lime, 1);
	}
	if (global.completed_levels[3]){
		draw_text_colour(room_width / 2 + 104, 294, "COMPLETE", c_black, c_black, c_black, c_black, 1);
		draw_text_colour(room_width / 2 + 100, 288, "COMPLETE", c_yellow, c_yellow, c_lime, c_lime, 1);
	}
	
} else if(room == r_win){
	draw_text_colour(room_width / 2 + 4, 24 + 6, "YOU HAVE FOUND THE TREASURE!", c_black, c_black, c_black, c_black, 1);
	draw_text_colour(room_width / 2, 24, "YOU HAVE FOUND THE TREASURE!", c_white, c_white, c_white, c_white, 1);
} else {
	for (var i = 1; i <= global.max_hp/2; ++i) {
		if (i * 2 - 1 > global.hp and i * 2 > global.hp){
			draw_sprite_ext(heart, 2, (i * 40) - 10, 15, 1, 1, 0, c_white, 1);
		} else if (i * 2 - 1 == global.hp and i * 2 > global.hp) {
			draw_sprite_ext(heart, 1, (i * 40) - 10, 15, 1, 1, 0, c_white, 1);
		} else {
			draw_sprite_ext(heart, 0, (i * 40) - 10, 15, 1, 1, 0, c_white, 1);
		}
	}
}
if(room == r_FB and instance_exists(o_boss)){
	for (var i = 1; i <= o_boss.hp; ++i) {
		draw_sprite_ext(heart, 0, (i * 40) + 500, 15, 1, 1, 0, c_black, 1);
	}
}