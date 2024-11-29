function scr_ninja_get_hit(){
	if (global.ninja_pv > 1) { //Player se fait toucher et perds une vie
		//ninja perd 1 pv
		global.ninja_pv -= 1;
	} 
	else if (global.ninja_pv == 1) { // Dernier pv
		//Aller au gameover
		room_goto(RoomGameover);
		// Vérifier si le son sound_oni est en train de jouer
		if (audio_is_playing(Sound_Oni)) {
		    // Arrêter le son sound_oni
		    audio_stop_sound(Sound_Oni);
		}
	}
}