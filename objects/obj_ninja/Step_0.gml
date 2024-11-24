// Lock the player's horizontal position (stationary runner)
phy_position_x = start_x; // Keep the player at the initial x position

// Ground Detection
var on_ground = place_meeting(x, y + 2, obj_ground); // Check slightly below the player

// Decrease the cooldown timer
if (jump_cooldown > 0) {
    jump_cooldown -= 1; // Reduce cooldown each frame
}

// Oni Bar Filling Logic
if (!is_transformed) {
    if (on_ground || phy_speed_x != 0) {
        oni_bar += 0.5; // Increase the Oni bar while running or moving
    }
    oni_bar = clamp(oni_bar, 0, oni_bar_max); // Ensure it doesn't exceed the max value

    // Automatically activate Oni mode when the bar is full
    if (oni_bar >= oni_bar_max) {
        is_transformed = true;          // Activate Oni mode
        oni_mode_timer = oni_mode_duration; // Set the timer for Oni mode duration

        // Play transformation effects
        var smoke_x = x + 60; // Horizontally aligned with the character
        var smoke_y = bbox_bottom - 110; // Align with the bottom of the character
        instance_create_layer(smoke_x, smoke_y, "UI", obj_Smoke);
        audio_play_sound(Sound_Transformation, 1, false);

        // Play Oni music
        audio_stop_all(); // Stop any currently playing music
        audio_play_sound(Sound_Oni, 1, true); // Play Oni music in a loop

        show_debug_message("Oni mode activated automatically!");
    }
}

// Oni Mode Timer Countdown
if (is_transformed) {
    oni_mode_timer -= 1; // Decrease timer each frame
    if (oni_mode_timer <= 0) {
        is_transformed = false;  // Deactivate Oni mode
        oni_bar = 0;             // Reset the Oni bar

        // Play normal music
        audio_stop_all();
        audio_play_sound(Sound_Game, 1, true);

        show_debug_message("Oni mode ended.");
    }
}



// Running Logic
if (on_ground && !is_sliding && !is_jumping) {
    var new_sprite = is_transformed ? spr_ninjaOniRun : spr_ninjaRun;

    // Only update the sprite if it has changed
    if (sprite_index != new_sprite) {
        sprite_index = new_sprite;         // Update sprite
        image_index = 0;                   // Restart animation
        image_speed = 1.0;                 // Set animation speed
        show_debug_message("Switched to sprite: " + string(new_sprite));
		
    }
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
        sprite_index = is_transformed ? spr_ninjaOniRun : spr_ninjaRun; // Use appropriate running animation
        image_index = 0;             // Restart animation
        image_speed = 1.0;           // Set animation speed for running
    }

    phy_speed_y = 0; // Stop vertical movement when on the ground

    // Prevent sinking into the ground
    while (place_meeting(x, y + 1, obj_ground)) {
        y -= 1; // Adjust position to sit perfectly on the ground
    }
}

// Sliding Logic
if (keyboard_check(ord("C")) && on_ground && !is_jumping) {
    if (!is_sliding) {
        // Start sliding
        is_sliding = true;
        show_debug_message("Sliding started");
		
        sprite_index = is_transformed ? spr_ninjaOniSlide : spr_ninjaSlide; // Use appropriate sliding sprite
        image_index = 0;              // Restart animation
        image_speed = 1.0;            // Set animation speed for sliding
		show_debug_message("Current Sprite: " + string(sprite_index) + ", Frame: " + string(image_index));
    }

    // Create slide dust effect in front of the player continuously
    var slide_dust_x = x + sliding_dust_distance; // Use the sliding dust distance variable
    var slide_dust_y = bbox_bottom - 40;         // Close to the ground
    instance_create_layer(slide_dust_x, slide_dust_y, "FX", obj_slideDust);

} else if (!keyboard_check(ord("C")) && is_sliding) {
    // Stop sliding only when the key is released
    is_sliding = false;
    show_debug_message("Sliding stopped");

    // Destroy all sliding dust effects
    with (obj_slideDust) {
        instance_destroy();
    }

    // Reset to running animation
    if (!is_jumping && on_ground) {
        sprite_index = is_transformed ? spr_ninjaOniRun : spr_ninjaRun; // Use appropriate running animation
        image_index = 0;
        image_speed = 1.0;
    }
}

