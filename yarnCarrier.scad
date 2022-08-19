include<params.scad>;
//include<assembly.scad>;
include<camplate.scad>;
include<yarnFeeder.scad>;

difference() {
    color("orchid")
    yarnCarrierPlate();

    hull() {
    translate([CAM_PLATE_WIDTH/2,0,0])
    yarnFeeder();
    
    translate([CAM_PLATE_WIDTH/2,YARN_DEPOSIT_Y,(camHeight + camPlateHeight*2)])
    cylinder(h = 1, r1 = 15, r2 = 32, center = true);
        
    translate([CAM_PLATE_WIDTH/2,YARN_DEPOSIT_Y - 35,(camHeight + camPlateHeight)/2])
    cylinder(h = camHeight + camPlateHeight, r1 = 20, r2 = 40, center = true);
    }
}


module yarnCarrierPlate() {
//    hull() {
//        // main
//        translate([0,-(NEEDLE_BED_DEPTH - COMB + 6),camHeight + camPlateHeight])
//        cube([CAM_PLATE_WIDTH, NEEDLE_BED_DEPTH - COMB + 6, camPlateHeight]);
//        // rounded edge
//        translate([CAM_PLATE_WIDTH/2,-(NEEDLE_BED_DEPTH - COMB + 6 + tolerance + camPlateHeight/2),camHeight + camPlateHeight * 1.5])
//        rotate([0,90,0])
//        cylinder(CAM_PLATE_WIDTH, d = camPlateHeight, center = true, $fn = 30);
//    }
    
    hull() {
        // overhang
        translate([0,-(NEEDLE_BED_DEPTH),2])
        cube([CAM_PLATE_WIDTH, COMB - 6 - tolerance, camPlateHeight]);
        
//        // rounded edge
//        translate([CAM_PLATE_WIDTH/2,-(NEEDLE_BED_DEPTH - COMB + 6 + tolerance + camPlateHeight/2),camHeight + camPlateHeight * 1.5])
//        rotate([0,90,0])
//        cylinder(CAM_PLATE_WIDTH, d = camPlateHeight, center = true, $fn = 30);
        
         // flat edge
        translate([CAM_PLATE_WIDTH/2,-(NEEDLE_BED_DEPTH - COMB + 6 + tolerance + camPlateHeight/2),camHeight + camPlateHeight * 1.5])
        cube([CAM_PLATE_WIDTH, camPlateHeight, camPlateHeight], center = true);
        
        
        // rounded corner
        translate([10,-(NEEDLE_BED_DEPTH),2])
        cylinder(camPlateHeight, r = 10, center = false);
        
        //rounded corner
        translate([CAM_PLATE_WIDTH - 10,-(NEEDLE_BED_DEPTH),2])
        cylinder(camPlateHeight, r = 10, center = false);
        
        // angled front
        translate([CAM_PLATE_WIDTH/4,-(NEEDLE_BED_DEPTH + NEEDLE_EXTENSION + camPlateHeight),
        + 2])
        cube([CAM_PLATE_WIDTH/2, NEEDLE_EXTENSION, camPlateHeight]);
        
//        // rounded edge
//        translate([CAM_PLATE_WIDTH/2,-(NEEDLE_BED_DEPTH + NEEDLE_EXTENSION + camPlateHeight),camPlateHeight/2 + 2])
//        rotate([0,90,0])
//        cylinder(CAM_PLATE_WIDTH/2, d = camPlateHeight, center = true, $fn = 30);
//        
        // flat edge
        translate([CAM_PLATE_WIDTH/2,-(NEEDLE_BED_DEPTH + NEEDLE_EXTENSION + camPlateHeight),camPlateHeight/2 + 2])
        cube([CAM_PLATE_WIDTH/2, camPlateHeight, camPlateHeight], center = true, $fn = 30);
    }
    
    
    
//    hull() {
//        
//        // rounded edge
//        translate([CAM_PLATE_WIDTH/2,-(NEEDLE_BED_DEPTH + NEEDLE_EXTENSION + camPlateHeight),camPlateHeight/2 + 2])
//        rotate([0,90,0])
//        cylinder(CAM_PLATE_WIDTH/2, d = camPlateHeight, center = true, $fn = 30);
//        
//        // vertical front
//        translate([CAM_PLATE_WIDTH*3/8,-(NEEDLE_BED_DEPTH + NEEDLE_EXTENSION + camPlateHeight*1.5),-(needleSlotHeight + camPlateHeight + tolerance)])
//        cube([CAM_PLATE_WIDTH/4, camPlateHeight + 2, needleSlotHeight + camPlateHeight + tolerance]);
//        
//        // rounded edge
//        translate([CAM_PLATE_WIDTH/2,-(NEEDLE_BED_DEPTH + NEEDLE_EXTENSION + camPlateHeight),-(needleSlotHeight + camPlateHeight + tolerance)])
//        rotate([0,90,0])
//        cylinder(CAM_PLATE_WIDTH/2, d = camPlateHeight, center = true, $fn = 30);
//    }
    
//    hull() {
//        
//        // rounded edge
//        translate([CAM_PLATE_WIDTH/2,-(NEEDLE_BED_DEPTH + NEEDLE_EXTENSION + camPlateHeight),-(needleSlotHeight + camPlateHeight + tolerance)])
//        rotate([0,90,0])
//        cylinder(CAM_PLATE_WIDTH/2, d = camPlateHeight, center = true, $fn = 30);
//        
//        // bottom lip
//        translate([CAM_PLATE_WIDTH*3/8,-(NEEDLE_BED_DEPTH + NEEDLE_EXTENSION + camPlateHeight),-(needleSlotHeight + camPlateHeight + tolerance) - camPlateHeight/2])
//        cube([CAM_PLATE_WIDTH/4, NEEDLE_EXTENSION - 10, camPlateHeight]);
//        
//        // rounded corners
//        translate([CAM_PLATE_WIDTH/2 - 14,-(NEEDLE_BED_DEPTH + NEEDLE_EXTENSION + camPlateHeight) + NEEDLE_EXTENSION + camPlateHeight - 13,-(needleSlotHeight + camPlateHeight + tolerance) - camPlateHeight/2])
//        cylinder(camPlateHeight, r = 12, center = false);
//    
//        translate([CAM_PLATE_WIDTH/2 + 14,-(NEEDLE_BED_DEPTH + NEEDLE_EXTENSION + camPlateHeight) + NEEDLE_EXTENSION + camPlateHeight - 13,-(needleSlotHeight + camPlateHeight + tolerance) - camPlateHeight/2])
//        cylinder(camPlateHeight, r = 12, center = false);
//        
//        // rounded edge
//        translate([CAM_PLATE_WIDTH/2,-(NEEDLE_BED_DEPTH + 1),-(needleSlotHeight + camPlateHeight + tolerance)])
//        rotate([0,90,0])
//        cylinder(CAM_PLATE_WIDTH/6, d = camPlateHeight, center = true, $fn = 30);
//    }
}

module yarnCarrierCutout() {
    translate([CAM_PLATE_WIDTH/2, -(NEEDLE_BED_DEPTH + NEEDLE_EXTENSION + camPlateHeight + 2), camHeight])
    #cylinder(h = camHeight*2 + 2, r = (NEEDLE_EXTENSION + camPlateHeight + 2) - (YARN_DEPOSIT_Y - NEEDLE_BED_DEPTH) + 5, center = true, $fn = 56);
}
