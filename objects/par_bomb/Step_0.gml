
// Destory self on explosion
if (place_meeting(x, y, par_Explosion) && timer > 2) {
    timer = 2;
}

// Tick timer and then explode
timer--;
if (timer <= 0) {
    instance_destroy();
}

// Throb
if (timer % 60 == 0 || (timer < 60 && timer % 15 == 0)) {
    scale_spd = 0.2;
    throb_spd = 0.4;
}

scale_spd = lerp(scale_spd, (1 - scale) * 0.5, 0.2);
throb_spd = lerp(throb_spd, (0 - throb) * 0.5, 0.2);
scale += scale_spd;
throb += throb_spd;
throb = clamp(throb, 0.0, 1.0);

// Set depth
depth = -y;