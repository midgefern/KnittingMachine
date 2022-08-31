include<params.scad>;
//include<assembly.scad>;
//include<camplate.scad>;

$fn = 50;

// toggle which sections will render/export
exYarnCarrier = true;;
exStripperPlate = true;
exYarnFeeder = true;



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
        
        carriageScrews();
    }
}

if (exYarnFeeder) {
    translate([CAM_PLATE_WIDTH/2,0,0])
    difference() {
        yarnFeeder();
        translate([-CAM_PLATE_WIDTH/2,0,0])
        yarnSlot();
    }
    difference() {
        yarnFeederPlate();
        yarnSlot();
        carriageScrews();
    }
}

if (exYarnCarrier) {
    difference() {
        color("orchid", 0.5)
        
        yarnCarrier();
        yarnCarrierCutout();
translate([CAM_PLATE_WIDTH/2,YARN_DEPOSIT_Y + 2 + tolerance,camPlateHeight/2 + 1])
        cube([CAM_PLATE_WIDTH + 2, (NEEDLE_BED_DEPTH + NEEDLE_EXTENSION + camPlateHeight*1.5)-(NEEDLE_BED_DEPTH - COMB + 6 + tolerance) + 2, camPlateHeight + 2], center = true);        
        carriageScrews();
        
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
        
        // flat edge
        translate([CAM_PLATE_WIDTH/2,-(NEEDLE_BED_DEPTH + NEEDLE_EXTENSION + camPlateHeight),camPlateHeight/2 + 2.25])
        #cube([CAM_PLATE_WIDTH, camPlateHeight, camPlateHeight+1], center = true);
    }
}

module yarnCarrierCutout() {
        hull() {
//            translate([CAM_PLATE_WIDTH/2,0,0])
//            yarnFeeder();
            
            // back
            translate([CAM_PLATE_WIDTH/2,YARN_DEPOSIT_Y,(camHeight + camPlateHeight*2)])
            cylinder(h = 100, r1 = 15, r2 = 32, center = true);
             
         // wide cone front   
            translate([CAM_PLATE_WIDTH/2,YARN_DEPOSIT_Y - 35,(camHeight + camPlateHeight)/2])
            cylinder(h = camHeight + camPlateHeight, r = (CAM_PLATE_WIDTH - 55*2)/2, center = true);
                
//            // small frontmost
//            translate([CAM_PLATE_WIDTH/2,YARN_DEPOSIT_Y - 35,-camPlateHeight])
//            cylinder(h = camHeight + camPlateHeight*2, r = 10, center = true);
        }
}

module stripperPlate() {
    color("blue")
    hull() {
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
        cylinder(CAM_PLATE_WIDTH, d = needleSlotHeight + 2.5, center = true, $fn = 50);
    }
}

module yarnFeeder() {
    difference() {
        // yarn guide
        translate([0,YARN_DEPOSIT_Y,YARN_DEPOSIT_Z + 1.5])
        rotate([0,0,-90 + 15])
        rotate_extrude(convexity = 10, $fn = 100)
        translate([3, 0, 0])
        hull() {
            circle(r = 1.5, $fn = 100);
            translate([6,6,0])
            circle(r = 1.5, $fn = 100);
        }
        // lowest surface of guide should hit at jussst the right spot, but subtract the surface of the stripper plate to get correct angle in case yarn guide shape dips too low
        translate([0,-NEEDLE_BED_DEPTH - NEEDLE_EXTENSION - tolerance * 2,-needleSlotHeight + HOOK_DIAM])
        stripperPlate();
    }
}

module yarnSlot() {
    difference() {
        translate([CAM_PLATE_WIDTH/2,YARN_DEPOSIT_Y-15,0])
        cube([1.5,30,20], center = true);
    }
}

//module yarnFeederPlate() {
//    translate([0,0,2])
//    color("red")
//    difference() {
//        translate([CAM_PLATE_WIDTH/2,YARN_DEPOSIT_Y + 2 + tolerance,camPlateHeight/2])
//        cube([CAM_PLATE_WIDTH, (NEEDLE_BED_DEPTH + NEEDLE_EXTENSION + camPlateHeight*1.5)-(NEEDLE_BED_DEPTH - COMB + 6 + tolerance), camPlateHeight], center = true);
//        translate([CAM_PLATE_WIDTH/2,YARN_DEPOSIT_Y,0])
//        cylinder(h= (5)*2, d = 19 , center = true);
//    }
//}

module yarnFeederPlate() {
    difference() {
    translate([0,0,2])
    color("red") {
        union() {
            translate([55/2,YARN_DEPOSIT_Y + 2 + tolerance,camPlateHeight/2])
            cube([55, (NEEDLE_BED_DEPTH + NEEDLE_EXTENSION + camPlateHeight*1.5)-(NEEDLE_BED_DEPTH - COMB + 6 + tolerance), camPlateHeight], center = true);
        translate([CAM_PLATE_WIDTH - 55/2,YARN_DEPOSIT_Y + 2 + tolerance,camPlateHeight/2])
            cube([55, (NEEDLE_BED_DEPTH + NEEDLE_EXTENSION + camPlateHeight*1.5)-(NEEDLE_BED_DEPTH - COMB + 6 + tolerance), camPlateHeight], center = true);
            hull() {
                translate([CAM_PLATE_WIDTH/2,-(NEEDLE_BED_DEPTH - COMB + 11 + tolerance),camPlateHeight/2])
                cube([CAM_PLATE_WIDTH/2, 10, camPlateHeight], center = true);
                    translate([CAM_PLATE_WIDTH/2,YARN_DEPOSIT_Y,camPlateHeight/2])
                cylinder(h= camPlateHeight, d = 25 , center = true);
            }
        }
    }
        translate([CAM_PLATE_WIDTH/2,YARN_DEPOSIT_Y,2])
        cylinder(h= (5)*2, d = 19 , center = true);
}
}

