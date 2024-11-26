if (point_in_rectangle(mouse_x, mouse_y, x - sprite_width / 2, y - sprite_height / 2, x + sprite_width / 2, y + sprite_height / 2)) {
    // Mouse is hovering over the button
    draw_self();
    draw_set_font(FontMenu);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    // Draw with scaling (zoom effect)
    draw_sprite_ext(sprite_index, image_index, x, y, 1.1, 1.1, 0, c_white, 1);

    draw_text(x, y, string(button_text) + "");

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
} else {
    // Normal drawing
    draw_self();
    draw_set_font(FontMenu);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_text(x, y, string(button_text) + "");

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
