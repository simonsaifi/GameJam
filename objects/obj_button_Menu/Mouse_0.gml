// Check if the menu music is playing and stop it
if (audio_is_playing(Sound_Menu)) {
    audio_stop_sound(Sound_Menu); // Stop the menu music
}

event_inherited();

room_goto(RoomMenu);