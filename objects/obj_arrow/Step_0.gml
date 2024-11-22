// Déplacement de la flèche
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Mettre à jour l'angle de l'image
image_angle = direction;

// Détruire la flèche si elle sort de la room
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}

if (place_meeting(x, y, obj_shuriken)) { //Détruire la flèche si contact avec shuriken
	instance_destroy(id);
}


var shuriken = instance_place(x, y, obj_shuriken); // Trouver un shuriken à la position de la flèche
if (shuriken != noone) {
    instance_destroy(shuriken); // Détruire l'instance du shuriken
    instance_destroy(); // Détruire l'instance de la flèche
}

var sword = instance_place(x, y, obj_attackEffect); // Trouver un shuriken à la position de la flèche
if (sword != noone) {
    instance_destroy(id); // Détruire l'instance de la flèche
}


if (place_meeting(x, y, obj_ninja)) { //Tuer le ninja si contact
	//hit annimation ninja
	room_goto(RoomMenu);
}