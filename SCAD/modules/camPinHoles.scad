include<../modules/params.scad>;
include<../modules/camplate_coords.scad>;
include<../modules/utils.scad>;

module camPinHoles(camPinDiam = 2.0) {
    translate(wpPin)
    pinHole(camPinDiam);   
    translate(flip(wpPin))
    mirror([1,0,0])
    pinHole(camPinDiam);
    translate(holdPin)
    pinHole(camPinDiam);   
    translate(flip(holdPin))
    mirror([1,0,0])
    pinHole(camPinDiam);
}

module pinHole(camPinDiam) {
        cylinder((camHeight + camPlateHeight + 1) * 2, d = camPinDiam, center = true);
}