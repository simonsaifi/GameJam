// Vérifie si le ninja est en range
if (state == "idle" && state != "die") {
    var ninja = instance_nearest(x, y, obj_ninja); // Trouver le ninja le plus proche
    if (ninja != noone) {
        var distance_to_ninja = point_distance(x, y, ninja.x, ninja.y);
        
        // Si la distance au ninja est inférieure à 100, arrêter l'attaque
        if (distance_to_ninja <= 100) {
            state = "idle";  // Réinitialiser l'état à "idle" si le ninja est trop proche
            isAttacking = false;  // Arrêter l'attaque
            shoot_timer = 0;  // Réinitialiser le timer de tir
        }
        else if (distance_to_ninja <= attack_distance && shoot_timer <= 0) {
            // Passer à l'état d'attaque
            state = "attack";
            isAttacking = true;

            // Tirer une boule de feu
            shoot_fireball(x, y, point_direction(x, y, ninja.x, ninja.y), 4 + (round(global.movespeed)*0.0005));

            // Réinitialiser le timer de tir
            shoot_timer = shoot_interval;
        }
    }

    // Décrémenter le timer de tir
    if (shoot_timer > 0) {
        shoot_timer -= 1;
    }
}


// Gestion des états
switch (state) {
    case "idle": // Cas Idle
		enemy_movespeed(); // Déplacement
        sprite_index = sprite_idle; // Définir le sprite de l'ennemi en idle
        break;

    case "attack": // Cas attaque
        sprite_index = sprite_attack; // Définir le sprite sur attaque
        if (floor(image_index) == image_number - 1) { // Si la frame de la sprite correspond à la dernière frame
            animation_done = true; // Dire que l'animation est terminée
            isAttacking = false; // Réinitialiser l'état d'attaque
        }
        break;
	case "attackcac": // Cas attaque
        sprite_index = sprite_attack;
        if (floor(image_index) == image_number - 1) {
            animation_done = true;
            isAttacking = false; // Réinitialiser l'état d'attaque 
            
        }
        break;

    case "hit": // Cas touché
        sprite_index = sprite_hit; // Définir le sprite sur hit
        if (floor(image_index) == image_number - 1) { // Si la frame de la sprite correspond à la dernière frame
            animation_done = true; // Dire que l'animation est terminée
            if (isDying) {
                state = "die"; // Passer à l'état "die" après l'animation "hit"
                image_index = 0; // Réinitialiser l'index de l'image pour commencer l'animation "die"
            }
        }
        break;

    case "die": // Cas mort
        sprite_index = sprite_die; // Définir le sprite sur mourrir
        if (floor(image_index) == image_number - 1) { // Si la frame de la sprite correspond à la dernière frame
            animation_done = true; // Dire que l'animation est terminée
            instance_destroy(id); // Détruire l'instance après l'animation de mort
			global.oni_bar += 20;
        }
        break;
}

// Transition d'état en fonction des interactions
if (place_meeting(x, y, obj_shuriken)&& state != "die") { // Si le sorcier se prend un shuriken
    animation_done = false; // L'animation est comptée comme non terminée
    image_index = 0; // Réinitialiser l'index de l'image pour commencer l'animation hit
    state = "hit"; // L'état se met en hit/touché
    // Détecter et détruire le dernier shuriken en collision
    var shuriken = instance_place(x, y, obj_shuriken); // Trouve l'instance du shuriken à la position de l'archer
    if (shuriken != noone) {
        instance_destroy(shuriken); // Détruire l'instance du shuriken
    }
}  else if (place_meeting(x, y, obj_ninja) && !isAttacking && state != "die") { // Si le joueur est touché par l'ennemi
    animation_done = false; // Animation définie sur pas terminée
    image_index = 0; // Réinitialiser l'index de l'image
    state = "attackcac"; // L'état passe à attaque
    isAttacking = true;
	scr_ninja_get_hit();
}  else if (place_meeting(x, y, obj_attackEffect) && state != "hit" && state != "die" && global.is_transformed) { // Si l'ennemi se prend un coup d'épée
    animation_done = false; // Animation définie sur pas terminée
    image_index = 0; // Réinitialiser l'index de l'image
    state = "hit"; // L'état passe à hit
    isDying = true; // Indiquer que l'ennemi est en train de mourir
}

// Retour à l'état idle après l'animation
if (animation_done && state != "idle" && state != "die") { // Si l'animation est terminée et que l'état n'est pas en idle
    animation_done = false; // L'animation est comptée comme non terminée
    image_index = 0; // Réinitialiser l'index de l'image pour commencer le retour à idle
    state = "idle"; // Définir l'état en idle
}


// Vérifier si l'objet sort du cadre à gauche
if (x < -150) {
    instance_destroy();  // Supprimer l'objet
}
