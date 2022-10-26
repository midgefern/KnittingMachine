include<params.scad>;
use<needlebedScrews.scad>;
use<roundedRail.scad>;

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
//        cube([width, railDepth - tolerance*2, railHeight], center = true);
        if (rounded) {
            roundedRail(width, railDepth - tolerance*2, railHeight);
        } else {
            cube([width, railDepth - tolerance*2, railHeight], center = true);
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
        backRail(width = numNeedles * gauge, rounded = true);
//            mirror([1,0,0])
//                    backRail(width = (numNeedles - 1) * gauge, rounded = false);
        }
     