// Dans l'événement Draw de l'objet de gestion du score
for (var i = 0; i < array_length(global.top_scores); i++) {
	if (global.top_scores[i] != 0) {
    draw_text(1000, 50 + i * 50, "Score " + string(i + 1) + "   " + string(global.top_scores[i]));
	}
}
