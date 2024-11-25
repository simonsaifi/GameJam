// Déplacement de la boule de feu
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Mettre à jour l'angle de l'image
image_angle = direction;

// Détruire la boule de feu si elle sort de la room
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}

if (place_meeting(x, y, obj_attackEffect) && direction!=0) { //Renovyer la boule de feu
	direction +=180
}

//tue le sorcier si il se prend la boule de feu
var wizard = instance_place(x, y, obj_wizard_enemy); // Trouver un sorcier à la position de la flèche
if (wizard != noone) {
	obj_wizard_enemy.isDying = true;
    obj_wizard_enemy.state = "hit"
    instance_destroy(); // Détruire l'instance de la boule de feu
}

if (place_meeting(x, y, obj_ninja)) { //Tuer le ninja si contact
	//hit annimation ninja
	scr_ninja_get_hit();
	instance_destroy(id);  // Supprimer l'objet
}

// Vérifier si l'objet sort du cadre à gauche
if (x < 0) {
    instance_destroy();  // Supprimer l'objet
}

var shuriken = instance_place(x, y, obj_shuriken); // Trouver un shuriken à la position de la boule de feu
if (shuriken != noone && global.is_transformed) {
    instance_destroy(id); // Détruire l'instance de la fireball
    instance_destroy(shuriken); // Détruire l'instance du shuriken
}