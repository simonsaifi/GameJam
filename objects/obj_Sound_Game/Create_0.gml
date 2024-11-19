// Play the room music
if (!audio_is_playing(Sound_Game)) {
    audio_play_sound(Sound_Game, 1, true); // Play the sound (looped)
}