include<params.scad>;
//include<assembly.scad>;
use<assembly.scad>;
use<yarnCarrier.scad>;

$fn = 50;

tCamCoords = [46.409 - xOffset, -90.875, 1];
tPivotCoords = [93.191 - xOffset, -90.75, camHeight + camPlateHeight/2 - 1];
nutCoords = [51.746 - xOffset, -72.624, 1];
tSlotCoords = [53.62 - xOffset, -70.401, camHeight - 1];
frontCamCoords = [39.175 - xOffset, -97, 1];
backWallCoords = [16.5 - xOffset, -53, 1];
bumperCoords = [91.5 - xOffset, -75.85, 1];

camBPin = [28.655 - xOffset, -62.559, 0]; 
camCPin = [35.723 - xOffset, -62.109, 0];
camDPin = [35.041 - xOffset, -93.531, 0];

camBCoord = [18.823 - xOffset, -65.95, 1];
camBPlateCoord = [];
camBCutoutCoord = [20.904 - xOffset, -70.347, camHeight - tolerance];
camBSpringCoord = [23.32 - xOffset, -64.559, camHeight + camPlateHeight - 3 + 0.05];
camBSpringRevCoord = [26.655 - xOffset, -65.288, -camPlateHeight/2 - 0.05];

camCCoord = [32.179 - xOffset, -67.435, 1];
camCSpringCoord = [33.732 - xOffset, -66.603, camHeight - 3];
camCSpringRevCoord = [31.711 - xOffset, -64.127, camHeight - tolerance];


camDCoord = [16.867 - xOffset, -101.933, 1];
camDPlateCoord = [];
camDCutoutCoord = [27.299 - xOffset, -101.314, camHeight - tolerance];
camDSpringCoord = [29.226 - xOffset, -98.494, camHeight + camPlateHeight - 3 + 0.05];
//camDSpringRevCoord = [];

    
//difference() {
//    union() {
//        backPlate();
//        intersection () {
//            color("purple")
//            hull() { // rounded leading edges
//                translate([0,-CAM_PLATE_DEPTH,camHeight-camPlateHeight])
//                cube([CAM_PLATE_WIDTH, CAM_PLATE_DEPTH, camPlateHeight]);
//                
//                translate([camHeight/2,-CAM_PLATE_DEPTH,0])
//                cube([CAM_PLATE_WIDTH - camHeight, CAM_PLATE_DEPTH, camPlateHeight]);
//                
//                translate([camHeight/2,-CAM_PLATE_DEPTH/2,camHeight/2])
//                rotate([90,0,0])
//                cylinder(CAM_PLATE_DEPTH, d = camHeight, center = true, $fn = 50);
//                
//                translate([CAM_PLATE_WIDTH - camHeight/2,-CAM_PLATE_DEPTH/2,camHeight/2])
//                rotate([90,0,0])
//                cylinder(CAM_PLATE_DEPTH, d = camHeight, center = true, $fn = 50);
//            }
//            camRails();
//        }
////        upthrowCam();
//        translate(frontCamCoords)
//        linear_extrude(camHeight)
//        import("SVG/FrontCam.svg");  
//        translate(flip(frontCamCoords))
//        mirror([1,0,0])
//        linear_extrude(camHeight)
//        import("SVG/FrontCam.svg"); 
//       
//        translate(bumperCoords)
//        linear_extrude(camHeight)
//        import("SVG/BumperCam.svg");  
//        translate(flip(bumperCoords))
//        mirror([1,0,0])
//        linear_extrude(camHeight)
//        import("SVG/BumperCam.svg"); 
//        
//        translate(backWallCoords)
//        linear_extrude(camHeight)
//        import("SVG/BackWall.svg");  
//        translate(flip(backWallCoords))
//        mirror([1,0,0])
//        linear_extrude(camHeight)
//        import("SVG/BackWall.svg"); 
//    }
//    carriageScrews();
//}

//translate(tCamCoords)
//tCams();
//translate(flip(tCamCoords))
//mirror([1,0,0])
//tCams();
//
//translate(tPivotCoords)
//tPivot();
//translate(flip(tPivotCoords))
//mirror([1,0,0])
//tPivot();

// B and D lever plates are identical so we can multiply and mirror in the slicer
camBLeverPlate();

// multiply and mirror in the slicer
//camB();
//camC();
//camD();


// function and module definitions start here:
function flip(coords) = [CAM_PLATE_WIDTH - coords[0], coords[1], coords[2]];

