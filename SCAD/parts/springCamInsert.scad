include<../modules/params.scad>;
include<../modules/camplate_coords.scad>;
include<../modules/camPinHoles.scad>;

module springCamInsert(tol = 0, solid = false) {
    color("red")
        union() {
            translate([0,0,camHeight + camPlateHeight/2])
            cylinder(h = camPlateHeight + tol * 2, d = 14 + tol * 2, center = true); 
            translate([0,0,camHeight + camPlateHeight/4])
            cylinder(h = camPlateHeight/2 + tol*2, d = 16 + tol * 2, center = true); 
        }

}

//// print 4, mirror half
//difference() {
//    translate(wpPin)
//    springCamInsert(solid = true);   
//    translate(wpCamSpringRevCoord)
//    linear_extrude(3) // check spring measurements
//    import("../../SVG/WPSpringReverse.svg");
//    translate([0,0,2])
//    camPinHoles();
//}


// Print in place: print 2, mirrored, WITHOUT SUPPORTS, spring cutout facing up
backPlateTest();

module backPlateTest() {
    color("magenta")
    difference() {
        translate([10,-CAM_PLATE_DEPTH+17,camHeight])
        cube([25, 45, camPlateHeight]);
//        cube(1);
        
        camPinHoles();
        
        translate(wpPin) {
            springCamInsert(tol = tolerance);
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
            springCamInsert(tol = tolerance); 
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
        import("../../SVG/WPSpringReverse.svg");
        translate([0,0,2])
        camPinHoles();
    }
    
    difference() {
        translate(holdPin)
        springCamInsert(solid = true);   
        translate(holdCamSpringRevCoord)
        linear_extrude(3) // check spring measurements
        import("../../SVG/HoldCamSpringReverse.svg");
        translate([0,0,2])
        camPinHoles();
    }
}