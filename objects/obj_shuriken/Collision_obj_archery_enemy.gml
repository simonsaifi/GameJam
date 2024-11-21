// Collision event between obj_shuriken and obj_archery_enemy
if (place_meeting(x, y, obj_archery_enemy)) {
    var archer = instance_place(x, y, obj_archery_enemy);
    if (archer != noone) {
        archer.sprite_index = spr_archery_enemy_hit; // Change to the hit animation sprite
        archer.image_speed = 1; // Set the speed of the animation
        archer.alarm[0] = room_speed; // Set the alarm to trigger after 1 second (assuming 1 second = room_speed steps)
        // Optionally, you can destroy the shuriken
        instance_destroy();
    }
}
