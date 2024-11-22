// Gestion des états
switch (state) { //Initialisation état state
    case "idle": //Cas Idle
        x -= 4; // déplacement
        sprite_index = sprite_idle; // met la sprite idle sur l'ennemi
        break;
    case "attack":
        sprite_index = sprite_attack;
        if (floor(image_index) == image_number - 1) {
            animation_done = true;
            isAttacking = false; // Réinitialiser l'état d'attaque 
            room_goto(RoomMenu); // Retourner au menu
        }
        break;
    case "hit":
        sprite_index = sprite_hit;
        if (floor(image_index) == image_number - 1) {
            animation_done = true;
            if (isDying) {
                state = "die"; // Passer à l'état "die" après l'animation "hit"
                image_index = 0; // Réinitialiser l'index de l'image pour commencer l'animation "die"
            }
        }
        break;
    case "die":
        sprite_index = sprite_die;
        if (floor(image_index) == image_number - 1) {
            animation_done = true;
            instance_destroy(id); // Détruire l'instance après l'animation de mort
        }
        break;
}

// Transition d'état en fonction des touches pressées
if (place_meeting(x, y, obj_shuriken) && state != "die") { // Si l'ennemi se prend un shuriken
    animation_done = false; // L'animation est comptée comme non terminée
    image_index = 0; // Réinitialiser l'index de l'image pour commencer l'animation hit
    state = "hit"; // L'état se met en hit/touché
    // Détecter et détruire le dernier shuriken en collision
    var shuriken = instance_place(x, y, obj_shuriken); // Trouve l'instance du shuriken à la position de l'archer
    if (shuriken != noone) {
        instance_destroy(shuriken); // Détruire l'instance du shuriken
    }
} else if (place_meeting(x, y, obj_ninja) && !isAttacking && state != "die") { // Si le joueur est touché par l'ennemi
    animation_done = false; // Animation définie sur pas terminée
    image_index = 0; // Réinitialiser l'index de l'image
    state = "attack"; // L'état passe à attaque
    isAttacking = true;
} else if (place_meeting(x, y, obj_attackEffect) && state != "hit" && state != "die") { // Si l'ennemi se fait toucher
    animation_done = false; // Animation définie sur pas terminée
    image_index = 0; // Réinitialiser l'index de l'image
    state = "hit"; // L'état passe à hit
    isDying = true; // Indiquer que l'ennemi est en train de mourir
}

// Retour à l'état idle après l'animation
if (animation_done && state != "idle" && state != "die") { // Si animation pas terminée et état différent de idle
    animation_done = false; // Animation définie sur pas terminée
    image_index = 0; // Réinitialiser l'index de l'image
    state = "idle"; // État passe à idle
}


// Vérifier si l'objet sort du cadre à gauche
if (x < -150) {
    instance_destroy();  // Supprimer l'objet
}
