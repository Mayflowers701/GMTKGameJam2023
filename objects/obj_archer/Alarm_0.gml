/// @description Play game music

if(!obj_music_box.music){
	audio_play_sound(sou_theme, 1, 1);
	obj_music_box.music = true;
	obj_music_box.theme = true;
}
