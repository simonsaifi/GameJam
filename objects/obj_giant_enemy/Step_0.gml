// Gestion des états
switch (state) {
    case "idle1pv": // Cas à 1pv
        sprite_index = sprite_idle1pv;
		x += -2; //déplacement vers la gauche
        break;
	case "idle2pv": // Cas à 2pv
        sprite_index = sprite_idle2pv;
		x += -2; //déplacement vers la gauche
        break;
    case "attack1pv": // Cas attaque à 1pv
        sprite_index = sprite_attack1pv;
        if (floor(image_index) == image_number - 1) {
			room_goto(RoomMenu)
            animation_done = true;
        } break;
	case "attack2pv": // Cas attaque à 2pv
        sprite_index = sprite_attack2pv;
        if (floor(image_index) == image_number - 1) {
			room_goto(RoomMenu)
            animation_done = true;
        } break;
    case "hit": // Cas touché par un shuriken
        sprite_index = sprite_hit;
        if (floor(image_index) == image_number - 1) {
            animation_done = true;
        } break;   
    case "die": // Cas mort
        sprite_index = sprite_die;
        if (floor(image_index) == image_number - 1) {
			var Giant = instance_place(x, y, obj_giant_enemy); // Trouve l'instance du Géant
		    if (Giant != noone) {
		        instance_destroy(Giant); // Détruire l'instance du Géant
		    }
            animation_done = true;
        } break;    
}


// Transition d'état en fonction des touches pressées à 2PV
if (pv == 2) {
	if (place_meeting(x, y, obj_shuriken)) { // Si le géant se prend un shuriken il perd 1pv et joue l'anim hit
	    state = "hit";
	    animation_done = false; // L'animation est comptée comme non terminée
	    image_index = 0; // Réinitialiser l'index de l'image pour commencer l'animation hit
		pv -= 1 // Perds 1pv
	    // Détecter et détruire le dernier shuriken en collision
	    var shuriken = instance_place(x, y, obj_shuriken); // Trouve l'instance du shuriken à la position de l'archer
	    if (shuriken != noone) {
	        instance_destroy(shuriken); // Détruire l'instance du shuriken
	    }
	} else if (place_meeting(x, y, obj_ninja)) { //Tue le ninja en l'attaquant si il est en contact avec le Geant
	    state = "attack2pv";
	    animation_done = false;
	    image_index = 0; 
	}
	// Retour à l'état idle après l'animation
	if (animation_done && state != "idle2pv" && pv=2) {
	    state = "idle2pv";
	    animation_done = false; 
	    image_index = 0; 
	}
} 
//Transition d'état en fonction des touches pressées à 1PV
if (pv == 1) { 
	if (place_meeting(x, y, obj_shuriken)) { // Si le géant se prend un shuriken il joue l'anim hit et perd 1pv
	    state = "hit"; 
	    animation_done = false; 
	    image_index = 0;
	    // Détecter et détruire le dernier shuriken en collision
	    var shuriken = instance_place(x, y, obj_shuriken); // Trouve l'instance du shuriken à la position de l'archer
	    if (shuriken != noone) {
	        instance_destroy(shuriken); // Détruire l'instance du shuriken
	    }
	} 
	else if (place_meeting(x, y, obj_ninja)) { //Tue le ninja en l'attaquant si il est en contact avec le Geant
	    state = "attack1pv";
	    animation_done = false;
	    image_index = 0; 
	} 
	else if (place_meeting(x, y, obj_attackEffect)) { //Si le géant est touché par un coup d'épée il joue l'annimation hit et perd 1pv
		state = "hit";
	    pv -= 1;
	    animation_done = false;
	    image_index = 0; 
	}

	// Retour à l'état idle après l'animation
	if (animation_done && state != "idle1pv") {
	    state = "idle1pv";
	    animation_done = false;
	    image_index = 0;
	}
}

if (pv < 1){
	state = "die";
}




//Test Réduction de pv
if (keyboard_check_pressed(ord("W"))) {
	pv -= 1;
	state = "idle1pv";
}

//Reset 2pv
if (keyboard_check_pressed(ord("X"))) {
	pv = 2;
}


