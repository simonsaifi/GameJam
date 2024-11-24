//initialisation des points de vie
pv = 2;

// Initialisation des différentes annimations
state = "idle2pv"; // État initial
sprite_idle2pv = spr_giant_enemy_idle_2pv; // Sprite pour l'état normal
sprite_idle1pv = spr_giant_enemy_idle_1pv
sprite_attack2pv = spr_giant_enemy_attack_2pv; // Sprite pour l'attaque
sprite_attack1pv = spr_giant_enemy_attack_1pv
sprite_hit = spr_giant_enemy_hit; // Sprite pour se faire toucher
sprite_die = spr_giant_enemy_die; // Sprite pour la mort

//Permet de vérifier si l'annimation de la sprite est terminée
animation_done = false;


isAttacking = false;
isDying = false;