module backPlate() {
    color("magenta")
    difference() {
        translate([0,-CAM_PLATE_DEPTH,camHeight])
        cube([CAM_PLATE_WIDTH, CAM_PLATE_DEPTH, camPlateHeight]);
        
        translate(tSlotCoords)
        tSlots();
        translate(flip(tSlotCoords))
        mirror([1,0,0])
        tSlots();
        
        translate(tPivotCoords)
        tPivot(tol = tolerance);
        translate(flip(tPivotCoords))
        mirror([1,0,0])
        tPivot(tol = tolerance);
        
        translate(camBCutoutCoord)
        linear_extrude(camPlateHeight + 1, convexity = 10, $fn=100) // check spring measurements
            import("SVG/BCamCutout.svg");
        translate(flip(camBCutoutCoord))
        mirror([1,0,0])
        linear_extrude(camPlateHeight + 1, convexity = 10, $fn=100) // check spring measurements
            import("SVG/BCamCutout.svg");
            
        translate(camDCutoutCoord)
        linear_extrude(camPlateHeight + 1, convexity = 10, $fn=100) // check spring measurements
            import("SVG/DCamCutout.svg");
        translate(flip(camDCutoutCoord))
        mirror([1,0,0])
        linear_extrude(camPlateHeight + 1, convexity = 10, $fn=100) // check spring measurements
            import("SVG/DCamCutout.svg");
        
        translate(camCSpringRevCoord)
        linear_extrude(1.2) // check spring measurements
            import("SVG/CSpringReverse.svg");
        translate(flip(camCSpringRevCoord))
        mirror([1,0,0])
        linear_extrude(1.2) // check spring measurements
            import("SVG/CSpringReverse.svg");
            
        camPinHoles();
    }
}


//echo("B & D Pin length: ", camPlateHeight * 2 + camHeight); // check min pin length to pass through all layers

module camBLeverPlate() {
    color("lime")
    translate([0,0,camHeight + camPlateHeight * 1.5 + tolerance]) {
        difference() {
            translate(camBPin)
            cylinder(camPlateHeight, d = 19.5, center = true, $fn = 50);
            
            camPinHoles();
            
            translate(camBSpringRevCoord)
            linear_extrude(1.2) // check spring measurements
            import("SVG/BSpringReverse.svg");
            translate(flip(camBSpringRevCoord))
            mirror([1,0,0])
            linear_extrude(1.2) // check spring measurements
            import("SVG/BSpringReverse.svg");
        }
    }
}

module camB() {
    difference() {
        union() {
            translate(camBCoord)
            linear_extrude(camHeight - (1 + tolerance))
            import("SVG/BCam.svg");
            
            translate([21.911 - xOffset, -65.951, camHeight - 1])
            linear_extrude(camPlateHeight + 1)
            import("SVG/BCamFill.svg");
        }
        camPinHoles();
        translate(camBSpringCoord)
            #linear_extrude(3) // check spring measurements
            import("SVG/BCamSpring.svg");        
    }    
}

module camC() {
    difference() {
        translate(camCCoord)
        linear_extrude(camHeight - (1 + tolerance))
        import("SVG/CCam.svg");
        
        camPinHoles();
        translate(camCSpringCoord)
            #linear_extrude(3) // check spring measurements
            import("SVG/CCamSpring.svg");        
    }    
    
}

module camD() {
    difference() {
        union() {
            translate(camDCoord)
            linear_extrude(camHeight - (1 + tolerance))
            import("SVG/DCam.svg");
            
            translate([27.507 - xOffset, -99.674, camHeight - 1])
            linear_extrude(camPlateHeight + 1)
            import("SVG/DCamFill.svg");
        }
        camPinHoles();
        translate(camDSpringCoord)
            #linear_extrude(3) // check spring measurements
            import("SVG/DCamSpring.svg");        
    }   
}

module camRails() {
    color("purple") {
        difference() {
            translate([0,-BACK_COVER,0.5])
            cube([CAM_PLATE_WIDTH,BACK_COVER, camHeight]);
            translate([0,-BACK_COVER/2, 0.5])
            camRailsInlet();
            translate([CAM_PLATE_WIDTH,-BACK_COVER/2, 0.5])
            mirror([1,0,0])
            camRailsInlet();
            backRail(width = CAM_PLATE_WIDTH*2 +1, tolerance = -tolerance);
        }
        
        difference() {
            translate([0,-CAM_PLATE_DEPTH,0.5])
            cube([CAM_PLATE_WIDTH,SPONGE_BAR + 6, camHeight]);
            translate([0,-(NEEDLE_BED_DEPTH-COMB) + SPONGE_BAR/2, 0.5])
            camRailsInlet();
            translate([CAM_PLATE_WIDTH,-(NEEDLE_BED_DEPTH-COMB) + SPONGE_BAR/2, 0.5])
            mirror([1,0,0])
            camRailsInlet();
            frontRail(width = CAM_PLATE_WIDTH*2 +1, tolerance = -tolerance);
        }
    }
}

