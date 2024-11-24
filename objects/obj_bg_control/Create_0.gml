//initialisation de la distance pour les backgrounds aléatoires
distance_random = 0;

//initialisation du background
background_index = 0;


//Tableau des Backgrounds
background_sprite[0] = spr_background_0; 
background_sprite[1] = spr_background_1; 
background_sprite[2] = spr_background_2; 
background_sprite[3] = spr_background_3; 
background_sprite[4] = spr_background_4;

background_sprite[5] = spr_background_0_revert; 
background_sprite[6] = spr_background_1_revert; 
background_sprite[7] = spr_background_2_revert; 
background_sprite[8] = spr_background_3_revert; 
background_sprite[9] = spr_background_4_revert;

// Variables pour la position des backgrounds
background_x = 0;

total_distance = 0; // Distance totale du bg 
background_distance = 0;

scroll_speed = 4; // Vitesse de défilement
bg_sprite_width = sprite_get_width(spr_background_0); // Largeur du sprite du background