function scr_text_create(_x, _y){
	var _obj_text = instance_create_layer(_x, _y, "instances", obj_text);
	return _obj_text;
}


function scr_text_set_text(_obj_text, _text){
	// "data" is handled within obj_text, do not delete
	_obj_text.data[? "text"] = _text;
}


function scr_text_set_duration(_obj_text, _seconds){
	// "data" is handled within obj_text, do not delete
	_obj_text.data[? "duration"] = int64(round(_seconds * 60));
}


function scr_text_set_rotation(_obj_text, _rotate){
	// "data" is handled within obj_text, do not delete
	_obj_text.data[? "rotate"] = _rotate
}