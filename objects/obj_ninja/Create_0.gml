// Initialize the starting position to lock the player horizontally
start_x = x;

// Set the animation speed for the running sprite
image_speed = 1.0; // Adjust to make the animation faster or slower

// Gravity and Jump variables
phy_speed_y = 0;        // Initial vertical speed
player_gravity = 1;   // Gravity strength
jump_speed = -120;      // Jump velocity (adjust for desired jump height)
is_jumping = false;     // To track if the player is in the air

jump_cooldown = 0;

runDust_timer = 0;


key_held = false;      // Tracks if the jump key is being held

throw_cooldown = 0; // Timer for managing throw cooldown

