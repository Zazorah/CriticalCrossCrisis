
enum Directions {
    down = 0,
    right = 1,
    left = 2,
    up = 3
}

// Stats
bomb_count = 1;
fire_count = 1;
speed_count = 1;

// Movement
walk_speed = 2;
hspd = 0;
vspd = 0;
direction_moving = Directions.down;
grid_lock_threshold = 16;
bomb_lock_threshold = 32;

// Bombs
last_bomb_pos = noone;
bombs = ds_list_create();

// Drawing
head_offset = 0;

// Collision method
function colliding_at(_x, _y) {
    if (place_meeting(_x, _y, par_Solid) ||
    place_meeting(_x, _y, par_SoftBlock)) {
        
        return true;
    }
}

// Method for finding open spaces
function horizontal_hole_direction(_x, _y, _dir, _intended_hspd, _intended_vspd) {
    var search_depth = 16;
    
    // Search Left
    for(var i = 0; i > -search_depth; i -= 4) {
        if (!colliding_at(x + i, y + _intended_vspd)) {
            return i;
        }
    }
    
    // Search Right
    for(var i = 0; i < search_depth; i+=4) {
        if (!colliding_at(x + i, y + _intended_vspd)) {
            return i;
        }
        
    }
    
    return -1;
}

// Set camera
global.camera.follow = self;