// Position and dimensions
bar_width = 200;
bar_height = 20;
bar_x = display_get_width() - bar_width - 42; // Position on the top-right
bar_y = 10;
pixel_size = 10; // Block size for the bar

// Progress
oni_bar = 0;          // Current fill level
oni_bar_max = 100;    // Maximum fill level

// Icon
icon_sprite = spr_oniMode; // Assign the Oni mode sprite

// Colors
filled_color1 = c_red;
filled_color2 = make_color_rgb(255, 140, 140);
empty_color = make_color_rgb(100, 50, 50);
separator_color = c_black;
