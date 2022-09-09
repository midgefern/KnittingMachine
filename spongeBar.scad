include<params.scad>;
use<needlebedScrews.scad>;

module spongeBar() { //(screw = 0) {
        difference() {
        union () {
            frontRail();
            translate([0,-(NEEDLE_BED_DEPTH-COMB) + SPONGE_BAR/2, -1])
            cube([gauge,SPONGE_BAR - tolerance*2,2], center = true);
        }
//        screwHoles(screw);
    }
}

module frontRail(width = gauge, rounded = false, tolerance = tolerance) {
    translate([0,-(NEEDLE_BED_DEPTH-COMB) + SPONGE_BAR/2, railHeight/2]) {
        cube([width, railDepth - tolerance*2, railHeight], center = true);
        if (rounded) {
            translate([-width/2,0,0])
            cylinder(railHeight, d = railDepth-tolerance*2, center = true);
        }
    }
}

difference() {
    union() {
        for(i = [0:numNeedles-1]) {
            if (i == screwPlacement-1 || i==numNeedles-(screwPlacement+1)) {
                     translate([gauge*i, 0, 0])
                         spongeBar(); // (screw = 1);   
            } else if (i==screwPlacement || i==numNeedles-screwPlacement) {
                translate([gauge*i, 0, 0])
                         spongeBar(); // (screw = -1);   
            } else {
                translate([gauge*i, 0, 0])
                         spongeBar(); // (screw = 0);   
            }
        }
    }
    needleBedScrews();
}