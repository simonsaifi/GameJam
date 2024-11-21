// Gestion des états
switch (state) {//Change l'état de l'ennemi
    case "idle": //Dans le cas de idle
        sprite_index = sprite_idle; //défini le sprite de l'ennemi en idle
        break;
    case "attack"://Dans le cas de attack
        sprite_index = sprite_attack; //défini le sprite sur attaque
        if (image_index == image_number - 1) { //Si la frame de la sprite correspond à la dernière frame
            animation_done = true; //Dire que l'annimation est terminée
        }
        break;
    case "hit": //Dans le cas où l'ennemi se fait toucher
        sprite_index = sprite_hit; //défninir le sprite sur hit
        if (image_index == image_number - 1) { //Si la frame de la sprite correspond à la dernière frame
            animation_done = true; //Dire que l'annimation est terminée
        }
        break;
    case "die": // Dans le cas où l'ennemi meurt
        sprite_index = sprite_die; //définir le sprite sur mourrir
        if (image_index == image_number - 1) {  //Si la frame de la sprite correspond à la dernière frame
            animation_done = true; //Dire que l'annimation est terminée
        }
        break;
}

// Transition d'état en fonction des touches pressées
if (keyboard_check_pressed(ord("R"))) { // Si j'appuie sur R
    state = "hit"; //L'état se met en hit/touché
    animation_done = false; //l'annimation est compté comme pas terminée vu qu'elle commence (sera modifié dans le case en true à la fin)
    image_index = 0; //Réinitialiser l'index de l'image
} else if (keyboard_check_pressed(ord("T"))) { //Si j'appuie sur Z
    state = "attack"; //L'état se met en attaque
	shoot_arrow(x, y, 180, 10); //tire une flèche
    animation_done = false; //Déclarer que l'annimation commence
    image_index = 0; //Réinitialiser l'index de l'image
} else if (keyboard_check_pressed(ord("Y"))) { //Si j'appuie sur E
    state = "die"; //Le personnage meurt
    animation_done = false; //déclarer que l'annimation commence
    image_index = 0; //Réinitialiser l'index de l'image
}

// Retour à l'état idle après l'animation
if (animation_done && state != "idle") { //Si l'annimation est terminée et que l'état n'est pas en idle
    state = "idle"; //définir l'état en idle
    animation_done = false; //déclarer que l'annimation commence
    image_index = 0; //Réinitialiser l'index de l'image
}




