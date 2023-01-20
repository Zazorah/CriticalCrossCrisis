
// Timer and then destroy
timer--;
if (timer <= 0) {
    scale = lerp(scale, 0, 0.5);
    if (scale <= 0.01) {
        instance_destroy();
    }
} else {
    scale = lerp(scale, 1, 0.5);
}