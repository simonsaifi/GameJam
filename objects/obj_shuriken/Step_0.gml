// Move the shuriken
x += lengthdir_x(shuriken_speed, direction);
y += lengthdir_y(shuriken_speed, direction);

// Rotate the sprite
image_angle += 10; // Adjust for rotation speed

// Destroy the shuriken if it leaves the room
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}

//détruire la flèche
var arrow = instance_place(x, y, obj_arrow); // Trouver une flèche à la position du shuriken
if (arrow != noone) {
    instance_destroy(arrow); // Détruire l'instance de la flèche
    instance_destroy(); // Détruire l'instance du shuriken
}
