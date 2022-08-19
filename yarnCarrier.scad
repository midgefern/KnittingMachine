include<params.scad>;

// toggle which sections will render/export
exYarnCarrier = true;
exStripperPlate = true;
exYarnFeeder = true;

if (exYarnCarrier) {
    difference() {
        color("orchid")
        yarnCarrier();
        yarnCarrierCutout();
    }
}

if (exStripperPlate) {
    difference() {
        translate([CAM_PLATE_WIDTH/2,-NEEDLE_BED_DEPTH - NEEDLE_EXTENSION - tolerance * 2,-needleSlotHeight]) {
            union() {
                stripperPlate();
                stripperPlateNose();
            }
        }
        translate([-1,-tolerance, -tolerance])
        // flat edge
        translate([0,-(NEEDLE_BED_DEPTH + NEEDLE_EXTENSION + camPlateHeight + 2), 2])
        cube([CAM_PLATE_WIDTH + 4, camPlateHeight + 2, camPlateHeight + 2], center = false);
        
        
        yarnCarrierCutout();
    }
}

module yarnCarrierCutout() {
        hull() {
            translate([CAM_PLATE_WIDTH/2,0,0])
            yarnFeeder();
            
            translate([CAM_PLATE_WIDTH/2,YARN_DEPOSIT_Y,(camHeight + camPlateHeight*2)])
            cylinder(h = 1, r1 = 15, r2 = 32, center = true);
                
            translate([CAM_PLATE_WIDTH/2,YARN_DEPOSIT_Y - 35,(camHeight + camPlateHeight)/2])
            cylinder(h = camHeight + camPlateHeight, r1 = 20, r2 = 40, center = true);
                
            translate([CAM_PLATE_WIDTH/2,YARN_DEPOSIT_Y - 35,-camPlateHeight])
            cylinder(h = camHeight + camPlateHeight*2, r = 10, center = true);
        }
}

module yarnCarrier() {
    hull() {
        // main
        translate([0,-(NEEDLE_BED_DEPTH - COMB + 6),camHeight + camPlateHeight])
        cube([CAM_PLATE_WIDTH, SPONGE_BAR + 6, camPlateHeight]);
        // rounded edge
        translate([CAM_PLATE_WIDTH/2,-(NEEDLE_BED_DEPTH - COMB + 6 + tolerance + camPlateHeight/2),camHeight + camPlateHeight * 1.5])
        rotate([0,90,0])
        cylinder(CAM_PLATE_WIDTH, d = camPlateHeight, center = true, $fn = 30);
    }
    
