// Gestion des états
switch (state) {
    case "idle1pv":
        sprite_index = sprite_idle1pv;
        break;
	case "idle2pv":
        sprite_index = sprite_idle2pv;
        break;
    case "attack1pv":
        sprite_index = sprite_attack1pv;
        if (image_index == image_number - 1) {
            animation_done = true;
        }
        break;
	case "attack2pv":
        sprite_index = sprite_attack2pv;
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

// Transition d'état en fonction des touches pressées à 2PV
if (pv == 2) {
	if (keyboard_check_pressed(ord("A"))) {
	    state = "hit";
	    animation_done = false;
	    image_index = 0; // Réinitialiser l'index de l'image
	} else if (keyboard_check_pressed(ord("Z"))) {
	    state = "attack2pv";
	    animation_done = false;
	    image_index = 0; // Réinitialiser l'index de l'image
	}

	// Retour à l'état idle après l'animation
	if (animation_done && state != "idle2pv" && pv=2) {
	    state = "idle2pv";
	    animation_done = false;
	    image_index = 0; // Réinitialiser l'index de l'image
	}
} 

//Transition d'état en fonction des touches pressées à 1PV
if (pv <= 1) { 
	if (keyboard_check_pressed(ord("A"))) {
	    state = "hit";
	    animation_done = false;
	    image_index = 0; // Réinitialiser l'index de l'image
	} else if (keyboard_check_pressed(ord("Z"))) {
	    state = "attack1pv";
	    animation_done = false;
	    image_index = 0; // Réinitialiser l'index de l'image
	} else if (keyboard_check_pressed(ord("E"))) {
	    state = "die";
	    animation_done = false;
	    image_index = 0; // Réinitialiser l'index de l'image
	}

	// Retour à l'état idle après l'animation
	if (animation_done && state != "idle1pv") {
	    state = "idle1pv";
	    animation_done = false;
	    image_index = 0; // Réinitialiser l'index de l'image
	}
}

//Test Réduction de pv
if (keyboard_check_pressed(ord("W"))) {
	pv -= 1
}

//Reset 2pv
if (keyboard_check_pressed(ord("X"))) {
	pv = 2
}
