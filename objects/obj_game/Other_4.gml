
// Place random powerups
var powerup_count = 25;
if(instance_number(par_SoftBlock) >= powerup_count) {
    while (powerup_count > 0) {
        var sb = instance_find(
            par_SoftBlock, 
            irandom_range(0, instance_number(par_SoftBlock))
        );
        
        if (sb == noone) {
            break;
        }
        
        if (sb.spawn_powerup == false) {
            sb.spawn_powerup = true;
            powerup_count--;
        }
    }
}