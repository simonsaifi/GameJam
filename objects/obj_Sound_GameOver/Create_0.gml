// Play the room music
if (!audio_is_playing(Sound_GameOver)) {
    audio_play_sound(Sound_GameOver, 1, true); // Play the sound (looped)
}