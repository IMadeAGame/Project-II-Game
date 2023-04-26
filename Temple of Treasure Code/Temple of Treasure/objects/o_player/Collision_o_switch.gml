var below_block = y > other.y + yspeed;
if (below_block){
	other.alarm[1] = 1;
} else if(state = player.bash) {
	other.alarm[1] = 1;
}