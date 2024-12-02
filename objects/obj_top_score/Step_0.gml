// Vérifier et mettre à jour le meilleur score
if (global.score*0.1 > global.high_score) {
    global.high_score = round(global.score)*0.1;
	// Sauvegarder le meilleur score à la fin du jeu
	var file = file_text_open_write("highscore.txt");
	file_text_write_real(file, round(global.high_score));
	file_text_close(file);
}

//Augmentation du score pour check les backgrounds
if (keyboard_check_pressed(ord("S"))){
	global.score += 1000;
	global.movespeed += 1000;
}

if (keyboard_check_pressed(ord("Q"))&& global.ninja_pv == -1){
	global.ninja_pv = 3;
} else if (keyboard_check_pressed(ord("Q"))){
	global.ninja_pv = -1;
}


