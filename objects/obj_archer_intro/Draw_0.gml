/// @description Insert description here
// You can write your code in this editor

draw_set_halign(fa_center);
draw_set_font(bitPotion);
draw_set_color(c_white);

if(sleep){
	draw_text(512/2, 256/2 -64, "press SPACE to begin");
}
else{
	draw_text(512/2, 256/2-64, "WASD to move \nSPACE to jump");
}


draw_self();