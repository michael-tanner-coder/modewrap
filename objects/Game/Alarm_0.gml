global.intro = false;
audio_stop_sound(snd_bg_music);
audio_play_sound(snd_bg_music, 4, true);
instance_create_layer(x, y, layer, obj_player);