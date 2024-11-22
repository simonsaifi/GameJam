// Gestion des états
switch (state) {
    case "idle1pv": // Cas idle à 1pv
        sprite_index = sprite_idle1pv;
        x += -4; // déplacement vers la gauche
        break;
    case "idle2pv": // Cas idle à 2pv
        sprite_index = sprite_idle2pv;
        x += -4; // déplacement vers la gauche
        break;
    case "attack1pv": // Cas attaque à 1pv
        sprite_index = sprite_attack1pv;
        if (floor(image_index) == image_number - 1) {
            room_goto(RoomMenu);
            animation_done = true;
        }
        break;
    case "attack2pv": // Cas attaque à 2pv
        sprite_index = sprite_attack2pv;
        if (floor(image_index) == image_number - 1) {
            room_goto(RoomMenu);
            animation_done = true;
        }
        break;
    case "hit": // Cas touché par un shuriken
        sprite_index = sprite_hit;
        if (floor(image_index) == image_number - 1) {
            animation_done = true;
            if (isDying) {
                state = "die"; // Passer à l'état "die" après l'animation "hit"
                image_index = 0; // Réinitialiser l'index de l'image pour commencer l'animation "die"
            } else if (pv == 1) {
                state = "idle1pv"; // Retourner à l'état "idle1pv" si l'ennemi n'est pas en train de mourir
            }
        }
        break;
    case "die": // Cas mort
        sprite_index = sprite_die;
        if (floor(image_index) == image_number - 1) {
            instance_destroy(id); // Détruire l'instance spécifique après l'animation de mort
            animation_done = true;
        }
        break;
}

// Transition d'état en fonction des touches pressées à 2PV
if (pv == 2) {
    if (place_meeting(x, y, obj_shuriken)) { // Si le géant se prend un shuriken il perd 1pv et joue l'anim hit
        state = "hit";
        animation_done = false; // L'animation est comptée comme non terminée
        image_index = 0; // Réinitialiser l'index de l'image pour commencer l'animation hit
        pv -= 1; // Perds 1pv
        // Détecter et détruire le dernier shuriken en collision
        var shuriken = instance_place(x, y, obj_shuriken); // Trouve l'instance du shuriken à la position de l'archer
        if (shuriken != noone) {
            instance_destroy(shuriken); // Détruire l'instance du shuriken
        }
    } else if (place_meeting(x, y, obj_ninja) && state != "attack2pv") { // Tue le ninja en l'attaquant si il est en contact avec le Géant
        state = "attack2pv";
        animation_done = false;
        image_index = 0;
    }
    // Retour à l'état idle après l'animation
    if (animation_done && state != "idle2pv" && pv == 2) {
        state = "idle2pv";
        animation_done = false;
        image_index = 0;
    }
}

// Transition d'état en fonction des touches pressées à 1PV
if (pv == 1) {
    if (place_meeting(x, y, obj_shuriken)&& state != "die") { // Si le géant se prend un shuriken il joue l'anim hit
        state = "hit";
        animation_done = false;
        image_index = 0;
        // Détecter et détruire le dernier shuriken en collision
        var shuriken = instance_place(x, y, obj_shuriken); // Trouve l'instance du shuriken à la position de l'archer
        if (shuriken != noone) {
            instance_destroy(shuriken); // Détruire l'instance du shuriken
        }
    } else if (place_meeting(x, y, obj_ninja) && state != "attack1pv") { // Tue le ninja en l'attaquant si il est en contact avec le Géant
        state = "attack1pv";
        animation_done = false;
        image_index = 0;
    } else if (place_meeting(x, y, obj_attackEffect)) { // Si le géant est touché par un coup d'épée il joue l'animation hit et perd 1pv
        state = "hit";
        pv -= 1;
        animation_done = false;
        image_index = 0;
        if (pv < 1) {
            isDying = true; // Indiquer que l'ennemi est en train de mourir
        }
    }

    // Retour à l'état idle après l'animation
    if (animation_done && state != "idle1pv") {
        state = "idle1pv";
        animation_done = false;
        image_index = 0;
    }
}

if (pv < 1 && state != "die") {
    state = "hit"; // Passer à l'état "hit" avant de mourir
    isDying = true; // Indiquer que l'ennemi est en train de mourir
}

