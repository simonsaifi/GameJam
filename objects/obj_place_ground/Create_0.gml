// Dans l'événement Create de obj_game ou de la salle
for (var i = 0; i < room_width / sprite_width + 1; i++) {
    instance_create_layer(i * sprite_width, room_height - sprite_height, "Instances", obj_ground);
}
