// Charger le meilleur score
if (file_exists("highscore.txt")) {
    var file = file_text_open_read("highscore.txt");
    global.high_score = file_text_read_real(file);
    file_text_close(file);
}


// Vérifier et mettre à jour le meilleur score
if (round(global.score) > round(global.high_score)) {
    global.high_score = round(global.score)*0.1;
}

// Sauvegarder le meilleur score à la fin du jeu
var file = file_text_open_write("highscore.txt");
file_text_write_real(file, global.high_score);
file_text_close(file);


