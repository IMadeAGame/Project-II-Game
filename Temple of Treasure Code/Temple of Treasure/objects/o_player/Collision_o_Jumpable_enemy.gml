var above_enemy = y < other.y + yspeed;
var falling = yspeed > 0;

if (above_enemy and falling and object_get_name(other) != "o_spiky"){
	with (other) {
		instance_destroy();
	}
	
	if (up){
		yspeed = -10
	} else {
		yspeed = -5
	}
} else if (state == player.bash) {
	dummy = instance_create_layer(x, y, "Enemy", o_enemy_dummy);
	dummy.sprite_index = other.sprite_index;
	dummy.image_xscale = image_xscale;
	with (other) {
		instance_destroy();
	}
	state = player.moving;
} else if (not hurt) {
	take_damage();
}