// Prevent running animation while sliding or jumping
if (!is_sliding && !is_jumping && on_ground) {
    var new_sprite = is_transformed ? spr_ninjaOniRun : spr_ninjaRun;
    if (sprite_index != new_sprite) {
        sprite_index = new_sprite; // Switch to running animation
        image_index = 0;
        image_speed = 1.0;
    }
} else if (is_sliding) {
    sprite_index = is_transformed ? spr_ninjaOniSlide : spr_ninjaSlide;
    image_index = 0;
    image_speed = 1.0;
}

// Check if the key is released
if (!keyboard_check(vk_space)) {
    key_held = false; // Reset the key state when Space is released
}

// Jump Logic with Key Handling
if (keyboard_check(vk_space) && on_ground && !key_held && jump_cooldown == 0 && !is_sliding) {
    // Mark the key as held to prevent continuous jumps
    key_held = true;
	
    with (obj_slideDust) {
        instance_destroy();
    }

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
    sprite_index = is_transformed ? spr_ninjaOniJumpStart : spr_jumpStart; // Switch to appropriate jump animation
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
        var jump_idle_sprite = is_transformed ? spr_ninjaOniJumpIdle : spr_jumpIdle;
        if (sprite_index != jump_idle_sprite) {
            sprite_index = jump_idle_sprite; // Use appropriate jump idle animation
            image_index = 0;            // Restart animation
        }
    }
}

// Run Dust Effect
if (on_ground && sprite_index == (is_transformed ? spr_ninjaOniRun : spr_ninjaRun)) {
    // Calculate dust effect position
    var dust_x = x - 40; // Slightly behind the player
    var dust_y = bbox_bottom - 20; // Close to the ground

    // Spawn the dust effect
    instance_create_layer(dust_x, dust_y, "FX", obj_runDust);
} else if (sprite_index == (is_transformed ? spr_ninjaOniSlide : spr_ninjaSlide)) {
    // Destroy dust effects while sliding
    with (obj_runDust) {
        instance_destroy();
    }
}

// Decrease the cooldown timer
if (throw_cooldown > 0) {
    throw_cooldown -= 1; // Reduce cooldown each frame
}

// Shuriken Throwing Logic with Cooldown
if (keyboard_check_pressed(ord("Z")) && throw_cooldown == 0) {
    var shuriken_x = x + 100; // Adjust to spawn in front of the player
    var shuriken_y = y + 60; // Align with the player’s vertical position
    var shuriken = instance_create_layer(shuriken_x, shuriken_y, "Instances", obj_shuriken);

    // Set shuriken direction
    if (image_xscale == 1) {
        shuriken.direction = 0; // Throw to the right
    } else {
        shuriken.direction = 180; // Throw to the left
    }
    
    audio_play_sound(Sound_Shuriken, 1, false);
    throw_cooldown = 45;
	
	if (is_transformed){
		throw_cooldown = 15;
	}
}

// Attaque à l'épée quand on presse E
if (keyboard_check_pressed(ord("E")) && !is_attacking && !is_sliding) {
    is_attacking = true; // Start attack state
    attack_timer = attack_duration; // Set timer to the length of the animation
    
    // Faire apparaître l'épée (avec collision)
    var sword_x = x + 50; // Adjust to spawn in front of the player
    var sword_y = y - 20; // Align with the player’s vertical position
    var sword = instance_create_layer(sword_x, sword_y, "Instances", obj_attackEffect);
    
    var attack_sound = choose(Sound_Attack1, Sound_Attack2);
    audio_play_sound(attack_sound, 1, false);
}

