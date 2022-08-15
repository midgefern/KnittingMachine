include<params.scad>;
use<needleBed.scad>;
use<backCover.scad>;
use<spongeBar.scad>;


module carriageRest() {
    union() {
        difference() {
            hull() {
                needleBase();   
                translate([-CAM_PLATE_WIDTH, -10, -needleBedHeight/2])
                cylinder(needleBedHeight, 10, 10, center = true); 
                
                translate([-CAM_PLATE_WIDTH, -NEEDLE_BED_DEPTH+10, -needleBedHeight/2])
                cylinder(needleBedHeight, 10, 10, center = true); 
            }
            for(i = [0:ceil(CAM_PLATE_WIDTH/gauge)]) {
               translate([-gauge*i, 0, 0])
               frontAngle(CAM_PLATE_WIDTH + 10);
            }
        }
        translate([gauge/2-CAM_PLATE_WIDTH/4,0,0]) {
            
            frontRail(CAM_PLATE_WIDTH/2, rounded = true);
            backRail(CAM_PLATE_WIDTH/2, rounded = true);
        }
    }
}

carriageRest();