// Mise à jour de la distance parcourue
distance += bg_scroll_speed;

// Augmentation progressive de la vitesse de défilement
bg_scroll_speed += 0.001; // Ajustez cette valeur pour contrôler l'accélération


// Changer le background en fonction de la distance
if (distance <= 2000) {
    background_index = 0; // Background tuto
} else if (distance <= 5000) {
    background_index = 1; // Deuxième background
} else if (distance <= 9000) {
    background_index = 2; // Troisième background
} else if (distance <= 14000) {
    background_index = 3; // Quatrième background
} else if (distance <= 20000) {
    background_index = 4; // Cinquième background
} else {
	distance_random += bg_scroll_speed; // Commence le compteur distance pour bg random
	if (distance_random > 10000) { // Changement de background en aléatoire tout les 1000 mètres
		var new_background = background_index; 
		while (new_background == background_index) { //Répète tant que le background est le même que l'ancien
			new_background = choose(1,2,3,4); 
		} 
		background_index = new_background; 
		distance_random = 0 // On reset la distance parcourue
   }
}