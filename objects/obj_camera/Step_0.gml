
// Zoom
zoom_factor = lerp(zoom_factor, target_zoom_factor, zoom_change_factor);

// Center
if(follow != noone) {
    camera_center[0] = lerp(camera_center[0], follow.x, camera_follow_factor);
    camera_center[1] = lerp(camera_center[1], follow.y, camera_follow_factor);
}

// Lerp bounds
if (btm_bound_target != -1) {
    if (bounds[0] = -1) {
        bounds[0] = left_bound_target;
        bounds[1] = top_bound_target;
        bounds[2] = right_bound_target;
        bounds[3] = btm_bound_target;
    } else {
        bounds[0] = lerp(bounds[0], left_bound_target, 0.1);
        bounds[1] = lerp(bounds[1], top_bound_target, 0.1);
        bounds[2] = lerp(bounds[2], right_bound_target, 0.1);
        bounds[3] = lerp(bounds[3], btm_bound_target, 0.1);
    }
} else {
    bounds = [-1, -1, -1, -1];
}