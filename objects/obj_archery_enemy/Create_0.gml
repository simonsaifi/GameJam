//initialisation des points de vie
pv = 1;

// Initialisation des différentes annimations
state = "idle"; // État initial
sprite_idle = spr_archery_enemy_idle; // Sprite pour l'état normal
sprite_attack = spr_archery_enemy_attack; // Sprite pour l'attaque
sprite_hit = spr_archery_enemy_hit; // Sprite pour se faire toucher
sprite_die = spr_archery_enemy_die; // Sprite pour la mort

//Permet de vérifier si l'annimation de la sprite est terminée
animation_done = false; //Initialisation de l'animation sur pas terminée

//Flèches
// Initialisation des variables de tir
shoot_interval = 150; // Intervalle de tir en frames (par exemple, 60 frames = 1 seconde)
shoot_timer = 0; // Timer pour le tir
attack_distance = 800; //Distance de détéction d'ennemi


isAttacking = false; 
isDying = false;