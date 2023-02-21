include<params.scad>;
include<camplate_coords.scad>;
include<utils.scad>;
use<backCover.scad>;
use<spongeBar.scad>;
//include<yarnCarrier.scad>;
include<tPointer.scad>;
use<springCamInsert.scad>;
include<camPinHoles.scad>;
use<wpCam.scad>;
use<holdCam.scad>;
use<tCam.scad>;
use<leverPlate.scad>;
use<backPlate.scad>;


/* 
Full camplate assembly for layout and debugging
See individual files to export models
*/

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
tCam();
translate(flip(tCamCoords))
mirror([1,0,0])
tCam();

translate(tPivotCoords)
tPivot(solid = true);
translate(flip(tPivotCoords))
mirror([1,0,0])
tPivot(solid = true); 

// multiply and mirror in slicer for now:
holdCam();
wpCam();