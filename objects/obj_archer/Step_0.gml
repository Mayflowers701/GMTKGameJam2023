/// @description Handles Input, Physics, and Tools

// Handle Input:
var _key_right = keyboard_check(ord("D"));
var _key_left = keyboard_check(ord("A"));
var _key_jump = keyboard_check_pressed(vk_space);

// Horizontal movement
var _h_walk = (_key_right - _key_left) * walk_speed;
if(!charge && !launched && !skid){
	vel_x = _h_walk; 
}else if(!airborne && !skid && !belly_up){
	vel_x = 0;
}

// Landing - behavior depends on previous state
if( place_meeting(x, y+1, obj_solid) ){
	airborne = false;
	jumping = false;
	
	if(launched){
	
		if(spin){
			spin = false;
			skid = true;
			
		}
		
		if(stun){
			stun = false;
			belly_up = true;
		}
	
	}
	launched = false;
	

}
// Jump
if( place_meeting(x, y+1, obj_solid) && _key_jump){
	airborne = true;
	jumping = true;
	skid = false; // reset fallen downs state
	belly_up = false; // reset fallen state
	vel_y = -jump_speed;
}


// Gravity
vel_y += grav;

// Collisions!
// Horizontal Collision
var _opx = sign(vel_x);
if(place_meeting(x+vel_x, y, obj_solid)){
	
	// Move as close as possible
	while (!place_meeting(x+_opx,y,obj_solid))
    {
        x = x + _opx;
    }
	
    
	
	// if in launched (bow, boomerang), enter "stun"
	
	if(launched || stun){
		//launched = false;
		spin = false;
		tumble = false;
		stun = true;
		
		vel_x = -sign(vel_x) * 1;
		vel_y = -1;
		image_angle = 0;
		
	}else{
		vel_x = 0;
	}
	
	
}
x += vel_x;

// Vertical Collision
_opx = sign(vel_y);
if(place_meeting(x, y+vel_y, obj_solid)){
	
	// Move as close as possible
	while (!place_meeting(x,y+_opx,obj_solid))
    {
        y = y + _opx;
    }
    vel_y= 0;
}
y += vel_y;


// Default Image
image_index = 0;

// Blink Animation
if( vel_x == 0 && vel_y == 0 ){
	blink_cycle++;
	image_index = max( (blink_cycle - 194)/2, 0 );
	if(blink_cycle > 200) blink_cycle = 0;
}

// Walk Animation
if(_h_walk != 0 && !airborne){
	image_index = walk_cycle/2 + 4;
	walk_cycle++;
	if(walk_cycle > 14) walk_cycle = 0;
}

// Jump Animation
if(jumping){
	//image_index = 15;
}

// Spin animation
if(spin){
	image_index = 19 + spin_cycle/2;
	spin_cycle++;
	image_angle = -90+ point_direction(x,y,mouse_x,mouse_y);
	
	if( spin_cycle > 27) spin_cycle = 0;
}

// Skid Animation
if( skid ){
	image_angle = 0;
	image_index = 33;
	vel_x = vel_x/1.1;
}

// Stun Animation
if( stun ){
	image_index = 34;
}

// Belly-up Animation
if( belly_up ){
	image_index = 35;
}
	

// Movement: update position based on velocity
//x += vel_x;
//y += vel_y;

// Facing: Update based on horizontal movement
if( !launched){
	if( vel_x < 0 ) image_xscale = -1;
	if( vel_x > 0 ) image_xscale = 1;
}


// Strip walk velocity so it doesn't stack
//vel_x -= _h_walk;


// If bow released, launch!
if(charge && mouse_check_button_released(mb_right)){
	launched = true;
	spin = true;
	
	vel_x = lengthdir_x( charge/20, mouse_x );
	vel_y = lengthdir_y( charge/20, mouse_y );
	airborne = true;
	
	//Drop Bow
	if(holding){
		bow = false;
		holding.held = false;
		holding = pointer_null;
	}
}

// Check for bow draw
if(mouse_check_button(mb_right) && bow){
	if(charge <= 150) charge+=5;
	image_index = 12;
}else{
	charge = 0;
}


// Previous Position
x_prev = x;
y_prev = y;
