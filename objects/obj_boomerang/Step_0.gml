/// @description 

// if held, point to cursor
if(held){

	//image_angle = point_direction(x,y,mouse_x, mouse_y);
	image_index = 1;
	
	x = obj_archer.x + 6;
	y = obj_archer.y + 6;
	
	if(obj_archer.charge){ 
		image_alpha = 0;
	}
	else{ 
		image_alpha = 1;
	}
	hold_cooldown = 60;

}else{
	image_alpha = 1;
	hold_cooldown--;
	image_index = 0;
	image_angle = 0;
}
