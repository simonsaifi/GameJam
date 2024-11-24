// Dans l'événement Draw de l'objet ninja
// Appeler le dessin par défaut de l'objet
draw_self();

// Définir la position de départ pour dessiner les cœurs
var heart_x = x - 20 - sprite_width / 2;
var heart_y = y - 20 - sprite_height / 2 - 20; // Positionner au-dessus du sprite

// Dessiner les cœurs en fonction de global.ninja_pv
for (var i = 0; i < global.ninja_pv; i++) {
    draw_sprite(spr_ninja_pv, 0, heart_x + i * (sprite_width + 50), heart_y); // Ajouter un espacement de 5 pixels entre chaque cœur
}
