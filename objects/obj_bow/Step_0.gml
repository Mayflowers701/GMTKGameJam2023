// if held, point to cursor
if(held){
	//image_angle = point_direction(x,y,mouse_x, mouse_y);
	image_index = 1 + (obj_archer.charge + 20)/30;
	x = obj_archer.x;
	y = obj_archer.y;
	
	if(obj_archer.charge){ 
		image_angle = point_direction(x,y,mouse_x,mouse_y);
		image_xscale = 1;
	}
	else{ 
		image_xscale = obj_archer.image_xscale; 
		image_angle = 0;
	}
	hold_cooldown = 60;

}else{
	hold_cooldown--;
	image_index = 0;
	image_angle = 0;
}