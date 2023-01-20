#macro cam view_camera[0]
#macro view_w camera_get_view_width(view_camera[0])
#macro view_h camera_get_view_height(view_camera[0])

// Camera settings
view_width = 1920/3;
view_height = 1080/3;

window_scale = 1;

zoom_factor = 1;
target_zoom_factor = zoom_factor;
zoom_change_factor = 0.1;

camera_center = [0, 0];
camera_follow_factor = 0.05;
window_set_size(view_width * window_scale, view_height * window_scale);
alarm[0] = 1;

bounds = [-1, -1, -1, -1]; // x1, y1, x2, y2
btm_bound_target = -1;
top_bound_target = -1;
right_bound_target = -1;
left_bound_target = -1;

surface_resize(
    application_surface, view_width * window_scale, view_height * window_scale
);

follow = noone;