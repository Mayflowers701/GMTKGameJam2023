// Initialise Viewports
view_enabled = true;
view_visible[0] = true;

view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = 512;
view_hport[0] = 256;

// Follow Player
view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0], 0, obj_archer, -1, -1, view_wport[0]/2, view_hport[0]/2);

var _dwidth = display_get_width();
var _dheight = display_get_height();
var _xpos = (_dwidth / 2) - 512;
var _ypos = (_dheight / 2) - 256;
window_set_rectangle(_xpos, _ypos, 1024, 512);

// Adjust Surface
surface_resize(application_surface, 512, 256);

cloud_clock = 0;
cloud_goal = irandom_range( 120, 420 );

for( var i = 0; i <= irandom_range( 1, 4 ); i++){
	instance_create_layer( irandom_range(0, room_width), irandom_range(0, room_height), "Clouds", obj_cloud);
}

