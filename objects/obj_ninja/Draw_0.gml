// Draw the player sprite
draw_self();

draw_text(55,40, "Score  " + string(round(global.score/10))); // Display score at the top-left corner

// Pixel Bar Settings
var bar_width = 300;   // Total width of the bar
var bar_height = 30;   // Height of the bar
var bar_x = 1050 // Adjust X position to account for icon (10px padding + 32px sprite)
var bar_y = 10;        // Y position of the bar (padding from top)
var pixel_size = 10;   // Width of each "pixel" block in the bar

// Colors for the bar
var filled_color1 = c_red;        // Primary filled color
var filled_color2 = make_color_rgb(255, 140, 140); // Secondary filled color
var empty_color = make_color_rgb(100, 50, 50);     // Empty pixel color
var separator_color = c_black;   // Color for separators

// Calculate the number of "pixels" that should be filled
var total_pixels = bar_width div pixel_size;               // Total number of blocks
var filled_pixels = (global.oni_bar / oni_bar_max) * total_pixels; // Filled blocks based on Oni bar progress

// Draw the bar background (empty blocks)
for (var i = 0; i < total_pixels; i++) {
    var pixel_start_x = bar_x + (i * pixel_size);         // Starting x of the block
    var pixel_end_x = pixel_start_x + pixel_size - 1;     // End x of the block (leaving 1px gap for pixel style)
    
    // Alternate colors for a checker pattern
    var block_color = (i mod 2 == 0) ? empty_color : filled_color2;

    // Draw the block
    draw_set_color(block_color);
    draw_rectangle(pixel_start_x, bar_y, pixel_end_x, bar_y + bar_height - 1, false);

    // Draw a separator line between blocks
    draw_set_color(separator_color);
    draw_line(pixel_end_x + 1, bar_y, pixel_end_x + 1, bar_y + bar_height - 1);
}

// Draw the filled portion
for (var i = 0; i < filled_pixels; i++) {
    var pixel_start_x = bar_x + (i * pixel_size);         // Starting x of the block
    var pixel_end_x = pixel_start_x + pixel_size - 1;     // End x of the block (leaving 1px gap for pixel style)
    
    // Alternate colors for a checker pattern
    var block_color = (i mod 2 == 0) ? filled_color1 : filled_color2;

    // Draw the block
    draw_set_color(block_color);
    draw_rectangle(pixel_start_x, bar_y, pixel_end_x, bar_y + bar_height - 1, false);
}

// Draw the border around the entire bar
draw_set_color(c_white);
draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, true);


// Display a message if Oni mode is active
if (global.is_transformed) {
    draw_set_color(c_white);
    draw_text(bar_x - 40, bar_y + 40, "ONI MODE ACTIVE");
}