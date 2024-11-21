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
if (keyboard_check_pressed(ord("A"))) {
    state = "hit";
    animation_done = false;
    image_index = 0; // Réinitialiser l'index de l'image
} else if (keyboard_check_pressed(ord("Z"))) {
    state = "attack";
	shoot_fireball(x,y,180,5);
    animation_done = false;
    image_index = 0; // Réinitialiser l'index de l'image
} else if (keyboard_check_pressed(ord("E"))) {
    state = "die";
    animation_done = false;
    image_index = 0; // Réinitialiser l'index de l'image
}

// Retour à l'état idle après l'animation
if (animation_done && state != "idle") {
    state = "idle";
    animation_done = false;
    image_index = 0; // Réinitialiser l'index de l'image
}