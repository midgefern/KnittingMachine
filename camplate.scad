include<params.scad>;
include<camplate_coords.scad>;
use<backCover.scad>;
use<spongeBar.scad>;
include<yarnCarrier.scad>;
include<tPointer.scad>;

$fn = 50;

// TODO: This file has SO MUCH going on, it's a nightmare to navigate; refactor so each printable part has it's own file + one file to visualize full carriage assembly? plus might be able to clean up some repetitive code

// --- LAYOUT: MAIN CARRIAGE/CAMPLATE BED    
difference() {
    color("purple")
    union() {
        backPlate();
        intersection () {
            hull() { // rounded leading edges
                translate([0,-CAM_PLATE_DEPTH,camHeight-camPlateHeight])
                cube([CAM_PLATE_WIDTH, CAM_PLATE_DEPTH, camPlateHeight]);
                
                translate([camHeight/2,-CAM_PLATE_DEPTH,0])
                cube([CAM_PLATE_WIDTH - camHeight, CAM_PLATE_DEPTH, camPlateHeight]);
                
                translate([camHeight/2,-CAM_PLATE_DEPTH/2,camHeight/2])
                rotate([90,0,0])
                cylinder(CAM_PLATE_DEPTH, d = camHeight, center = true, $fn = 50);
                
                translate([CAM_PLATE_WIDTH - camHeight/2,-CAM_PLATE_DEPTH/2,camHeight/2])
                rotate([90,0,0])
                cylinder(CAM_PLATE_DEPTH, d = camHeight, center = true, $fn = 50);
            }
            camRails();
        }
        translate(frontWallCoords)
        linear_extrude(camHeight)
        import("SVG/FrontWall.svg");  
        translate(flip(frontWallCoords))
        mirror([1,0,0])
        linear_extrude(camHeight)
        import("SVG/FrontWall.svg"); 
       
        translate(bumperCoords)
        linear_extrude(camHeight)
        import("SVG/BumperCam.svg");  
        translate(flip(bumperCoords))
        mirror([1,0,0])
        linear_extrude(camHeight)
        import("SVG/BumperCam.svg"); 
        
        translate(backWallCoords)
        linear_extrude(camHeight)
        import("SVG/BackWall.svg");  
        translate(flip(backWallCoords))
        mirror([1,0,0])
        linear_extrude(camHeight)
        import("SVG/BackWall.svg"); 
    }
    carriageScrews();
}

//!backPlate();
//
//backPlateTest();
//
// --- LAYOUT: SPRING CAM INSERTS AND LEVER PLATES ---
difference() {
    translate(wpPin)
    springCamInsert(solid = true);   
    translate(wpCamSpringRevCoord)
    linear_extrude(3) // check spring measurements
    import("SVG/WPSpringReverse.svg");
    translate([0,0,2])
    camPinHoles();
}

difference() {    
    translate(flip(wpPin))
    mirror([1,0,0])
    springCamInsert(solid = true);
    translate(flip(wpCamSpringRevCoord))
    mirror([1,0,0])
    linear_extrude(3) // check spring measurements
    import("SVG/WPSpringReverse.svg");
    translate([0,0,2])
    camPinHoles();
}   

difference() {
    translate(holdPin)
    springCamInsert(solid = true);   
    translate(holdCamSpringRevCoord)
    linear_extrude(3) // check spring measurements
    import("SVG/HoldCamSpringReverse.svg");
    translate([0,0,2])
    camPinHoles();
}

difference() {    
    translate(flip(holdPin))
    mirror([1,0,0])
    springCamInsert(solid = true);
    translate(flip(holdCamSpringRevCoord))
    mirror([1,0,0])
    linear_extrude(3) // check spring measurements
    import("SVG/HoldCamSpringReverse.svg");
    translate([0,0,2])
    camPinHoles();
} 
 
difference() {
    translate(wpPin)
    leverPlate(165);
    translate([0,0,2])
    camPinHoles();
}
//
//difference() {
//    translate(flip(wpPin))
//    mirror([1,0,0])
//    leverPlate();
//    translate([0,0,2])
//    camPinHoles();
//}
//
difference() {
    translate(holdPin)
    leverPlate(200);
    translate([0,0,2])
    camPinHoles();
}
//
//difference() {
//    translate(flip(holdPin))
//    mirror([1,0,0])
//    leverPlate();
//    translate([0,0,2])
//    camPinHoles();
//}


// --- LAYOUT: CAMS ---

translate(tCamCoords)
tCams();
translate(flip(tCamCoords))
mirror([1,0,0])
tCams();

translate(tPivotCoords)
tPivot(solid = true);
translate(flip(tPivotCoords))
mirror([1,0,0])
tPivot(solid = true); 

