include<params.scad>;
use<needlebedScrews.scad>;

module spongeBar(width = gauge) { 
//        difference() {
//        union () {
//            frontRail();
            translate([0,-(NEEDLE_BED_DEPTH-COMB) + SPONGE_BAR/2, -1])
            cube([width,SPONGE_BAR - tolerance*2,2], center = true);
//        }
//    }
}

module frontRail(width = gauge, rounded = false, tolerance = tolerance) {
    translate([0,-(NEEDLE_BED_DEPTH-COMB) + SPONGE_BAR/2, railHeight/2]) {
        cube([width, railDepth - tolerance*2, railHeight], center = true);
//        if (rounded) {
//            translate([-width/2,0,0])
//            cylinder(railHeight, d = railDepth-tolerance*2, center = true);
//        }
        if (rounded) {
            hull () {
                $fn = 50;
                translate([-width/2 + tolerance*2,0,-railHeight/2 + 0.5])
                cylinder(1, d = railDepth-tolerance*2, center = true);
                translate([-width/2 + tolerance*2,0,0])
                sphere(d = railDepth-tolerance*2);
                translate([-width/2 + tolerance*2,0,0])
                cube([1, railDepth-tolerance*2, railHeight], center = true);
            }
        }
    }
}

//difference() {
//    union() {
//        for(i = [0:numNeedles-1]) {
//            translate([gauge*i, 0, 0])
//            spongeBar();
//        }
//    }
//    needleBedScrews();
//}

difference() {
    union() {
        translate([(gauge*numNeedles)/2 - gauge/2, 0, 0]) {
        frontRail(width = (numNeedles - 1) * gauge, rounded = true);
            mirror([1,0,0])
                    frontRail(width = (numNeedles - 1) * gauge, rounded = true);
        }
                    translate([gauge*numNeedles/2 - gauge/2, 0, 0])

            spongeBar(width = numNeedles*gauge);
//        }
    }
        needleBedScrews();
}