//camRailsInlet(); // debug at origin

module camRailsInlet() {
    // cutout shape to round off entry to rail track
    difference() {
        cube([railDepth/2,railDepth*2, camHeight + railDepth/2], center = true);
        translate([railDepth/2,railDepth - tolerance * 2, 0])
        cylinder(h = camHeight + 8, d = railDepth, $fn = 50, center = true);
        translate([railDepth/2,-railDepth + tolerance*2, 0])
        cylinder(h = camHeight + 8, d = railDepth, $fn = 50, center = true);
        
        rotate([90,0,0])
        translate([railDepth/2 - tolerance, camHeight - railDepth/2, 0])
        cylinder(CAM_PLATE_DEPTH, d = railDepth + tolerance * 2, center = true, $fn = 50);
    }
}

module tCams() {
    // adjustable tension cams 
    difference() {
            linear_extrude(camHeight - (1 + tolerance))
            import("SVG/TCam.svg");
        
        translate([nutCoords[0] - tCamCoords[0], nutCoords[1] - tCamCoords[1], camHeight - (1 + tolerance*2) - nutHeight])
            linear_extrude(nutHeight + tolerance*2 + 1)
            import("SVG/Hex4_40.svg");    
    }
}

module tPivot(tol = 0) {
     // pivot 
    cylinder(camPlateHeight + 3, d = 8 + tol , center = true);
}

module tSlots() {
    // curved cutout for tension adjustment screws
        linear_extrude(camPlateHeight + 2)
        import("SVG/TSlot.svg");
}

module camPinHoles(camPinDiam = 2.0) {
//    camPinDiam = 1.7 + tolerance; // check hardware measurements
    translate(camBPin)
    pinHole(camPinDiam);   
    translate(flip(camBPin))
    mirror([1,0,0])
    pinHole(camPinDiam);
    translate(camCPin)
    pinHole(camPinDiam);   
    translate(flip(camCPin))
    mirror([1,0,0])
    pinHole(camPinDiam);
    translate(camDPin)
    pinHole(camPinDiam);   
    translate(flip(camDPin))
    mirror([1,0,0])
    pinHole(camPinDiam);
}

module pinHole(camPinDiam) {
        cylinder((camHeight + camPlateHeight + 1) * 2, d = camPinDiam, center = true);
}

//module upthrowCam() {
//    color("blue") {
//        translate([0, -89.691, 1])
//        linear_extrude(camHeight)
//        import("SVG/Upthrow_cam.svg");
//        
//        translate([CAM_PLATE_WIDTH, -89.691, 1])
//        mirror([1,0,0])
//        linear_extrude(camHeight)
//        import("SVG/Upthrow_cam.svg");
//    }
//}

//module vCam(t = 1) {
//    color("lime")
//    difference () {
//        union() {
//            translate([0, -97, 1])
//            linear_extrude(camHeight - 1, $fn = 100)
//            import(str("SVG/T",t,".svg"));
//            
//            translate([CAM_PLATE_WIDTH, -97, 1])
//            mirror([1,0,0])
//            linear_extrude(camHeight - 1, $fn = 100)
//            import(str("SVG/T",t,".svg"));
//        }
//        
//        camPlateScrews();
//        translate([CAM_PLATE_WIDTH,0,0])
//        mirror([1,0,0])
//        camPlateScrews();
//        
//        translate([58-xOffset,-90,0])
//        mirror([1,0,0])
//        linear_extrude(3)
//        #text(str("T",t), size = 6);
//    }
//}

//module camPlateScrews() {
//    $fn = 25;
//    translate([0,0,camHeight])
//    translate(vCamScrews[0])
//    cylinder(camHeight*2, d = screwDiam, center = true);
//    
//    translate([0,0,1])
//    translate(vCamScrews[0])
//    cylinder((screwHeadHeight+1)*2, d = screwHeadDiam, center = true);  
//    
//    translate([0,0,camHeight])
//    translate(vCamScrews[1])
//    cylinder(camHeight*2, d = screwDiam, center = true);
//    
//    translate([0,0,1])
//    translate(vCamScrews[1])
//    cylinder((screwHeadHeight+1)*2, d = screwHeadDiam, center = true);  
//    
//    translate([0,0,camHeight])
//    translate(vCamScrews[2])
//    cylinder(camHeight*2, d = screwDiam, center = true);
//    
//    translate([0,0,1])
//    translate(vCamScrews[2])
//    cylinder((screwHeadHeight + 1)*2, d = screwHeadDiam, center = true);  
//}

