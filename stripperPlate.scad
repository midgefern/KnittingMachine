include<params.scad>;
include<assembly.scad>;
include<camplate.scad>;

module stripperPlate() {
    $fn = 50;
    hull() {
        translate([-CAM_PLATE_WIDTH/2, 0, -camPlateHeight]) {
        //cube([CAM_PLATE_WIDTH,NEEDLE_EXTENSION,1]);
        cube([CAM_PLATE_WIDTH,1,camPlateHeight]);
        }
        translate([-CAM_PLATE_WIDTH/4,NEEDLE_EXTENSION-4,-camPlateHeight/2])
         sphere(d = camPlateHeight/2);
        translate([CAM_PLATE_WIDTH/4,NEEDLE_EXTENSION-4,-camPlateHeight/2])
         sphere(d = camPlateHeight/2);
        translate([camPlateHeight,NEEDLE_EXTENSION-camPlateHeight/2,-camPlateHeight/2])
         sphere(d = camPlateHeight);
        translate([-camPlateHeight,NEEDLE_EXTENSION-camPlateHeight/2,-camPlateHeight/2])
         sphere(d = camPlateHeight);
    }
}

translate([CAM_PLATE_WIDTH/2,-NEEDLE_BED_DEPTH - NEEDLE_EXTENSION - tolerance * 2,-needleSlotHeight])
stripperPlate();