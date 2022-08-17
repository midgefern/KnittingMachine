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
        translate([2.5, 0, 0])
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

yarnFeeder();