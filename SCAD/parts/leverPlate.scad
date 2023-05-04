include<../modules/params.scad>;
include<../modules/camplate_coords.scad>;
include<../modules/utils.scad>;
include<../modules/camPinHoles.scad>;

//leverPlatePeg(); // debug at origin

module leverPlatePeg() {
    // hole is sized for a piece of bobby pin (flat side) measuring 1.5mm wide x 0.6mm thick
    
    bobbyWidth = 1.5;
    bobbyHeight = 0.6;
    difference() {
        union() {
            translate([0,0,1])
            cube([3,4,2], center = true);
            translate([-1.5,0,2])
            rotate([0,90,0])
            cylinder(3,2,2);
        }
        translate([0,0,2])
        cube([3.5, bobbyWidth + tolerance*2, bobbyHeight + tolerance*2], center = true);    
    }
}

module leverPlate(rot) {
//    color("orange")
    difference() {
        translate([0,0,camHeight + camPlateHeight + 1.5/2 + tolerance])    { 
            union() {
                cylinder(h = 1.5, d = 18, center = true); 
                rotate([0,0,rot]) {
                    translate([7,0,1.5/2])
                    color("lime")
                    leverPlatePeg();
                    translate([-7,0,1.5/2])
                    color("blue")
                    leverPlatePeg();
                } 
            } 
        }  // alignment "lock"
//        alignmentMark(tol = tolerance);
        rotate([0,0,200])
        translate([4,4,camHeight + camPlateHeight + 1 + tolerance])
        #cube([4,1,1]);
    }   
}

// print 2 each, mirrored

difference() {
    translate(wpPin)
    leverPlate(165);
    translate([0,0,2])
    camPinHoles();
}

difference() {
    translate(holdPin)
    leverPlate(200);
    translate([0,0,2])
    camPinHoles();
}