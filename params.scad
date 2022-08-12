/*

Values in `camelCase` are user-variable (within reason); 
values like numNeedles and screwDiam, etc.,  can be modified to
accommodate user preference or hardware subsitution. 

Values in `ALL_CAPS` should be considered CONSTANTS and should
only be modified with *extreme caution* as they will affect the 
relationship between the needles and the cams, which could
prevent stitches from forming correctly.

I recommend only modifying these constants if you are also 
making changes to the cam design in the technical sketch.
*/

gauge = 6.5;
numNeedles = 5;

// ---
// Needle dimensions
// - Brother needles
BUTT_HEIGHT = 15;
NEEDLE_WIDTH = 1.25;
NEEDLE_LEG_HEIGHT = 1.85;

// ---
// Needle Bed Zones
BACK_COVER = 45;
OOW_TRACK = 8;
B_TRACK = 42; // will divvy up working tracks (B & C position) later
C_TRACK = 0;
WORKING_TRACK = B_TRACK + C_TRACK;
HOLD_TRACK = 8;
SPONGE_BAR = 12;
COMB = 29;
NEEDLE_EXTENSION = 34.5;

// ---
// Needle bed dimensions
NEEDLE_BED_DEPTH = BACK_COVER + OOW_TRACK + WORKING_TRACK + HOLD_TRACK + SPONGE_BAR + COMB;
needleBedHeight = BUTT_HEIGHT;
needleSlotHeight = NEEDLE_LEG_HEIGHT * 2;
needleSlotWidth = NEEDLE_WIDTH + 0.25; // add a small amount of clearance
combWidth = gauge*2/3; // width of cutouts for stitch formation; this gives room for the thickness of the yarn looped around the needle when it pulls back into the slot, but has to balance leaving enough material for the remaining "teeth" to not be too fragile

// ---
// Carriage dimensions
// refer to technical sketch
camHeight = BUTT_HEIGHT; // thickness of the tracks the needles ride along
camPlateHeight = 3; // plate behind the cams
CAM_PLATE_WIDTH = 88 * 2; 
CAM_PLATE_DEPTH = NEEDLE_BED_DEPTH - COMB;

// ---
// Hardware dimensions 
// (actual measurements, no tolerances)

// - pan head 6-32 machine screws
screwDiam = 3.45;
screwHeadDiam = 6.75; 
screwHeadHeight = 2.55;
nutWidth = 7.9;
nutHeight = 2.8;





