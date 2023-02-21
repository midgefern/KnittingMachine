include<params.scad>;
include<camplate_coords.scad>;
include<utils.scad>;
include<camPinHoles.scad>;

module tCam() {
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

translate(tCamCoords)
tCam();

translate(tPivotCoords)
tPivot(solid = true);
