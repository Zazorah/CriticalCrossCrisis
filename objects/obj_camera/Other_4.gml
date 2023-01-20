
// Set up view
view_enabled = true;
view_visible[0] = true;

// Snap camera on start
if (follow == noone) exit
if (instance_exists(follow)) {
    var _x = clamp(follow.x - view_w/2, 0, room_width - view_w);
    var _y = clamp(follow.y - view_h/2, 0, room_height - view_h);
    
    camera_set_view_pos(cam, _x, _y);
    camera_center = [follow.x, follow.y];
    camera_set_view_center(cam, camera_center[0], camera_center[1], false, bounds);
}