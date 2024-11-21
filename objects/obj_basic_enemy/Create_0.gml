//initialisation des points de vie
pv = 1;

// Initialisation des différentes annimations
state = "idle"; // État initial
sprite_idle = spr_basic_enemy_idle; // Sprite pour l'état normal
sprite_attack = spr_basic_enemy_attack; // Sprite pour l'attaque
sprite_hit = spr_basic_enemy_hit; // Sprite pour se faire toucher
sprite_die = spr_basic_enemy_die; // Sprite pour la mort

//Permet de vérifier si l'annimation de la sprite est terminée
animation_done = false; //Initialiser l'annimation sur pas terminée
