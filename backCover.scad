include<params.scad>;
use<needlebedScrews.scad>;

module backCover(width = gauge) { 
//    union () {
//        difference() {
            translate([0,-BACK_COVER/2, -((screwHeadHeight + 1) - tolerance)/2])
            cube([width, BACK_COVER - tolerance, (screwHeadHeight + 1) - tolerance], center = true);
//        }
//        backRail();
//    }
}

module backRail(width = gauge, rounded = false, tolerance = tolerance) {
    translate([0,-BACK_COVER/2, railHeight/2]) {
        cube([width, railDepth - tolerance*2, railHeight], center = true);
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

difference() {
//    union() {
//        for(i = [0:numNeedles-1]) {
                    translate([gauge*numNeedles/2 - gauge/2, 0, 0])

            backCover(width = numNeedles*gauge);
//        }
//    }
        needleBedScrews();
}

        
//        translate([gauge, 0, 0])
//        backRail(rounded = true);  
//        translate([gauge*numNeedles, 0, 0])
//        backRail(rounded = true);  
        translate([(gauge*numNeedles)/2 - gauge/2, 0, 0]) {
        backRail(width = (numNeedles - 1) * gauge, rounded = true);
            mirror([1,0,0])
                    backRail(width = (numNeedles - 1) * gauge, rounded = true);
        }
            
