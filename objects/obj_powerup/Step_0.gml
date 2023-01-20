
if (appearing) {
    // Spin
    var spd = 0.1;
    xscale += spd*scale_direction;
    
    if(xscale == 1*scale_direction) {
        scale_direction *= -1;
    }
    
    // Fly up and land
    y_offset += y_offset_spd;
    if (y_offset < 0) {
        y_offset_spd += 0.4;
    } else {
        y_offset = 0;
        appearing = false;
    }
} else {
    // Lerp to scale
    xscale_spd = lerp(xscale_spd, (1 - xscale) * 0.5, 0.2);
    xscale += xscale_spd;
    
    // Wobble
    wobble_timer++;
    y_offset = sin(wobble_timer*0.02)*4;
    wobble = sin(wobble_timer*0.05)*16;
    
    // Collide with player
    if (place_meeting(x, y, obj_Player)) {
        switch (powerup) {
            case 0:
                obj_Player.bomb_count++;
                break;
            case 1:
                obj_Player.fire_count++;
                break;
            case 2:
                obj_Player.speed_count++;
                break;
        }
        
        instance_destroy();
    }
    
    // Collide with enemy
    
    // Collide with explosion
    if (place_meeting(x, y, par_Explosion)) {
        //instance_destroy();
        //show_message("Destroyed by bomb.");
    }
}

// Set depth
depth = -y;