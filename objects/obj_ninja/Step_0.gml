// Lock the player's horizontal position (stationary runner)
phy_position_x = start_x; // Keep the player at the initial x position

// Ground Detection
var on_ground = place_meeting(x, y + 2, obj_ground); // Check slightly below the player


// Decrease the cooldown timer
if (jump_cooldown > 0) {
    jump_cooldown -= 1; // Reduce cooldown each frame
}

// Gravity Logic
if (!on_ground) {
    // If not on the ground, apply gravity
    phy_speed_y += player_gravity;
    is_jumping = true; // Player is in the air
} else {
    // If on the ground, reset jumping state
    if (is_jumping && phy_speed_y >= 0) {
        is_jumping = false;         // Reset jumping flag
		sprite_index = spr_ninjaRun; // Switch back to running animation
		image_index = 0;             // Restart animation
		image_speed = 1.0;           // Set animation speed for running
		
    }

    phy_speed_y = 0; // Stop vertical movement when on the ground

    // Prevent sinking into the ground
    while (place_meeting(x, y + 1, obj_ground)) {
        y -= 1; // Adjust position to sit perfectly on the ground
    }
}

// Check if the key is released
if (!keyboard_check(vk_space)) {
    key_held = false; // Reset the key state when Space is released
}

// Jump Logic with Key Handling
if (keyboard_check(vk_space) && on_ground && !key_held && jump_cooldown == 0) {
    // Mark the key as held to prevent continuous jumps
    key_held = true;

    // Calculate the ground-aligned position for the jump effect
    var effect_x = x + 65; // Horizontally aligned with the character
    var effect_y = bbox_bottom - 3; // Slightly above the ground

    // Spawn the jump effect under the character
    instance_create_layer(effect_x, effect_y, "FX", obj_jumpEffect);

    // Destroy all dust effects when jumping starts
    with (obj_runDust) {
        instance_destroy();
    }

    // Player starts jumping
    sprite_index = spr_jumpStart;  // Switch to jump start animation
    image_index = 0;              // Restart animation
    image_speed = 1.0;            // Set jump animation speed
    phy_speed_y = jump_speed;     // Apply upward velocity
    is_jumping = true;            // Mark player as jumping
	
	audio_play_sound(Sound_Jump, 1, false);
	
	jump_cooldown = 60;
}

// Apply Vertical Movement
y += phy_speed_y;

// Animation Switching for Jumping
if (is_jumping) {
    if (phy_speed_y < 0) {
        // Player is moving upward
        if (sprite_index != spr_jumpIdle) {
            sprite_index = spr_jumpIdle; // Switch to jump idle animation
            image_index = 0;            // Restart animation
        }
    }
}


// Run Dust Effect
if (on_ground && sprite_index == spr_ninjaRun) {
    // Calculate dust effect position
    var dust_x = x - 40; // Slightly behind the player
    var dust_y = bbox_bottom - 20; // Close to the ground

    // Spawn the dust effect
    instance_create_layer(dust_x, dust_y, "FX", obj_runDust);
}

// Decrease the cooldown timer
if (throw_cooldown > 0) {
    throw_cooldown -= 1; // Reduce cooldown each frame
}

// Shuriken Throwing Logic with Cooldown
if (keyboard_check_pressed(ord("Z")) && throw_cooldown == 0) {
    // Spawn a shuriken in front of the player
    var shuriken_x = x + 100; // Adjust to spawn in front of the player
    var shuriken_y = y + 60; // Align with the player’s vertical position
    var shuriken = instance_create_layer(shuriken_x, shuriken_y, "FX", obj_shuriken);

    // Set shuriken direction
    if (image_xscale == 1) {
        shuriken.direction = 0; // Throw to the right
    } else {
        shuriken.direction = 180; // Throw to the left
    }
	
	// Play the shuriken sound
    audio_play_sound(Sound_Shuriken, 1, false);

    // Start cooldown
    throw_cooldown = 45;
}
