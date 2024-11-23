// Réinitialiser la position pour créer un effet de boucle
if (background_x <= -sprite_width) {
    background_x = 0;
}

// Dessiner les backgrounds
draw_sprite_ext(background_sprite[background_index], 0, background_x, 0, 1, 1, 0, c_white, 1);
draw_sprite_ext(background_sprite[background_index], 0, background_x + sprite_width, 0, 1, 1, 0, c_white, 1);
