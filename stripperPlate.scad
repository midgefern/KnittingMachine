include<params.scad>;

module stripperPlate() {
    hull() {
        translate([-CAM_PLATE_WIDTH/2, 0, -camPlateHeight]) {
        //cube([CAM_PLATE_WIDTH,NEEDLE_EXTENSION,1]);
        cube([CAM_PLATE_WIDTH,1,camPlateHeight]);
        }
        translate([-CAM_PLATE_WIDTH/4,NEEDLE_EXTENSION-4,-camPlateHeight/2])
         sphere(d = camPlateHeight/2);
        translate([CAM_PLATE_WIDTH/4,NEEDLE_EXTENSION-4,-camPlateHeight/2])
         sphere(d = camPlateHeight/2);
        translate([camPlateHeight,NEEDLE_EXTENSION,-camPlateHeight/2])
         sphere(d = camPlateHeight);
        translate([-camPlateHeight,NEEDLE_EXTENSION,-camPlateHeight/2])
         sphere(d = camPlateHeight);
    }
}
