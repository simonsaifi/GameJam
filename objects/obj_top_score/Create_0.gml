// Charger le meilleur score sinon initialiser à 0
if (file_exists("highscore.txt")) {
    var file = file_text_open_read("highscore.txt");
    global.high_score = file_text_read_real(file);
    file_text_close(file);
	show_debug_message("fichier highscore lu");
} else {
	global.high_score = 0;
}