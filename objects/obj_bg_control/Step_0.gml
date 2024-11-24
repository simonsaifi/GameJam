background_x -= scroll_speed; //vitesse du background

// Calcul pour le changement de background aléatoire
var increment = round(global.score / 10) - total_distance;
total_distance += increment;
background_distance += increment;

if (increment > 2000 && scroll_speed < 20){ // A partir des backgrounds aléatoires tout les 2000 augmenter la vitesse du background
	scroll_speed -= 2
}

// Changer le background en fonction de la distance totale
if (total_distance <= 250) {
    background_index = 0; // Background tuto
	background_loop();
} else if (total_distance <= 500) {
    background_index = 1; 
	background_loop();
} else if (total_distance <= 750) {
    background_index = 2; 
	background_loop();
} else if (total_distance <= 1000) {
    background_index = 3; 
	background_loop();
} else if (total_distance <= 2000) {
    background_index = 4; 
	background_loop();
} else {
    // Changement de background en aléatoire tous les 1000 mètres
    if (background_distance > 2000) {
        var new_background = background_index;
        while (new_background == background_index) {
            new_background = choose(1, 2, 3, 4);
        }
        background_index = new_background;
		background_loop();
        background_distance -= 2000;
    }
}

// Afficher la distance dans le journal de débogage
show_debug_message("distance: " + string(total_distance));
