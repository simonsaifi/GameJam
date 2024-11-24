
function background_loop(){
	// Réinitialiser la position pour créer un effet de boucle
	if (background_x <= -2*bg_sprite_width) {
	    background_x += 2*bg_sprite_width;
	}
}