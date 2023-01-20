
// Destroy self on explosion
if (place_meeting(x, y, par_Explosion)) {
    instance_destroy();
}

// Set depth
depth = -y;