// Play the room music
if (!audio_is_playing(Sound_Menu)) {
    audio_play_sound(Sound_Menu, 1, true); // Play the sound (looped)
}