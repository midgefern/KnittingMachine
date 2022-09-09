include<params.scad>;
use<needlebedScrews.scad>;

module backCover() { // (screw = 0) {
    union () {
        difference() {
            translate([0,-BACK_COVER/2, -((screwHeadHeight + 1) - tolerance)/2])
            cube([gauge, BACK_COVER - tolerance, (screwHeadHeight + 1) - tolerance], center = true);
//            screwHoles(screw);
        }
        backRail();
    }
}

module backRail(width = gauge, rounded = false, tolerance = tolerance) {
    translate([0,-BACK_COVER/2, railHeight/2]) {
        cube([width, railDepth - tolerance*2, railHeight], center = true);
        if (rounded) {
            translate([-width/2,0,0])
            sphere(railHeight, d = railDepth-tolerance*2, center = true);
        }
    }
}
difference() {
    union() {
        for(i = [0:numNeedles-1]) {
            // LS
            if (i == screwPlacement - 1 || i==numNeedles-(screwPlacement + 1)) {
                     translate([gauge*i, 0, 0])
                         backCover();  
               
            // RS 
            } else if (i==screwPlacement || i==numNeedles-screwPlacement) {
                translate([gauge*i, 0, 0])
                         backCover();  
               
            // no screw 
            } else {
                translate([gauge*i, 0, 0])
                         backCover();   
            }
        }
    }
    needleBedScrews();
}