
// Shorten trail if touching soft block
if (place_meeting(x, y, par_SoftBlock)) {
    length = 1;
}

// Create explosions in a line
if (length > 0) {
    var pos = [[0, 32], [32, 0], [-32, 0], [0, -32]];
    if (dir == noone) {
        // Explosion origin point.
        for (var i = 0; i < 4; i++) {
            var xpos = x + pos[i][0];
            var ypos = y + pos[i][1];
            if (!place_meeting(xpos, ypos, par_Solid)) {
                var e = instance_create_depth(xpos, ypos, depth, par_Explosion);
                e.dir = i;
                e.length = length - 1;
            }
        }
    } else {
        var xpos = x + pos[dir][0];
        var ypos = y + pos[dir][1];
        if (!place_meeting(xpos, ypos, par_Solid)) {
            var e = instance_create_depth(xpos, ypos, depth, par_Explosion);
            e.dir = dir;
            e.length = length - 1;
        }
    }
}