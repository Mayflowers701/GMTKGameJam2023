/// @description Insert description here
// You can write your code in this editor
var _wave_freq = 0.05
var _wave_strength = 1.0
time += _wave_freq;

x += sin(time) * _wave_strength
y -= 0.75;

var _dur = data[? "duration"];
_dur -= 1;
if (_dur <= 0)
	instance_destroy(self);
else {
	if (_dur < 30) {
		alpha = _dur / 30
	}
	data[? "duration"] = _dur;
}