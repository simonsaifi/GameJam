if (paused) {
    draw_self();
	draw_set_alpha(0.7);
	draw_sprite(sprite_background, 0, 0, 0); // background pause
	draw_text_color(550, 355, "Jeu en pause",0,0,0,0,1); // Ombre texte en pause
	draw_set_alpha(1);
    draw_text(545, 350, "Jeu en pause"); // Texte en pause
	draw_set_alpha(0.8); // Afficher le score en pause
	draw_sprite(spr_scoreUI, 0, 0, 0); // background score
	draw_text(55,40, "Score  " + string(round(global.score/10))); //Afficher le score
    // Dessinez les éléments du menu pause ici
} else { //Afficher le score en jeu
	draw_set_alpha(1);
	draw_sprite(spr_scoreUI, 0, 0, 0);
	draw_text(55,40, "Score  " + string(round(global.score/10))); //Afficher le score
}

