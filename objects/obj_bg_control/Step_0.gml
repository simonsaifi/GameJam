background_x -= scroll_speed; //vitesse du background

// Distance totale en fonction du score
total_distance = round(global.score / 10);

// Désactiver le filtre 
layer_set_visible("OldFilmEffect", false);

// Changer le background en fonction de la distance totale
if (total_distance <= 1000) {
    background_index = 0; // Background tuto
	background_loop();
} else if (total_distance <= 2500) {
    background_index = 1; 
	background_loop();
} else if (total_distance <= 5000) {
    background_index = 2; 
	background_loop();
} else if (total_distance <= 7500) {
    background_index = 3; 
	background_loop();
} else if (total_distance <= 10000) {
    background_index = 4; 
	background_loop();
} else if (total_distance > 10000) {
	background_index = 4; 
	background_loop();
	// Appliquer le filtre "Old Film" à la couche de fond
	layer_set_visible("OldFilmEffect", true);
}
