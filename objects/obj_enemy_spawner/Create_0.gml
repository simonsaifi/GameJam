// Dans l'événement Create de obj_enemy_spawner
spawn_interval_min = 60;  // Intervalle minimum entre les spawns (1 secondes)
spawn_interval_max = 180;  // Intervalle maximum entre les spawns (4 secondes)
timer = 0;  // Timer de spawn
next_spawn_time = random_range(spawn_interval_min, spawn_interval_max);  // Intervalle aléatoire entre 4 et 10 secondes
