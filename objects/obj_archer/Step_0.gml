/// @description Handles Input, Physics, and Tools

// Before we do anything, check to make sure we're not in a floor
// teleport out of floor if stuck
while( place_meeting(x,y, obj_solid) ){
	if(tumble && !iframe) {y++; tumble = false; stun = true;}
	else {y--;}
}



// Handle Input:
var _key_right = keyboard_check(ord("D"));
var _key_left = keyboard_check(ord("A"));
var _key_jump = keyboard_check_pressed(vk_space);

// Horizontal movement
var _h_walk = (_key_right - _key_left) * walk_speed;
if(!charge && !launched && !skid && !belly_up){
	vel_x = _h_walk; 
}else if(!airborne && !launched && !skid && !belly_up ){
	vel_x = 0;
}

// Landing - behavior depends on previous state
if( place_meeting(x, y+1, obj_solid) && !iframe ){
	airborne = false;
	jumping = false;
	
	if(launched){
	
		if(spin){
			spin = false;
			skid = true;
			
		}
		
		if(tumble){
			tumble=false;
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
		audio_play_sound(sou_smack,1,0);
		audio_stop_sound(sou_birds);
		alarm[0] = 120;
		var _ouch = scr_text_create(x,y);
		scr_text_set_text(_ouch, hurt_line);
		scr_text_set_duration(_ouch, 2);
		
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
	image_angle = -90+ point_direction(x_prev,y_prev,x,y);
	
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
	image_angle = 0;
	image_index = 34;
}

// Belly-up Animation
if( belly_up ){
	image_angle = 0;
	image_index = 35;
	vel_x = vel_x/1.1;
}

// Tumble animation (boomerang)
// Should've called this "pinwheel"
if( tumble ){
	image_angle += 20;
	image_index = 15;
	
	var face = sign(image_xscale);
	
	boom_angle+=5;
	if(boom_angle >= 225){
		boom_angle = 225;
		
	}else{
		vel_y = lengthdir_y(boom_charge, boom_angle);	
	}
	
	vel_x = (lengthdir_x(boom_charge, boom_angle) +1)*face;
	
}

if(!tumble){
	boom_angle = 0;	
}
	

// Movement: update position based on velocity
//x += vel_x;
//y += vel_y;

// Facing: Update based on horizontal movement
if( !launched ){
	if( vel_x < 0 ) image_xscale = -1;
	if( vel_x > 0 ) image_xscale = 1;
}

if( charge ){
	image_xscale = sign( mouse_x - x ); // Face toward the mouse when charging
	image_angle = 0;
}


// Strip walk velocity so it doesn't stack
//vel_x -= _h_walk;


// If bow released, launch!
if(charge && mouse_check_button_released(mb_left) && bow){
	iframe = 5;
	launched = true;
	spin = true;
	audio_play_sound(sou_bow, 1,0);
	
	vel_x = lengthdir_x( charge/20, point_direction(x,y,mouse_x,mouse_y) );
	vel_y = lengthdir_y( charge/20, point_direction(x,y,mouse_x,mouse_y) ) - 2;
	airborne = true;
	
	//Drop Bow
	if(holding){
		bow = false;
		holding.held = false;
		holding = pointer_null;
	}
}

// If boomerang released, launch!
if(charge && mouse_check_button_released(mb_left) && boomerang){
	iframe = 5;
	launched = true;
	tumble = true;
	audio_play_sound(sou_boomerang, 1, 0);
	
	boom_charge = charge/20;
	
	//vel_x = lengthdir_x( charge/20, point_direction(x,y,mouse_x,mouse_y) );
	//vel_y = lengthdir_y( charge/20, point_direction(x,y,mouse_x,mouse_y) ) - 2;
	airborne = true;
	
	//Drop Boomerang
	if(holding){
		boomerang = false;
		holding.held = false;
		holding = pointer_null;
	}
}

// Tic iframe
if(iframe){
	iframe--;
}

// Check for bow draw
if(mouse_check_button(mb_left) && bow){
	if(charge <= 150) charge+=5;
	image_index = 12;
}
// Check for boomerang draw
else if(mouse_check_button(mb_left) && boomerang){
	if(charge <= 150) charge+=5;
	image_index = 13;
}
// Reset charge
else{
	charge = 0;
}


// Previous Position
x_prev = x;
y_prev = y;

// terminal velocity
if( vel_y > 9 ){ vel_y = 9 ;}

// random hurt 
hurt_clock++;
switch hurt_clock{
	case 1: hurt_line = "Ouch!"; break;
	case 2: hurt_line = "Oof!"; break;
	case 3: hurt_line = "Ow!"; break;
	case 4: hurt_line = "Oh god my face!"; break;
	case 5: hurt_line = "Augh!"; break;
	case 6: hurt_line = "Argh!"; break;
	case 7: hurt_line = "Ugh!"; break;
	case 8: hurt_line = "Aarghh!"; break;
	case 9: hurt_line = "Ow ow ow!"; break;
}
if(hurt_clock >= 9) hurt_clock = 0;
	
	
