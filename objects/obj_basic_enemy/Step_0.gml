// Gestion des états
switch (state) { //Intialisation état state
    case "idle": //Cas Idle
        sprite_index = sprite_idle; //met la sprite idle sur l'ennemi
        break;
    case "attack":
        sprite_index = sprite_attack;
        if (floor(image_index) == image_number - 1) {
            animation_done = true;
        }
        break;
    case "hit":
        sprite_index = sprite_hit;
        if (floor(image_index) == image_number - 1) {
            animation_done = true;
        }
        break;
    case "die":
        sprite_index = sprite_die;
        if (floor(image_index) == image_number - 1) {
            animation_done = true;
        }
        break;
}


// Transition d'état en fonction des touches pressées
if (place_meeting(x, y, obj_shuriken)) { // Si l'archer se prend un shuriken
    state = "hit"; // L'état se met en hit/touché
    animation_done = false; // L'animation est comptée comme non terminée
    image_index = 0; // Réinitialiser l'index de l'image pour commencer l'animation hit

    // Détecter et détruire le dernier shuriken en collision
    var shuriken = instance_place(x, y, obj_shuriken); // Trouve l'instance du shuriken à la position de l'archer
    if (shuriken != noone) {
        instance_destroy(shuriken); // Détruire l'instance du shuriken
    }
} else if (keyboard_check_pressed(ord("Z"))) { //Si Z pressé
	animation_done = false; //Annimation définie sur pas terminée
    image_index = 0; // Réinitialiser l'index de l'image
	state = "attack"; //L'état passe à attaque
} else if (keyboard_check_pressed(ord("E"))) { //Si E pressé
	animation_done = false; //Annimation définie sur pas terminée
    image_index = 0; // Réinitialiser l'index de l'image
	state = "die"; //L'état passe à mort
}

// Retour à l'état idle après l'animation
if (animation_done && state != "idle") { //Si annimation pas terminée et état différent de idle
	animation_done = false; //Annimation définie sur pas terminée
    image_index = 0; // Réinitialiser l'index de l'image
	state = "idle"; //Etat passe à idle
}