module carriageScrews() {
    
    // attach to back of camplate
    translate([screwHeadDiam*1.5,-6,camHeight + camPlateHeight/2]) 
    #cylinder(h= 12*2, d = screwDiam, center = true);
    
    translate([CAM_PLATE_WIDTH/2,-6,camHeight + camPlateHeight/2]) 
    #cylinder(h= 12*2, d = screwDiam, center = true);
    
    translate([CAM_PLATE_WIDTH - screwHeadDiam*1.5,-6,camHeight + camPlateHeight/2]) 
    #cylinder(h= 12*2, d = screwDiam, center = true);

    // attach to front of camplate
    translate([screwHeadDiam*1.5,-(NEEDLE_BED_DEPTH - COMB - 6),camHeight + camPlateHeight/2]) 
    #cylinder(h= 12*2, d = screwDiam, center = true);
    
    translate([CAM_PLATE_WIDTH/2,-(NEEDLE_BED_DEPTH - COMB - 6),camHeight + camPlateHeight/2]) 
    #cylinder(h= 12*2, d = screwDiam, center = true);
    
    translate([CAM_PLATE_WIDTH - screwHeadDiam*1.5,-(NEEDLE_BED_DEPTH - COMB - 6),camHeight + camPlateHeight/2]) 
    #cylinder(h= 12*2, d = screwDiam, center = true);
    
    // attach stripper plate 
    // this spot is tiny so we need to use smaller (#4) screws for this!
    translate([0,-(NEEDLE_BED_DEPTH + NEEDLE_EXTENSION + camPlateHeight - 0.25),0]) {
        // screw hole
        translate([0,0,2]) {
    
            translate([screwHeadDiamSm*1.5,0,0])
            #cylinder(h= screwHeightSm, d = screwDiamSm, center = true);
            
            translate([screwHeadDiamSm*1.5 + 35,0,0])
            #cylinder(h= screwHeightSm, d = screwDiamSm, center = true);
            
            translate([CAM_PLATE_WIDTH - screwHeadDiamSm*1.5 - 35,0,0])
            #cylinder(h= screwHeightSm, d = screwDiamSm, center = true);
            
            translate([CAM_PLATE_WIDTH - screwHeadDiamSm*1.5,0,0])
            #cylinder(h= screwHeightSm, d = screwDiamSm, center = true);
        
        }
        // countersink
        translate([0,0,6.5 + screwHeadHeight/2]) {
            
            translate([screwHeadDiamSm*1.5,0,0])
            #cylinder(h= screwHeadHeightSm, d = screwHeadDiamSm, center = true);
 
            translate([screwHeadDiamSm*1.5 + 35,0,0])
            #cylinder(h= screwHeadHeightSm, d = screwHeadDiamSm, center = true);

            translate([CAM_PLATE_WIDTH - screwHeadDiamSm*1.5 -35,0,0])
            #cylinder(h= screwHeadHeightSm, d = screwHeadDiamSm, center = true);

            translate([CAM_PLATE_WIDTH - screwHeadDiamSm*1.5,0,0])
            #cylinder(h= screwHeadHeightSm, d = screwHeadDiamSm, center = true);
        }
    }         
    
    // attach yarn feeder plate from underneath
    
    translate([0,-(NEEDLE_BED_DEPTH - COMB/2),0]) {
        
        translate([0,0,2 - tolerance]) {
            // screw holes
            translate([screwHeadDiam*1.5,0,0])
            #cylinder(h= screwHeight-2, d = 2.8, center = false);
            
            translate([screwHeadDiam*1.5 + 35,0,0])
            #cylinder(h= screwHeight-2, d = 2.8, center = false);
            
            translate([CAM_PLATE_WIDTH - screwHeadDiam*1.5 - 35,0,0])
            #cylinder(h= screwHeight-2, d = 2.8, center = false);
            
            translate([CAM_PLATE_WIDTH - screwHeadDiam*1.5,0,0])
            #cylinder(h= screwHeight-2, d = 2.8, center = false);
        
        
            // countersink
            translate([screwHeadDiam*1.5,0,0])
            #cylinder(h= screwHeadHeight + tolerance, d = screwHeadDiam, center = false);
 
            translate([screwHeadDiam*1.5 + 35,0,0])
            #cylinder(h= screwHeadHeight + tolerance, d = screwHeadDiam, center = false);

            translate([CAM_PLATE_WIDTH - screwHeadDiam*1.5 -35,0,0])
            #cylinder(h= screwHeadHeight + tolerance, d = screwHeadDiam, center = false);

            translate([CAM_PLATE_WIDTH - screwHeadDiam*1.5,0,0])
            #cylinder(h= screwHeadHeight + tolerance, d = screwHeadDiam, center = false);
        }
    }         
        
}