include<params.scad>;
include<camplate_coords.scad>;
include<utils.scad>;
include<camPinHoles.scad>;

module holdCam() {
    color("blue")
    difference() {
        union() {
            translate(holdCamCoord)
            linear_extrude(camHeight - (camClearance + tolerance))
            import("SVG/HoldCam.svg");
        }
        camPinHoles();
        translate(holdCamSpringCoord)
            #linear_extrude(3) // check spring measurements
            import("SVG/HoldCamSpring.svg");        
    }   
}

holdCam(); // print 2, mirrored