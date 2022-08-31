include<params.scad>;
//include<assembly.scad>;
use<assembly.scad>;
use<yarnCarrier.scad>;

difference() {
    union() {
        backPlate();
        camRails();
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
        
        backRail(width = CAM_PLATE_WIDTH*2 +1, tolerance = -tolerance);
    }
    
    difference() {
        translate([0,-CAM_PLATE_DEPTH,0.5])
        cube([CAM_PLATE_WIDTH,SPONGE_BAR + 6, camHeight]);
        
        frontRail(width = CAM_PLATE_WIDTH*2 +1, tolerance = -tolerance);
    }
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

