// Dans l'événement Step de l'objet de gestion du score
var increment = round(global.score / 10) - total_distance;
total_distance += increment;
background_distance += increment;

// Changer le background en fonction de la distance totale
if (total_distance <= 100) {
    background_index = 0; // Background tuto
} else if (total_distance <= 250) {
    background_index = 1; // Deuxième background
} else if (total_distance <= 500) {
    background_index = 2; // Troisième background
} else if (total_distance <= 750) {
    background_index = 3; // Quatrième background
} else if (total_distance <= 1000) {
    background_index = 4; // Cinquième background
} else {
    // Changement de background en aléatoire tous les 1000 mètres
    if (background_distance > 1000) {
        var new_background = background_index;
        while (new_background == background_index) {
            new_background = choose(1, 2, 3, 4);
        }
        background_index = new_background;
        background_distance -= 1000;
    }
}

// Afficher la distance dans le journal de débogage
show_debug_message("distance: " + string(total_distance));
