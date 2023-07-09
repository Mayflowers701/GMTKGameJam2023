/// @description Insert description here
// You can write your code in this editor


draw_self();

draw_set_halign(fa_center);
draw_set_font(bitPotion);
draw_set_color(c_white);

if(!obj_archer.title && obj_archer.bow){
	draw_text(512/2, 256/2 -64, "hold LEFT MOUSE");
}

