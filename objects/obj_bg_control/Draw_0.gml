// Dans l'événement Draw de l'objet de gestion du background
// Dessiner le background actuel
draw_sprite_ext(background_sprite[background_index], 0, background_x, 0, 1, 1, 0, c_white, 1);
draw_sprite_ext(background_sprite[background_index+5], 0, background_x + bg_sprite_width, 0, 1, 1, 0, c_white, 1); 
draw_sprite_ext(background_sprite[background_index], 0, background_x + 2*bg_sprite_width, 0, 1, 1, 0, c_white, 1);
