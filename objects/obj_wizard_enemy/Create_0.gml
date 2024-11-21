//initialisation des points de vie
pv = 1;

// Initialisation des différentes annimations
state = "idle"; // État initial
sprite_idle = spr_wizard_enemy_idle; // Sprite pour l'état normal
sprite_attack = spr_wizard_enemy_attack; // Sprite pour l'attaque
sprite_hit = spr_wizard_enemy_hit; // Sprite pour se faire toucher
sprite_die = spr_wizard_enemy_die; // Sprite pour la mort

//Permet de vérifier si l'annimation de la sprite est terminée
animation_done = false;

// Initialisation des variables de tir
shoot_interval = 120; // Intervalle de tir en frames (120 frames = 2 secondes)
shoot_timer = 0; // Timer pour le tir
