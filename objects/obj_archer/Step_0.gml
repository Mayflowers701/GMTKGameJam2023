/// @description Insert description here
// You can write your code in this editor

// Movement: update position based on velocity
x += vel_x;
y += vel_y;

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


