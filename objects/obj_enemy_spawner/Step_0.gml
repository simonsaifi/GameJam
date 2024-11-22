// Dans l'événement Step de obj_enemy_spawner

// Incrémenter le timer
timer += 1;

// Vérifier si le timer a atteint l'intervalle avant le prochain spawn
if (timer >= next_spawn_time) {
    // Réinitialiser le timer
    timer = 0;

    // Tirer un nombre aléatoire entre 0 et 100
    var spawn_chance = irandom(100); // Cela donne un nombre entre 0 et 100

    // Choisir l'ennemi à faire apparaître en fonction de la probabilité
    if (spawn_chance < 50) {  // 50% pour obj_basic_enemy
        instance_create_layer(room_width + sprite_width, 568, "Instances", obj_basic_enemy);
    }
    else if (spawn_chance < 75) {  // 25% pour obj_archery_enemy (50 + 25 = 75)
        instance_create_layer(room_width + sprite_width, 570, "Instances", obj_archery_enemy);
    }
    else if (spawn_chance < 90) {  // 15% pour obj_giant_enemy (75 + 15 = 90)
        instance_create_layer(room_width + sprite_width, 505, "Instances", obj_giant_enemy);
    }
    else {  // 10% pour obj_wizard_enemy (90 + 10 = 100)
        instance_create_layer(room_width + sprite_width, 510, "Instances", obj_wizard_enemy);
    }

    // Choisir un nouvel intervalle aléatoire pour le prochain spawn (entre 4 et 10 secondes)
    next_spawn_time = random_range(spawn_interval_min, spawn_interval_max);
}
