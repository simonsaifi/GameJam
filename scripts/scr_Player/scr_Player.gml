function scr_ninja_get_hit(){
	if (global.ninja_pv > 0) { //Player se fait toucher et perds une vie
		//animation hit
		global.ninja_pv -= 1;
	} 
	else if (global.ninja_pv == 0) {
		//animation de hit
		//animation de mort
		//Room Game over
		room_goto(RoomMenu);
	}
}