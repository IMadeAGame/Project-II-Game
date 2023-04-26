if (state == player.bash) {
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