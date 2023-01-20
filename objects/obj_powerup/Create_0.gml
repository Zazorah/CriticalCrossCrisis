
// Actual powerup
enum PowerUp {
    bomb,
    flame,
    speed
}
powerup = irandom_range(0, 3);

// State
appearing = true;

// Draw
y_offset = -1;
y_offset_spd = -8;
wobble = 0;
wobble_timer = 0;
xscale = 0;
xscale_spd = 0;
scale_direction = 1;