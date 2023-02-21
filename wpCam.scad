include<params.scad>;
include<camplate_coords.scad>;
include<utils.scad>;
include<camPinHoles.scad>;

module wpCam() {
    color("green")
    difference() {
        union() {
            translate(wpCamCoord)
            linear_extrude(camHeight - (camClearance + tolerance))
            import("SVG/WPCam.svg");
        }
        camPinHoles();
        translate(wpCamSpringCoord)
            #linear_extrude(3) // check spring measurements
            import("SVG/WPSpring.svg");        
    }    
}

wpCam(); // print 2, mirrored