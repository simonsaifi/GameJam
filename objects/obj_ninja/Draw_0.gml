// Draw the player sprite
draw_self();

// Draw the attack sprite in front
if (attack_timer > 0) {
    draw_sprite(spr_ninjaAttack, image_index, x + 55, y - 40);
}


draw_text(55,40, "Score  " + string(score)); // Display score at the top-left corner