// Dans l'événement Step de obj_enemy_spawner

// Incrémenter le timer
timer += 1;

// Vérifier si le timer a atteint l'intervalle avant le prochain spawn
if (timer >= next_spawn_time) {
    // Réinitialiser le timer
    timer = 0;

    // Choisir aléatoirement un ennemi à faire apparaître
    var enemy_type = irandom(3);  // Génère un nombre entre 0 et 3 pour choisir un ennemi (4 ennemis possibles)

    // Spawner un ennemi selon le nombre aléatoire généré
    switch (enemy_type) {
        case 0:
            instance_create_layer(room_width + sprite_width, 568, "Instances", obj_basic_enemy);
            break;
        case 1:
            instance_create_layer(room_width + sprite_width, 570, "Instances", obj_archery_enemy);
            break;
        case 2:
            instance_create_layer(room_width + sprite_width, 505, "Instances", obj_giant_enemy);
            break;
        case 3:
            instance_create_layer(room_width + sprite_width, 510, "Instances", obj_wizard_enemy);
            break;
    }

    // Choisir un nouvel intervalle aléatoire pour le prochain spawn (entre 4 et 10 secondes)
    next_spawn_time = random_range(spawn_interval_min, spawn_interval_max);
}