// multiply and mirror in slicer for now:
holdCam();
wpCam();


// --- FUNCTION AND MODULE DEFS START HERE:
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
        
        camPinHoles();
        
        translate(wpPin) {
            springCamInsert(tol = tolerance);
            rotate([0,0,-11])
            translate([7,1,camHeight-tolerance])
            #cube([6,1,1], center = false);
            
            rotate([0,0,200])
            translate([8,4,camHeight + camPlateHeight - 1 + tolerance])
            #cube([4,1,1]);
        }         
        translate(flip(wpPin)) {
            springCamInsert(tol = tolerance);
            mirror([1,0,0])    
            rotate([0,0,-11])
            translate([7,1,camHeight-tolerance])
            #cube([6,1,1], center = false);
            
            mirror([1,0,0])    
            rotate([0,0,200])
            translate([8,4,camHeight + camPlateHeight - 1 + tolerance])
            #cube([4,1,1]);
        }
//        springCamInsert(tol = tolerance);        
        translate(holdPin) {
            springCamInsert(tol = tolerance);  
            rotate([0,0,25])
            translate([7,-2,camHeight-tolerance])
            #cube([6,1,1], center = false); 
                
            rotate([0,0,200])
            translate([8,4,camHeight + camPlateHeight - 1 + tolerance])
            #cube([4,1,1]);
        }      
        translate(flip(holdPin)) {
            springCamInsert(tol = tolerance); 
            mirror([1,0,0])
            rotate([0,0,25])
            translate([7,-2,camHeight-tolerance])
            #cube([6,1,1], center = false); 
            
            mirror([1,0,0])    
            rotate([0,0,200])
            translate([8,4,camHeight + camPlateHeight - 1 + tolerance])
            #cube([4,1,1]);
        }
        
        // tension adjustment marks
        translate([flip(tPivotCoords)[0],tPivotCoords[1],camHeight + camPlateHeight - 1 + tolerance]) {
            for (i = [0:2:8]) {
                mirror([1,0,0])
                rotate([0,0,360-30.06 - i*tensionAngleInc])
                translate([tensionMarksDist,0,0])               
                #cube([6,0.5,1], center = false); 
            }
        } 
        translate([tPivotCoords[0],tPivotCoords[1],camHeight + camPlateHeight - 1 + tolerance]) {
            for (i = [0:2:8]) {
                rotate([0,0,360-30.06 - i*tensionAngleInc])
                translate([tensionMarksDist,0,0])
                #cube([6,0.5,1], center = false); 
            }
        } 
    }
}

//tPointer();
//
//module tPointer() {
//    difference() {
//    translate(tPointerCoord)
//    linear_extrude(2)
//    import("SVG/TPointer.svg");
//    // TODO: this hole needs to match the one in tPivot so it should probably be extracted to a reusable module or something    
//    translate(tPivotCoords)
//    cylinder(camPlateHeight*4, d = screwDiamSm, center = true);
//    }
//}
//!backPlateTest();
module backPlateTest() {
    color("magenta")
    difference() {
        translate([5,-CAM_PLATE_DEPTH+17,camHeight])
//        cube([25, 45, camPlateHeight]);
        cube(1);
        
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
        
        camPinHoles();
        
        translate(wpPin) {
            #springCamInsert(tol = tolerance);
            rotate([0,0,-11])
            translate([7,1,camHeight-tolerance])
            cube([6,1,1], center = false);
            
            rotate([0,0,200])
            translate([8,4,camHeight + camPlateHeight - 1 + tolerance])
            cube([4,1,1]);
        }        
        translate(flip(wpPin))
        springCamInsert(tol = tolerance);        
        translate(holdPin) {
            #springCamInsert(tol = tolerance); 
            rotate([0,0,25])
            translate([7,-2,camHeight-tolerance])
            cube([6,1,1], center = false); 
                
            rotate([0,0,200])
            translate([8,4,camHeight + camPlateHeight - 1 + tolerance])
            cube([4,1,1]);
        }      
        translate(flip(holdPin))
        springCamInsert(tol = tolerance);       
        
    }
    difference() {
        translate(wpPin)
        springCamInsert(solid = true);   
        translate(wpCamSpringRevCoord)
        linear_extrude(3) // check spring measurements
        import("SVG/WPSpringReverse.svg");
        translate([0,0,2])
        camPinHoles();
    }
    
    difference() {
        translate(holdPin)
        springCamInsert(solid = true);   
        translate(holdCamSpringRevCoord)
        linear_extrude(3) // check spring measurements
        import("SVG/HoldCamSpringReverse.svg");
        translate([0,0,2])
        camPinHoles();
    }


}

