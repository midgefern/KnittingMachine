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

module backRail(width = gauge, rounded = false) {
    translate([0,-BACK_COVER/2 + tolerance, railHeight/2]) {
        cube([width, railDepth - tolerance*2, railHeight], center = true);
        if (rounded) {
            translate([-width/2,0,0])
            cylinder(railHeight, d = railDepth-tolerance*2, center = true);
        }
    }
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