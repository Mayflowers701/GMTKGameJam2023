/// @description Instance Variables

// Instance Variables

// Physics
vel_x = 0;
vel_y = 0;

// Control Speed
walk_speed = 2;
jump_speed = 4;

// In Air
airborne = false;	// In the air for any reason
launched = false;	// Launched by an item
jumping = false;	// Jumped
spin = false;		// Launched by bow
tumble = false;		// Launched by boomerang
skid = false;		// Landing from spin
stun = false;		// Bouncing off a wall
belly_up = false;	// Landed after bouncing
iframe = 0;			// 5 frames of i when launched
grav = 0.2;

// Inventory
charge = 0; // max 120
bow = false
boomerang = false;
bowling_ball = false;

holding = pointer_null;

// Animation
walk_cycle = 0; // max 14
blink_cycle = 0; // max 150;
spin_cycle = 0; // max 20;

// Previous Position
x_prev = x;
y_prev = y;

// Boomerang Position
boom_charge = 0;
boom_angle = 0;



// Create Crosshair
instance_create_layer(0,0,"Instances", obj_crosshair);

// Sleeping
sleep = true;
