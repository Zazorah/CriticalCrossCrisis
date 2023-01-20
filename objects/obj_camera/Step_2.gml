
// Set camera
camera_set_view_size(cam, view_width * zoom_factor, view_height * zoom_factor);
camera_set_view_center(
    cam,
    camera_center[0],
    camera_center[1],
    true,
    bounds
);