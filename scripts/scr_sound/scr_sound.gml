function scr_sound_create(_snd_id){
	return audio_play_sound(_snd_id, 0, false)
}


function scr_sound_set_pitch(_emitter, _pitch){
	audio_emitter_pitch(_emitter, _pitch)
}


