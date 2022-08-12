include<params.scad>;
include<needlebedScrews.scad>;

module spongeBar(screw = 0) {
        difference() {
        union () {
            frontRail();
            translate([0,-(NEEDLE_BED_DEPTH-COMB) + SPONGE_BAR/2, -1])
            cube([gauge,SPONGE_BAR - tolerance*2,2], center = true);
        }
        screwHoles(screw);
    }
}

module frontRail() {
    translate([0,-(NEEDLE_BED_DEPTH-COMB) + SPONGE_BAR/2, railHeight/2])
    cube([gauge, railDepth - tolerance*2, railHeight], center = true);
}

for(i = [0:numNeedles-1]) {
            if (i == 0 || i==numNeedles-2) {
                     translate([gauge*i, 0, 0])
                         spongeBar(screw = 1);   
            } else if (i==1 || i==numNeedles-1) {
                translate([gauge*i, 0, 0])
                         spongeBar(screw = -1);   
            } else {
                translate([gauge*i, 0, 0])
                         spongeBar(screw = 0);   
            }
        }