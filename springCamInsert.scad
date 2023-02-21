include<params.scad>;
include<camplate_coords.scad>;
include<camPinHoles.scad>;

module springCamInsert(tol = 0, solid = false) {
    color("red")
        union() {
            translate([0,0,camHeight + camPlateHeight/2])
            cylinder(h = camPlateHeight + tol * 2, d = 14 + tol * 2, center = true); 
            translate([0,0,camHeight + camPlateHeight/4])
            cylinder(h = camPlateHeight/2 + tol*2, d = 16 + tol * 2, center = true); 
        }

}

// print 4

difference() {
    translate(wpPin)
    springCamInsert(solid = true);   
    translate(wpCamSpringRevCoord)
    linear_extrude(3) // check spring measurements
    import("SVG/WPSpringReverse.svg");
    translate([0,0,2])
    camPinHoles();
}