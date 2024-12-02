// Lock the player's horizontal position
phy_position_x = start_x;

// Ground Detection
var on_ground = place_meeting(x, y + 2, obj_ground);



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



// Oni Mode Logic
if (!global.is_transformed) {
    global.oni_bar = clamp(global.oni_bar, 0, oni_bar_max);
    if (global.oni_bar >= oni_bar_max) {
        global.is_transformed = true;
        oni_mode_timer = oni_mode_duration;

        // Effects for Oni Mode Activation
        instance_create_layer(x + 60, bbox_bottom - 110, "UI", obj_Smoke);
        audio_play_sound(Sound_Transformation, 1, false);
        audio_stop_all();
        audio_play_sound(Sound_Oni, 1, true);
        show_debug_message("Oni mode activated automatically!");
    }
}

// Oni Mode Timer Countdown
if (global.is_transformed) {
    oni_mode_timer -= 1;
    if (oni_mode_timer <= 0) {
        global.is_transformed = false;
        global.oni_bar = 0;
        audio_stop_all();
        audio_play_sound(Sound_Game, 1, true);
        show_debug_message("Oni mode ended.");
    }
}

// Running Logic
if (on_ground && !is_sliding && !is_jumping) {
    var new_sprite = global.is_transformed ? spr_ninjaOniRun : spr_ninjaRun;
    if (sprite_index != new_sprite) {
        sprite_index = new_sprite;
        image_index = 0;
        image_speed = 1.0;
        show_debug_message("Switched to sprite: " + string(new_sprite));
    }
}

// Gravity Logic
if (!on_ground) {
    phy_speed_y += player_gravity;
} else {
    phy_speed_y = 0;
    is_jumping = false;
    has_double_jumped = false;
    image_angle = 0;
    while (place_meeting(x, y + 1, obj_ground)) {
        y -= 1;
    }
}

// Sliding Logic
if (keyboard_check(ord("C")) && on_ground && !is_jumping) {
    if (!is_sliding) {
        is_sliding = true;
        sprite_index = global.is_transformed ? spr_ninjaOniSlide : spr_ninjaSlide;
        image_index = 0;
        image_speed = 1.0;
        show_debug_message("Sliding started");
    }
    instance_create_layer(x + sliding_dust_distance, bbox_bottom - 40, "FX", obj_slideDust);
} else if (!keyboard_check(ord("C")) && is_sliding) {
    is_sliding = false;
    show_debug_message("Sliding stopped");
    with (obj_slideDust) {
        instance_destroy();
    }
    if (on_ground && !is_jumping) {
        sprite_index = global.is_transformed ? spr_ninjaOniRun : spr_ninjaRun;
        image_index = 0;
        image_speed = 1.0;
    }
}

// Jump Logic
if (jump_cooldown > 0) {
    jump_cooldown -= 1;
}

if (keyboard_check_pressed(vk_space) && jump_cooldown == 0) {
    if (on_ground && !is_jumping) {
        // Normal jump
        phy_speed_y = jump_speed;
        is_jumping = true;
        has_double_jumped = false;
        jump_cooldown = jump_delay;
        sprite_index = global.is_transformed ? spr_ninjaOniJumpStart : spr_jumpStart;
        image_index = 0;
        image_speed = 1.0;
		instance_create_layer(x + 65, bbox_bottom - 3, "FX", obj_jumpEffect);
        audio_play_sound(Sound_Jump, 1, false);
        show_debug_message("Normal Jump");
    } else if (!on_ground && is_jumping && !has_double_jumped) {
        // Double jump
        phy_speed_y = jump_speed;
        has_double_jumped = true;
        jump_cooldown = jump_delay;
        sprite_index = global.is_transformed ? spr_ninjaOniJumpStart : spr_jumpStart;
        image_index = 0;
        image_speed = 1.0;
        instance_create_layer(x + 65, bbox_bottom - 3, "FX", obj_jumpEffect);
        audio_play_sound(Sound_Jump, 1, false);
        show_debug_message("Double Jump");
    }
}

// Apply Vertical Movement
y += phy_speed_y;

// Animation Switching for Jumping
if (is_jumping) {
    if (phy_speed_y < 0) {
        var jump_idle_sprite = global.is_transformed ? spr_ninjaOniJumpIdle : spr_jumpIdle;
        if (sprite_index != jump_idle_sprite) {
            sprite_index = jump_idle_sprite;
            image_index = 0;
        }
    } else if (phy_speed_y > 0) {
        var fall_sprite = global.is_transformed ? spr_ninjaOniJumpFall : spr_jumpFall;
        if (sprite_index != fall_sprite) {
            sprite_index = fall_sprite;
            image_index = 0;
            image_speed = 1.0;
        }
    }
}

// Run Dust Effect
if (on_ground && sprite_index == (global.is_transformed ? spr_ninjaOniRun : spr_ninjaRun)) {
    instance_create_layer(x - 40, bbox_bottom - 20, "FX", obj_runDust);
} else if (sprite_index == (global.is_transformed ? spr_ninjaOniSlide : spr_ninjaSlide)) {
    with (obj_runDust) {
        instance_destroy();
    }
}

// Shuriken Throwing Logic
if (throw_cooldown > 0) {
    throw_cooldown -= 1;
}
if (keyboard_check_pressed(ord("Z")) && throw_cooldown == 0) {
    var shuriken_x = x + 100;
    var shuriken_y = y + 60;
    var shuriken = instance_create_layer(shuriken_x, shuriken_y, "Instances", obj_shuriken);
    shuriken.direction = image_xscale == 1 ? 0 : 180;
    audio_play_sound(Sound_Shuriken, 1, false);
    throw_cooldown = global.is_transformed ? 15 : 45;
}

// Sword Attack Logic
if (keyboard_check_pressed(ord("E")) && !is_attacking && !is_sliding) {
    is_attacking = true;
    attack_timer = attack_duration;
    var sword_x = x + 50;
    var sword_y = y - 20;
    var sword = instance_create_layer(sword_x, sword_y, "Instances", obj_attackEffect);
    var attack_sound = choose(Sound_Attack1, Sound_Attack2);
    audio_play_sound(attack_sound, 1, false);
}
if (is_attacking) {
    attack_timer -= 1;
    if (attack_timer <= 0) {
        is_attacking = false;
        instance_destroy(obj_attackEffect);
    }
}

// Lock Ninja Rotation
phy_rotation = 0;

// Debug Messages
show_debug_message("pv du ninja = " + string(global.ninja_pv));
show_debug_message("movespeed = " + string(round(global.movespeed / 10)));