    hull() {
        // overhang
        translate([0,-(NEEDLE_BED_DEPTH),2])
        cube([CAM_PLATE_WIDTH, COMB - 6 - tolerance, camPlateHeight]);
        
        // rounded edge
        translate([CAM_PLATE_WIDTH/2,-(NEEDLE_BED_DEPTH - COMB + 6 + tolerance + camPlateHeight/2),camHeight + camPlateHeight * 1.5])
        rotate([0,90,0])
        cylinder(CAM_PLATE_WIDTH, d = camPlateHeight, center = true, $fn = 30);
        
//         // flat edge
//        translate([CAM_PLATE_WIDTH/2,-(NEEDLE_BED_DEPTH - COMB + 6 + tolerance + camPlateHeight/2),camHeight + camPlateHeight * 1.5])
//        cube([CAM_PLATE_WIDTH, camPlateHeight, camPlateHeight], center = true);
//        
        
//        // rounded corner
//        translate([10,-(NEEDLE_BED_DEPTH),2])
//        cylinder(camPlateHeight, r = 10, center = false);
//        
//        //rounded corner
//        translate([CAM_PLATE_WIDTH - 10,-(NEEDLE_BED_DEPTH),2])
//        cylinder(camPlateHeight, r = 10, center = false);
//        
//        // angled front
//        translate([CAM_PLATE_WIDTH/4,-(NEEDLE_BED_DEPTH + NEEDLE_EXTENSION + camPlateHeight),
//        + 2])
//        cube([CAM_PLATE_WIDTH/2, NEEDLE_EXTENSION, camPlateHeight]);
        
//        // rounded edge
//        translate([CAM_PLATE_WIDTH/2,-(NEEDLE_BED_DEPTH + NEEDLE_EXTENSION + camPlateHeight),camPlateHeight/2 + 2])
//        rotate([0,90,0])
//        cylinder(CAM_PLATE_WIDTH/2, d = camPlateHeight, center = true, $fn = 30);
//        
        // flat edge
        translate([CAM_PLATE_WIDTH/2,-(NEEDLE_BED_DEPTH + NEEDLE_EXTENSION + camPlateHeight),camPlateHeight/2 + 2])
        cube([CAM_PLATE_WIDTH, camPlateHeight, camPlateHeight], center = true);
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

module yarnFeederCutout() {
    translate([CAM_PLATE_WIDTH/2, -(NEEDLE_BED_DEPTH + NEEDLE_EXTENSION + camPlateHeight + 2), camHeight])
    cylinder(h = camHeight*2 + 2, r = (NEEDLE_EXTENSION + camPlateHeight + 2) - (YARN_DEPOSIT_Y - NEEDLE_BED_DEPTH) + 5, center = true, $fn = 56);
}

module stripperPlate() {
    
    $fn = 50;
    color("blue")
    hull() {
//        translate([-CAM_PLATE_WIDTH/2, 0, -camPlateHeight]) {
//        //cube([CAM_PLATE_WIDTH,NEEDLE_EXTENSION,1]);
//        cube([CAM_PLATE_WIDTH,1,camPlateHeight +1]);
//        }
        translate([-CAM_PLATE_WIDTH/4,NEEDLE_EXTENSION-4,-camPlateHeight/2])
         sphere(d = camPlateHeight/2);
        translate([CAM_PLATE_WIDTH/4,NEEDLE_EXTENSION-4,-camPlateHeight/2])
         sphere(d = camPlateHeight/2);
        translate([camPlateHeight,NEEDLE_EXTENSION-camPlateHeight/2,-camPlateHeight/2])
         sphere(d = camPlateHeight);
        translate([-camPlateHeight,NEEDLE_EXTENSION-camPlateHeight/2,-camPlateHeight/2])
         sphere(d = camPlateHeight);
        translate([0, -(camPlateHeight)/2, -(camPlateHeight + 1)/2])
    rotate([0,90,0])
        cylinder(CAM_PLATE_WIDTH, d = camPlateHeight + 1, center = true, $fn = 30);
    }
}

module stripperPlateNose() {
    color("blue")
    hull () {
        translate([0, -(camPlateHeight)/2, -(camPlateHeight + 1)/2])
        rotate([0,90,0])
        cylinder(CAM_PLATE_WIDTH, d = camPlateHeight + 1, center = true, $fn = 30);
        
        // line up with front edge of yarn carrier
        translate([0,-(camPlateHeight + 1.5),needleSlotHeight + 2])
        rotate([0,90,0])
        cylinder(CAM_PLATE_WIDTH, d = needleSlotHeight + 1.5, center = true, $fn = 50);
    }
}



$fn = 50;

//// hole
//translate([0,YARN_DEPOSIT_Y,YARN_DEPOSIT_Z])
//#cylinder(3,d=3,center=true);

module yarnFeeder() {
    difference() {
        // yarn guide
        translate([0,YARN_DEPOSIT_Y,YARN_DEPOSIT_Z + 1.5])
        rotate([0,0,-90 + 15])
        rotate_extrude(angle= 330, convexity = 10, $fn = 100)
        translate([3, 0, 0])
        hull() {
            circle(r = 1.5, $fn = 100);
            translate([6,2,0])
            circle(r = 1.5, $fn = 100);
        }
        // lowest surface of guide should hit at jussst the right spot, but subtract the surface of the stripper plate to get correct angle in case yarn guide shape dips too low
        translate([0,-NEEDLE_BED_DEPTH - NEEDLE_EXTENSION - tolerance * 2,-needleSlotHeight + HOOK_DIAM])
        stripperPlate();
    }
}
translate([CAM_PLATE_WIDTH/2,0,0])
yarnFeeder();

translate([0,0,2])
color("red")
difference() {
    translate([CAM_PLATE_WIDTH/2,YARN_DEPOSIT_Y + 2,-1.25 - tolerance])
    cube([CAM_PLATE_WIDTH/2, 21.25, 2.5], center = true);
    translate([CAM_PLATE_WIDTH/2,YARN_DEPOSIT_Y,0])
    cylinder(h= 6, r = 3 + 6, center = true);
    
}
