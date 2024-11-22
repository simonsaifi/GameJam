// Gestion des états
switch (state) {
    case "idle": // Dans le cas de idle
        sprite_index = sprite_idle; // Définir le sprite de l'ennemi en idle
        break;

    case "attack": // Dans le cas de attack
        sprite_index = sprite_attack; // Définir le sprite sur attaque
        if (floor(image_index) == image_number - 1) { // Si la frame de la sprite correspond à la dernière frame
            animation_done = true; // Dire que l'animation est terminée
			shoot_arrow(x, y, 180, 10); // Tire une flèche
        }
        break;
    case "hit": // Dans le cas où l'ennemi se fait toucher
        sprite_index = sprite_hit; // Définir le sprite sur hit
        if (floor(image_index) == image_number - 1) { // Si la frame de la sprite correspond à la dernière frame
            animation_done = true; // Dire que l'animation est terminée
			
			state = "idle"
        }
        break;

    case "die": // Dans le cas où l'ennemi meurt
        sprite_index = sprite_die; // Définir le sprite sur mourrir
        if (floor(image_index) == image_number - 1) { // Si la frame de la sprite correspond à la dernière frame
            animation_done = true; // Dire que l'animation est terminée
        }
        break;
}

// Transition d'état en fonction des interactions
if (place_meeting(x, y, obj_shuriken)) { // Si l'archer se prend un shuriken
    state = "hit"; // L'état se met en hit/touché
    animation_done = false; // L'animation est comptée comme non terminée
    image_index = 0; // Réinitialiser l'index de l'image pour commencer l'animation hit

    // Détecter et détruire le dernier shuriken en collision
    var shuriken = instance_place(x, y, obj_shuriken); // Trouve l'instance du shuriken à la position de l'archer
    if (shuriken != noone) {
        instance_destroy(shuriken); // Détruire l'instance du shuriken
    }
} else if (keyboard_check_pressed(ord("T"))) { // Si j'appuie sur T
    state = "attack"; // L'état se met en attaque
    
    animation_done = false; // L'animation commence
    image_index = 0; // Réinitialiser l'index de l'image pour l'attaque
} else if (keyboard_check_pressed(ord("Y"))) { // Si j'appuie sur Y
    state = "die"; // L'état se met en mort
    animation_done = false; // L'animation commence
    image_index = 0; // Réinitialiser l'index de l'image pour la mort
}

// Retour à l'état idle après l'animation
if (animation_done && state != "idle") { // Si l'animation est terminée et que l'état n'est pas en idle
    state = "idle"; // Définir l'état en idle
    animation_done = false; // L'animation est comptée comme non terminée
    image_index = 0; // Réinitialiser l'index de l'image pour commencer le retour à idle
}
