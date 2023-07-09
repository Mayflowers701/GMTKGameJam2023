/// @description Insert description here
// You can write your code in this editor

if( keyboard_check( ord("R"))){
	room_restart();
}

cloud_clock++;
if(cloud_clock >= cloud_goal){
	cloud_clock = 0;
	cloud_goal = irandom_range( 240, 840 );
	
	instance_create_layer( -128, irandom_range(0, room_height), "Clouds", obj_cloud);
}