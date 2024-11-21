// Déplacement de la boule de feu
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Mettre à jour l'angle de l'image
image_angle = direction;

// Détruire la boule de feu si elle sort de la room
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}
