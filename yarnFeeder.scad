include<params.scad>
include<stripperPlate.scad>;

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

translate([0,0,1])
//intersection() {
//    translate([CAM_PLATE_WIDTH/2,YARN_DEPOSIT_Y,0])
//    cylinder(h= 1, r = 3 + 6 + 1.5);
//    translate([CAM_PLATE_WIDTH/2,0,0])
//    yarnFeeder();
//}

color("red")
difference() {
    translate([CAM_PLATE_WIDTH/2,YARN_DEPOSIT_Y + 2,0])
    cube([CAM_PLATE_WIDTH/2, 21, 1], center = true);
    translate([CAM_PLATE_WIDTH/2,YARN_DEPOSIT_Y,0])
    cylinder(h= 6, r = 3 + 6 + 1.5, center = true);
    
}