// Gérer le timer d'attaque
if (is_attacking) {
    attack_timer -= 1;
    if (attack_timer <= 0) {
        is_attacking = false; // Dire que l'animation est terminée
        instance_destroy(obj_attackEffect); // Détruire l'instance de l'épée
    }
}


// Increment score based on movement
if (round(global.score) < 30000) {
	global.score += abs(phy_speed_x); // Add the magnitude of movement to the score
	global.score += 1; // Increment the score by a fixed amount
	global.score *= 1.0005; // Increment the score by scaling
} else if (round(global.score) >= 30000) {
	global.score += abs(phy_speed_x); // Add the magnitude of movement to the score
	global.score += 1; // Increment the score by a fixed amount
	global.score *= 1.00005; // Increment the score by scaling
}  else if (round(global.score) >= 100000) {
	global.score += abs(phy_speed_x); // Add the magnitude of movement to the score
	global.score += 1; // Increment the score by a fixed amount
	global.score *= 1.00005; // Increment the score by scaling
}

// Max speed of enemy
if (round(global.movespeed) < 20000) {
	global.movespeed += abs(phy_speed_x); // Add the magnitude of movement to the score
	global.movespeed += 1; // Increment the score by a fixed amount
	global.movespeed *= 1.0005; // Increment the score by scaling
} else if (round(global.movespeed) >= 20000) {
	global.movespeed += 0.1; // Increment the score by a fixed amount
	global.movespeed *= 1.000005; // Increment the score by scaling
}

// Decrease the jump timer
if (jump_timer > 0) {
    jump_timer -= 1;
}

// Decrease the jump timer
if (jump_timer > 0) {
    jump_timer -= 1;
}

// Reset physics when landing
if (on_ground) {
    is_jumping = false;
    has_double_jumped = false;

    // Reset physics to avoid stuck or spinning issues
    phy_rotation = 0;     // Prevent rotation
    phy_speed_y = 0;      // Stop vertical movement
    image_angle = 0;      // Reset image orientation

    // Prevent sinking into the ground
    while (place_meeting(x, y + 1, obj_ground)) {
        y -= 1; // Adjust position to sit perfectly on the ground
    }
}

// Jump Logic with Double Jump
if (keyboard_check_pressed(vk_space) && jump_timer <= 0) {
    if (on_ground && !is_jumping) {
        // First jump
        phy_speed_y = jump_speed; // Apply upward velocity
        is_jumping = true;        // Mark player as jumping
        has_double_jumped = false; // Reset double jump

        // Play jump animation
        sprite_index = is_transformed ? spr_ninjaOniJumpStart : spr_jumpStart;
        image_index = 0;
        image_speed = 1.0;

        // Spawn jump effect
        var effect_x = x + 65;
        var effect_y = bbox_bottom - 3;
        instance_create_layer(effect_x, effect_y, "FX", obj_jumpEffect);

        audio_play_sound(Sound_Jump, 1, false);

        // Set jump cooldown
        jump_timer = jump_delay;

    } else if (!on_ground && !has_double_jumped) {
        // Double jump
        phy_speed_y = jump_speed; // Apply upward velocity
        has_double_jumped = true; // Mark double jump

        // Play the same jump animation
        sprite_index = is_transformed ? spr_ninjaOniJumpStart : spr_jumpStart;
        image_index = 0;
        image_speed = 1.0;

        // Spawn jump effect for double jump
        var effect_x = x + 65;
        var effect_y = bbox_bottom - 3;
        instance_create_layer(effect_x, effect_y, "FX", obj_jumpEffect);

        audio_play_sound(Sound_Jump, 1, false);

        // Set jump cooldown
        jump_timer = jump_delay;

        show_debug_message("Double Jump!");
    }
}

// Lock Ninja Rotation
phy_rotation = 0 // Prevent unwanted rotation

show_debug_message("pv du ninja = " + string(global.ninja_pv));
show_debug_message("movespeed = " + string(round(global.movespeed/10)));
