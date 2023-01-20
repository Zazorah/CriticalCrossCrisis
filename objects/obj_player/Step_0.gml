
// Create Bombs
if (keyboard_check_pressed(ord("Z")) && ds_list_size(bombs) < bomb_count) {
    var xpos = last_bomb_pos[0] + 16;
    var ypos = last_bomb_pos[1] + 16;
    var b = instance_create_depth(xpos, ypos, depth, par_Bomb);
    b.owner = self;
    ds_list_add(bombs, b.id);
}

// Horizontal and Vertical Movement
if (keyboard_check(vk_up)) {
    vspd = -walk_speed;
    direction_moving = Directions.up;
    
} else if (keyboard_check(vk_down)) {
    vspd = walk_speed;
    direction_moving = Directions.down;
} else {
    vspd = 0;
    
    if ((y + vspd) % grid_lock_threshold != 0) {
        if (direction_moving == Directions.down) {
            vspd = walk_speed;
        } else if(direction_moving == Directions.up) {
            vspd = -walk_speed;
        }
    }
}

vspd = vspd * (1 + (speed_count - 1)/6);
for (var i = 0; i < abs(vspd); i++) {
    if (!colliding_at(x, y + sign(vspd))) {
        y += sign(vspd);
        
        if (y % bomb_lock_threshold == 0) {
            last_bomb_pos[1] = y;
        }
        
        if (y % grid_lock_threshold == 0
            && !keyboard_check(vk_up)
            && !keyboard_check(vk_down)) {
            vspd = 0;
            break;
        }
    } else {
        vspd = 0;
    }
}

if (keyboard_check(vk_left)) {
    hspd = -walk_speed;
    direction_moving = Directions.left;
} else if (keyboard_check(vk_right)) {
    hspd = walk_speed;
    direction_moving = Directions.right;
} else {
    hspd = 0;
    
    if ((x + hspd) % grid_lock_threshold != 0) {
        if (direction_moving == Directions.left) {
            hspd = -walk_speed;
        } else if(direction_moving == Directions.right) {
            hspd = walk_speed;
        }
    }
}

hspd = hspd * (1 + (speed_count - 1)/6);
for (var i = 0; i < abs(hspd); i++) {
    if (!colliding_at(x + sign(hspd), y)) {
        x += sign(hspd);
        
        if (x % bomb_lock_threshold == 0) {
            last_bomb_pos[0] = x;
        }
        
        if (x % grid_lock_threshold == 0
            && !keyboard_check(vk_left)
            && !keyboard_check(vk_right)) {
            hspd = 0;
            break;
        }
    } else {
        hspd = 0;
    }
}

// Set and camera boundaries
if (place_meeting(x, y, obj_RoomBoundary)) {
    var bound = instance_place(x, y, obj_RoomBoundary);
    if (global.camera != noone) {
        global.camera.top_bound_target = bound.bbox_top;
        global.camera.btm_bound_target = bound.bbox_bottom;
        global.camera.left_bound_target = bound.bbox_left;
        global.camera.right_bound_target = bound.bbox_right;
    }
} else {
    if (global.camera != noone) {
        global.camera.top_bound_target = -1;
        global.camera.btm_bound_target = -1;
        global.camera.left_bound_target = -1;
        global.camera.right_bound_target = -1;
    }
}

// Wobble Head
head_offset = 32 + (sin(current_time*0.004)*2);

// Set depth
depth = -y;