
// Fonction pour tirer une flèche
function shoot_arrow(x, y, direction, vitesse) {
    // Créer une flèche à la position spécifiée
    var arrow = instance_create_layer(x+90, y+90, "Instances", obj_arrow);
    arrow.direction = direction; // Définir la direction de la flèche
    arrow.speed = vitesse; // Définir la vitesse de la flèche
    arrow.image_angle = direction; // Mettre à jour l'angle de l'image
    arrow.depth = -100; // Assurer que la flèche est au premier plan
}

// Fonction tirer boule de feu
function shoot_fireball(x, y, direction, vitesse) {
    // Créer une boule de feu à la position spécifiée
    var fireball = instance_create_layer(x-50, y+100, "Instances", obj_fireball);
    fireball.direction = direction; // Définir la direction de la boule de feu
    fireball.speed = vitesse; // Définir la vitesse de la boule de feu
    fireball.image_angle = direction; // Mettre à jour l'angle de l'image
    fireball.depth = -100; // Assurer que la boule de feu est au premier plan
}