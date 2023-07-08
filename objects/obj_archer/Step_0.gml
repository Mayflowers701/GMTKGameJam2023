/// @description Handles Input, Physics, and Tools

// Handle Input:
var _key_right = keyboard_check(ord("D"));
var _key_left = keyboard_check(ord("A"));
var _key_jump = keyboard_check(vk_space);

// Horizontal movement
var _h_walk = (_key_right - _key_left) * walk_speed;
vel_x += _h_walk; //Will remove velocity added by walk later so it doesn't stack

// Jump
if(_key_jump){
	jumping = true;
}else{
	jumping = false;
}


// Blink Animation
if( vel_x == 0 && vel_y == 0 ){
	blink_cycle++;
	image_index = max( (blink_cycle - 194)/2, 0 );
	if(blink_cycle > 200) blink_cycle = 0;
}

// Walk Animation
if(_h_walk != 0){
	image_index = walk_cycle/2 + 4;
	walk_cycle++;
	if(walk_cycle > 14) walk_cycle = 0;
}else{
	image_index = 0;
}

// Jump Animation
if(jumping){
	image_index = 15;
}
	

// Movement: update position based on velocity
x += vel_x;
y += vel_y;

// Facing: Update based on horizontal movement
if( vel_x < 0 ) image_xscale = -1;
if( vel_x > 0 ) image_xscale = 1;

// Strip walk velocity so it doesn't stack
vel_x -= _h_walk;




/*
// Gravity and friction
if(airborne){
	vel_y += grav;
	image_angle = point_direction(x,y, mouse_x, mouse_y)-90;
}else{
	vel_y = 0;
	vel_x = vel_x/1.1;
}


// If bow released, launch!
if(charge && mouse_check_button_released(mb_right)){
	vel_x = -lengthdir_x( charge/60, mouse_x );
	vel_y = lengthdir_y( charge/60, mouse_y );
	airborne = true;
}

// Check for bow draw
if(mouse_check_button(mb_right)){
	if(charge <= 120) charge++;
	image_index = 1;
}else{
	image_index = 0;
	charge = 0;
}

// Temp -> if drawing, change color indicate such
if(charge){
	// Change image index
	//image_blend = c_green;
}else{
	//image_blend = c_white;
}

*/

