if canHurt {
    if global.dollar > 0 then {
        canMove = false;
        canHurt = false;
        
        audio_play_sound(sndManPain,1,0);
        hsp = -2 * dir;
        vsp = -3;
        
        var t, angle, n, spd;
        t = 0;
        angle = 101.25;
        n = false;
        spd = 4;
        
        sprite_index = sprManOuch;
        
        while t < global.dollar {
            var ringID;
            ringID = instance_create(x,y,objBouncyDollar);
            ringID.vspeed = -sin(angle)*spd;
            ringID.hspeed =  cos(angle)*spd;
            if n == true {
                ringID.hspeed *= -1;
                angle += 22.5;
            }
            n = !n
            t += 1;
            if t = 16 {
                spd = 2;
                angle = 101.25;
            } if t = 32 {
                break;
            }
        }
        
        
        global.dollar = 0;
    } else {
        player_die();
    }
}
