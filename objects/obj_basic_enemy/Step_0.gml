// Gestion des états
switch (state) {
    case "idle":
        sprite_index = sprite_idle;
        break;
    case "attack":
        sprite_index = sprite_attack;
        if (image_index == image_number - 1) {
            animation_done = true;
        }
        break;
    case "hit":
        sprite_index = sprite_hit;
        if (image_index == image_number - 1) {
            animation_done = true;
        }
        break;
    case "die":
        sprite_index = sprite_die;
        if (image_index == image_number - 1) {
            animation_done = true;
        }
        break;
}


// Transition d'état en fonction des touches pressées
if (keyboard_check_pressed(ord("A"))) { //Si A pressé
	animation_done = false; //Annimation définie sur pas terminée
	image_index = 0; //Réinitialiser l'index de l'image
    state = "hit"; //L'état passe à touché
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
