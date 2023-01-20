
// Game State
stage = 0;
current_score = 0;
high_score = 0;

// Random seed
random_set_seed(current_second);

// Create camera
global.camera = instance_create_depth(0, 0, 0, obj_Camera);

// Starting Room
room_goto(rm_Test002);