// Initialise Viewports
view_enabled = true;
view_visible[0] = true;

view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = 256;
view_hport[0] = 128;

// Follow Player
view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0], 0, obj_archer, -1, -1, view_wport[0]/2, view_hport[0]/2);

var _dwidth = display_get_width();
var _dheight = display_get_height();
var _xpos = (_dwidth / 2) - 1024;
var _ypos = (_dheight / 2) - 512;
window_set_rectangle(_xpos, _ypos, 2048, 1024);

// Adjust Surface
surface_resize(application_surface, 256, 128);