module springCamInsert(tol = 0, solid = false) {
    color("red")
//    difference()    {
        union() {
            translate([0,0,camHeight + camPlateHeight/2])
            cylinder(h = camPlateHeight + tol * 2, d = 14 + tol * 2, center = true); 
            translate([0,0,camHeight + camPlateHeight/4])
            cylinder(h = camPlateHeight/2 + tol*2, d = 16 + tol * 2, center = true); 
        }
//        if (solid) // alignment key
//        alignmentMark();
//    }
}

//!leverPlate();

module leverPlate(rot) {
//    color("orange")
    difference() {
        translate([0,0,camHeight + camPlateHeight + 1.5/2 + tolerance])    { 
            union() {
                cylinder(h = 1.5, d = 18, center = true); 
                rotate([0,0,rot]) {
                    translate([7,0,1.5/2])
                    color("lime")
                    leverPlatePeg();
                    translate([-7,0,1.5/2])
                    color("blue")
                    leverPlatePeg();
                } 
            } 
        }  // alignment "lock"
//        alignmentMark(tol = tolerance);
        rotate([0,0,200])
        translate([4,4,camHeight + camPlateHeight + 1 + tolerance])
        #cube([4,1,1]);
    }   
}

//!leverLock();

module leverLock() {
//    color("orange")
    translate([0,0,camHeight + camPlateHeight + 1.5/2 + tolerance])    { 
//        cube([18, CAM_PLATE_DEPTH,1.5], center = true); 
    bobbyWidth = 1.5;
    bobbyHeight = 0.6;
    difference() {
        union() {
            translate([0,0,1])
            cube([3,4,2], center = true);
            translate([-1.5,0,2])
            rotate([0,90,0])
            cylinder(3,2,2);
        }
        translate([0,0,2])
        cube([3.5, bobbyWidth + tolerance*2, bobbyHeight*2 + tolerance*2], center = true); 
        translate([0,0,0.5])
        cube([3.5, 3, 1 + tolerance*2], center = true);  
    }    
    } 
    
}

//leverPlatePeg(); // debug at origin

module leverPlatePeg() {
    // hole is sized for a piece of bobby pin (flat side) measuring 1.5mm wide x 0.6mm thick
    
    bobbyWidth = 1.5;
    bobbyHeight = 0.6;
    difference() {
        union() {
            translate([0,0,1])
            cube([3,4,2], center = true);
            translate([-1.5,0,2])
            rotate([0,90,0])
            cylinder(3,2,2);
        }
        translate([0,0,2])
        cube([3.5, bobbyWidth + tolerance*2, bobbyHeight + tolerance*2], center = true);    
    }
}

module wpCam() {
    color("green")
    difference() {
        union() {
            translate(wpCamCoord)
            linear_extrude(camHeight - (camClearance + tolerance))
            import("SVG/WPCam.svg");
        }
        camPinHoles();
        translate(wpCamSpringCoord)
            #linear_extrude(3) // check spring measurements
            import("SVG/WPSpring.svg");        
    }    
}

module holdCam() {
    color("blue")
    difference() {
        union() {
            translate(holdCamCoord)
            linear_extrude(camHeight - (camClearance + tolerance))
            import("SVG/HoldCam.svg");
        }
        camPinHoles();
        translate(holdCamSpringCoord)
            #linear_extrude(3) // check spring measurements
            import("SVG/HoldCamSpring.svg");        
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

module tCams() {
    // adjustable tension cams 
    difference() {
            linear_extrude(camHeight - (camClearance + tolerance))
            import("SVG/TCam.svg");
        
        translate([nutCoords[0] - tCamCoords[0], nutCoords[1] - tCamCoords[1], camHeight - (1 + tolerance*2) - nutHeight])
            linear_extrude(nutHeight + tolerance*2 + 1)
            import("SVG/Hex4_40.svg");    
    }
}

module tPivot(tol = 0, solid = false) {
     // pivot 
    difference() {
        cylinder(camPlateHeight + 3, d = 8 + tol , center = true);
        if(solid) {
            translate([0,0,camPlateHeight/2])
            #cylinder(camPlateHeight, d = screwDiamSm , center = true);
        }     
    }
}

module tSlots() {
    // curved cutout for tension adjustment screws
        linear_extrude(camPlateHeight + 2)
        import("SVG/TSlot.svg");
}

module camPinHoles(camPinDiam = 2.0) {
    translate(wpPin)
    pinHole(camPinDiam);   
    translate(flip(wpPin))
    mirror([1,0,0])
    pinHole(camPinDiam);
    translate(holdPin)
    pinHole(camPinDiam);   
    translate(flip(holdPin))
    mirror([1,0,0])
    pinHole(camPinDiam);
}

module pinHole(camPinDiam) {
        cylinder((camHeight + camPlateHeight + 1) * 2, d = camPinDiam, center = true);
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