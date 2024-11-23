// Fonction pour mettre à jour le tableau des scores
function update_top_scores(new_score) {
    for (var i = 0; i < array_length(global.top_scores); i++) {
        if (new_score > global.top_scores[i]) {
            // Décaler les scores inférieurs
            for (var j = array_length(global.top_scores) - 1; j > i; j--) {
                global.top_scores[j] = global.top_scores[j - 1];
            }
            // Insérer le nouveau score
            global.top_scores[i] = new_score;
            break;
        }
    }
}

// Appeler la fonction après chaque partie
update_top_scores(round(global.score));
