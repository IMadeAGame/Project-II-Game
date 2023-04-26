if (state == player.bash and other.state == bossstate.dizzy) {
	other.hp -= 1;
	other.counter = 0;
	other.state = bossstate.hurt;
	state = player.moving;
} else if (not hurt and other.state != bossstate.dizzy and other.state != bossstate.rise and other.state != bossstate.hurt and other.state != bossstate.wait) {
	take_damage();
}