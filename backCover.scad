include<params.scad>;
include<needlebedScrews.scad>;

module backCover(screw = 0) {
    union () {
        difference() {
            translate([0,-BACK_COVER/2 + tolerance, -((screwHeadHeight + 1) - tolerance)/2])
            cube([gauge, BACK_COVER - tolerance, (screwHeadHeight + 1) - tolerance], center = true);
            screwHoles(screw);
        }
        backRail();
    }
}

module backRail() {
    translate([0,-BACK_COVER/2 + tolerance, railHeight/2])
    cube([gauge, railDepth - tolerance*2, railHeight], center = true);
}

for(i = [0:numNeedles-1]) {
            if (i == 0 || i==numNeedles-2) {
                     translate([gauge*i, 0, 0])
                         backCover(screw = 1);   
            } else if (i==1 || i==numNeedles-1) {
                translate([gauge*i, 0, 0])
                         backCover(screw = -1);   
            } else {
                translate([gauge*i, 0, 0])
                         backCover(screw = 0);   
            }
        }