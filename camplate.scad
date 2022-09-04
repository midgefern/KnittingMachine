include<params.scad>;
//include<assembly.scad>;
use<assembly.scad>;
use<yarnCarrier.scad>;
    
    difference() {
        union() {
            backPlate();
            intersection () {
                color("purple")
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
            upthrowCam();
        }
        carriageScrews();
    }
//vCam();

module backPlate() {
    color("magenta")
    difference() {
        translate([0,-CAM_PLATE_DEPTH,camHeight])
        cube([CAM_PLATE_WIDTH, CAM_PLATE_DEPTH, camPlateHeight]);
        camPlateScrews();
        translate([CAM_PLATE_WIDTH,0,0])
        mirror([1,0,0])
        camPlateScrews();
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
        cube([railDepth/2,railDepth*2, camHeight], center = true);
        translate([railDepth/2,railDepth - tolerance * 2, 0])
        cylinder(h = camHeight + 2, d = railDepth, $fn = 50, center = true);
        translate([railDepth/2,-railDepth + tolerance*2, 0])
        cylinder(h = camHeight + 2, d = railDepth, $fn = 50, center = true);
    }
}

module upthrowCam() {
    color("blue") {
        translate([0, -89.691, 1])
        linear_extrude(camHeight)
        import("SVG/Upthrow_cam.svg");
        
        translate([CAM_PLATE_WIDTH, -89.691, 1])
        mirror([1,0,0])
        linear_extrude(camHeight)
        import("SVG/Upthrow_cam.svg");
    }
}

module vCam() {
    color("lime")
    difference () {
        union() {
            translate([0, -97, 1])
            linear_extrude(camHeight, $fn = 100)
            import("SVG/T1.svg");
            
            translate([CAM_PLATE_WIDTH, -97, 1])
            mirror([1,0,0])
            linear_extrude(camHeight, $fn = 100)
            import("SVG/T1.svg");
        }
        
        camPlateScrews();
        translate([CAM_PLATE_WIDTH,0,0])
        mirror([1,0,0])
        camPlateScrews();
        
        translate([58-xOffset,-90,0])
        mirror([1,0,0])
        linear_extrude(3)
        #text("T1", size = 6);
    }
}

module camPlateScrews() {
    $fn = 25;
    translate([0,0,camHeight])
    translate(vCamScrews[0])
    cylinder(camHeight*2, d = screwDiam, center = true);
    
    translate([0,0,1])
    translate(vCamScrews[0])
    cylinder((screwHeadHeight+1)*2, d = screwHeadDiam, center = true);  
    
    translate([0,0,camHeight])
    translate(vCamScrews[1])
    cylinder(camHeight*2, d = screwDiam, center = true);
    
    translate([0,0,1])
    translate(vCamScrews[1])
    cylinder((screwHeadHeight+1)*2, d = screwHeadDiam, center = true);  
    
    translate([0,0,camHeight])
    translate(vCamScrews[2])
    cylinder(camHeight*2, d = screwDiam, center = true);
    
    translate([0,0,1])
    translate(vCamScrews[2])
    cylinder((screwHeadHeight + 1)*2, d = screwHeadDiam, center = true);  
}

