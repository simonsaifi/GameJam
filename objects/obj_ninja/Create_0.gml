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
jump_timer = 0; // Tracks time before the next jump is allowed
jump_delay = 5; // Minimum frames between jumps


runDust_timer = 0;


key_held = false;      // Tracks if the jump key is being held

throw_cooldown = 0; // Timer for managing throw cooldown

sliding_dust_instance = 40;
is_sliding = false;

sliding_dust_distance = 160;

is_attacking = false; // To Track if the player is attacking
attack_timer = 0; // Tracks attack duration
attack_duration = 11; // Duration of attack in steps (e.g., 30 = 0.5 seconds at 60 FPS)

score = 0; // Initialize the score

is_jump_attacking = false; // Track if the player is attacking mid-air

is_transformed = false; // Starts as the normal character

current_sprite = -1; // Track the last sprite used

has_double_jumped = false; // Tracks if the double jump has been used




oni_bar = 0;               // The current value of the Oni bar
oni_bar_max = 100;         // The maximum value of the Oni bar
oni_mode_duration = 1200;  // Duration of Oni mode in steps (20 seconds)
oni_mode_timer = 0;        // Timer for Oni mode countdown


