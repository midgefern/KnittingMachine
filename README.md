# A 3D-printable flatbed knitting machine

## How to use this code

In this project, you will find several types of assets:

1. The **SCAD** directory contains the modelling code, which opens in OpenSCAD; it is divided into:

- **parts** files, each of which will render and export a single component (or in some cases, pairs of components which are meant to be printed together);
- **assemblies**, which can be used to visualize how the components fit together; and
- **modules**, utility code and parameters which are shared across multiple parts and assemblies.

To customize variables like the number of needles and the spacing between them, or adjust tolerances, you can edit **modules/params.scad**. However, please note that many of the parameters in this file (e.g. needle measurements) and in **modules/camplate_coords** are carefully calibrated to match particular needles to a particular carriage design; these are  marked as constants in SCREAMING_SNAKE_CASE, and should generally not be changed without also adjusting the cam design and associated SVG assets to compensate.

2. The **SVG** directory contains 2D shape assets exported from the technical drawings, which are extruded into 3D parts such as cams, etc.

3. The **Technical Sketches** directory contains design drawings which can be opened in Adobe Illustrator; these can be used to verify/modify the cam layout, obtain precise measurements, and export SVG assets.

4. In the **STL** folder you can find pre-compiled models of parts, ready to be sliced for 3D printing.

## How to build the machine

### Printing and supplies

A table of printable parts along with suggested slicer settings can be found below, based on my own tests slicing in Cura and printing with PLA/PLA Pro filament on an Ender 3 V2; note that times and filament weights given are estimates and your experience may vary depending on your printer and slicer. A list of other required hardware, supplies and tools is also provided below.

The needlebed in the provided STL files holds 25 needles at a standard 4.5mm gauge; if you want a bed with a different number of spacing of needles, these parameters can be changed in **SCAD/modules/params.scad**. If desired, multiple needlebeds can be connected in series to create a wider work area. 

**Please note** that knitting machine needles are not all interchangeable, and this machine has been designed to work with a specific model: when sourcing your needles please look for those intended to work with Brother models KR830 / KR838 / KR850.

### Assembling the needlebeds

You will need:

- left and right carriage rests
- 2x carriage rest clamp (optional)
- 2x clamp head (optional)
- one or more needlebeds
- one back cover per needlebed
- one sponge bar per needlebed
- latch-hook knitting machine needles (KR830 / KR838 / KR850), one per  needlebed slot for each bed
- self-adhesive foam weatherstrip (or similar), 1/4" - 3/8" wide, enough to span the width of all connected needlebeds
- screws: 
    * #4-40 x 1/2", 4 per needlebed
    * #4-40 x 3/4", 2 per needlebed
    * #6-32 x 1/2", 8
- eyebolt and nut (size TBC) (optional)
- screwdriver
- scissors

For each needlebed:

1. Insert a needle into each slot with the hook end towards the angled edge of the bed; ensure needles are sliding smoothly (sand any imperfections if necessary).
2. Screw back cover to rear of needlebed with #4-40 x 1/2" screws (in any orientation; it's symmetrical). Ensure screw heads are sunk in the well below the surface of the cover but be careful not to overtighten.
3. Cut and apply foam strip to fit (the flat underside of) sponge bar, leaving gaps for the screws and vertical spacer.
4. Screw sponge bar into place with #4-40 x 3/4" screws, taking care that the foam strip doesn't get caught between the spacer and the cover; once in place, the sponge bar should be flush with the surface of the rest of the needlebed. Once again, ensure the screw heads do not protrude, but avoid overtightening.

For each carriage rest:

*Clamps are optional but recommended.*
1. Screw the clamp to the bottom of the carriage rest with #6-32 x 1/2" screws, ensuring that the surfaces are flush.
2. Insert the eyebolt's nut into the hexagonal cutout in the clamp, and the bolt from the opposite side; once the bolt has cleared the nut, insert the tip of the bolt into the clamp head, and (when all beds are connected) tighten to the table. (You may choose to glue or otherwise permanently affix the nut and the clamp head; I keep mine separate since they are a tight fit around my table.)

To connect the carriage rests and beds:
1. Slide the slots on the left-hand edge of the unit over the pegs on the right-hand edge of its neighbour. 
2. Repeat until the desired number of beds have been connected and add the right carriage rest.

### Assembling the MkIII carriage

[A detailed video walkthrough](https://youtu.be/Lf7w6VygMvw) is also available.

You will need:

- back plate
- 2x tension cams
- 2x hold cams
- 2x WP (working position) cams
- 2x tension pointers
- 4x lever plates (2 WP, 2 hold)
- 4x spring cam inserts
- 2x lever locks
- yarn carrier
- yarn feeder 
- stripper plate (2pc.)
- screws:
    * 4x #6-32 x 1/2"
    * 6x #4-40 x 1/2"
    * 6x #4-40 x 1/4"
    * 2x #4-40 nuts
    * 2x #4 washers
- 4x 180deg torsion springs and pins, removed from claw-style hair clips (2x LW, 2x RW)
- 4x bobby pins
- pliable jewelry wire, approx. 6-7" (15-18cm)
- gel superglue or quick set epoxy
- tape (clear or masking)
- sandpaper
- screwdriver
- side cutters/nippers
- pliers
- safety goggles
- protection for work surface

1. Remove 3D printing supports, sanding any resulting rough surfaces if needed. 
2. "Dry fit" assembly, checking that adjacent parts and hardware (springs, pins, nuts) combine correctly before adding glue or screws. Trim spring legs if needed, using appropriate eye protection.
3. With the flat side of the back plate down and the hold position closest to you, align the spring cam inserts in their cutouts so that the registration notches on the back plate form a straight line with the leg of the spring cutout. For all inserts, the legs will point towards the centre of the plate; hold position inserts (closest to you) will have their legs closer to you/below the hole, and working position inserts will have their legs further from you/on top of the hole. Tape each insert to the plate temporarily to maintain this alignment, then flip the plate over so the flat side is up.
4. Align the lever plates so that their registration marks match the marks of the back of the plate and the pin hole matches that of the spring cam insert. The lever plate for the hold position has its registration notch closest to one of its "bumps", while the working position plate has a registration notch further away from the "bump". Affix the lever plates to the underside of the inserts with a *small* amount of glue applied to the insert, using the pin to keep the pieces aligned through their depth. Caution: too much glue may squish out and leak into the seams or pin holes, which could interfere with moving parts; tiny dots will do! Allow the glue to cure according to package recommendations before further manipulation.
5. Secure the springs to the hold cams and working position cams by gluing *only the leg* into the slot. Avoid getting glue into the pin hole or the round part of the spring well, as this may interfere with movement of parts. Allow glue to cure according to package directions before further manipulation.
6. With a small amount of glue, affix a #4-40 nut into the hexagonal cutout in each tension cam, being careful to avoid glue contact with the nut's threads. Allow the glue to set according to package directions before further use.
7. For each cam position: insert a pin through the lever plate and insert, so that the head of the pin is against the lever plate side. With the flat/back side of the back plate down, fit the cam onto the pin so that spring slots into the cutout in the insert. The point of the cam should be facing towards the edge of the plate. Holding the head of the pin snug against the lever plate from underneath, place a drop of glue into the cam's pin hole to secure the pin. Glue *just the leg* of the spring into place with a small drop of glue, taking care to avoid contact with other parts. Allow glue to cure according to package directions.
8. For each tension cam: with the flat side of the back plate down, insert the tension cam's pivot point into the hole; the nut side of the cam will be against the plate in the region of the arc-shaped cutout. Holding the cam in place, flip the assembly over (flat side facing you) and screw the round end of a tension pointer to the underside of the cam pivot, with a #4-40 x 1/4" screw. Insert a washer between the pointer and the plate, and connect the pointer, washer, plate and tension cam with a #4-40 x 1/2" screw.
9. For each lever plate: trim the "wiggly" legs of a bobby pin to fit across the lever plate (use eye protection), leaving the flat sides long. Sand or treat sharp edges of the cuts if needed. With registration notches aligned, insert the cut leg of the bobby pin through the slot in the centremost peg, across the centre of the lever plate, and through the edgemost peg; the long, flat leg of the bobby pin should sit over both pegs and extend beyond the edge of the plate. Secure the short leg of the bobby pin in the pegs with glue, if desired.
10. For each lever lock: lightly sand the contact surfaces of the lever lock and the edge of the plate to help adhesion. With the lever plate/bobby pins assembly facing up, the lever lock will fit between the bottom edge of the hold track and the point of the back wall, with the bottom edge flush with the edge of the camplate. The small "u" cutout should be oriented towards the hold position, and the wider "u" cutout should be oriented towards the working position. Slip the long legs of the bobby pins into the cutouts and glue the lever lock to the side edge of the back plate, holding the parts firmly in place until the glue sets. Allow to cure according to package directions before further use.
11. With the angled face of the yarn carrier cover facing down and the cone-shaped side of the yarn feeder facing up, screw the two parts together using #4-40 x 1/4" screws. Flip the yarn carrier assembly over and align the stripper plate pieces under the opposite edge, so that the points of the stripper plate form a small gap under the yarn feeder hole; screw into place with #4-40 x 1/2" screws. 
12. With the lever side of the camplate facing up, align the yarn carrier assembly with the screw holes at the front edge of the camplate (closest to the hold position). Screw into place with #6-32 screws.
13. Create a yarn guide with the jewelry wire by coiling around a small cylinder 3 times; form one end of the coil into a small loop (or otherwise finish the cut edge according to your preference). Form the other end into a flat loop or coil, and wrap around a #6-32 screw; secure the yarn guide with the screw in the middle hole at the back of the carriage, and bend into your preferred position to guide the yarn towards the yarn feeder.

## Basic use

A full tutorial on machine knitting is beyond the scope of this guide, but there are many approachable lessons elsewhere online; for the most relevant information to this style of machine, I recommend looking for techniques demonstrated on single-bed machines such as the LK150 or Bond. 

Instead, this overview will focus on the peculiarities of this machine and the essentials you'll need to get set up.

### Yarn

This machine uses needles which can comfortably handle a range of yarn from ultrafine lace or fingering weights (on the 4.5mm gauge bed) to some lighter worsted weights (on a 6.5mm gauge bed), but in my experience the heavier side of that range has behaved unpredictably. Beginners may reduce frustration by looking for smooth, consistent wool or quality acrylic yarns in fingering, sport, or DK weight for their first projects; avoid bulky or variable textured yarns, slippery fibers, or very inelastic cotton yarns, until you are comfortable with the machine. Yarns must be wound into a ball/cake which feeds freely from the centre.

### Weight

Weight must be applied to the knitting as it is created in order to maintain the proper tension and help pull the old stitches over the new ones. I recommend the use of a weighted hem or cast-on rag with a built-in pocket or channel to hold a metal rod or bar, but you can also use a cast-on rag with claw weights if you already have them. For my weighted hem, I use a flat (rather than tubular) version of the cast-on bonnet with split rings in this Dean & Bean tutorial, but there are many other options to get started: the key features are pre-existing loops to hang onto your needles, and something to attach your weight to so that it is distributed evenly across the width of your project. Experiment with different amounts of weight (you might need more than you expect!) and keep in mind that different projects might require different amounts of weight.

Problems that might be due to insufficient weight include: dropped stitches, unintentional tucked stitches, split stitches.

### Casting on

Push the desired number of needles into a working position. Hang a loop from your cast-on rag/hem onto every or at least every other needle, then add your weights. Before knitting with your project yarn, establish several rows of "waste" yarn–this can be reused many times, so it doesn't really need to go to waste! 

Set the carriage onto the carriage rest, aligning the needlebed's rails with the corresponding channels in the underside of the carriage; the stripper plate will hook under the angled front edge of the needledbed. Set the yarn into the carriage by feeding it through the wire coil, over the top of the carriage, and into the slot in the yarn feeder's funnel. Pass the yarn through the gap in the stripper plate and lay it over the stripper plate, away from the direction of knitting. Pull some slack in the yarn out of the ball so that it will feed freely when the carriage is moved.

Ensure the latches of all the working needles are open so that they can receive yarn as the carriage passes over them. Using gentle downward pressure, slide the carriage towards the needles, starting slowly to watch that the first needle catches the yarn; you may need to hold the loose end of the yarn to add a little bit of tension as these first few stitches form. Continue sliding the carriage across the needlebed until all working needles have been cleared. 

Check that new stitches have been formed successfully through every loop and that every needle now holds yarn. If not, you can correct the missed stitches manually (for a few misses) or remove the knitting and rehang the cast-on rag and start again again (for a lot). If stitches are consistently not forming correctly, double-check that: 
- all latches are open
- enough weight has been added
- yarn is feeding through the wire coil guide and into the feeder.

Before starting the next row, you may need to ajust the position of the needle butts; if they are too far back to feed smoothly into the working position cam track, run a finger along the row of needle butts to push them slightly forward in the bed. Pull more yarn out of the ball so that it will feed freely. Gently tension the yarn with one hand as you slide the carriage back towards the needlebed; as the yarn feeder approaches the first needle, remove any excessive slack from the yarn feeder so that the loop formed around the first needle is not too loose, then drop the yarn and let it feed freely once the first couple of stitches have formed.

Once you have established a few rows of waste yarn and stitches are consistently knitting correctly, you can switch to project yarn and cast on using whatever technique is called for in your pattern. For ease of removal later, I recommend separating the waste yarn from the project yarn with a single row of "ravel cord": a thin, smooth, contrasting colour yarn which will easily slide out when pulled, allowing the adjoining pieces to pull apart without cutting the waste yarn.

### Carriage settings and needle positions

Tension can be adjusted by loosening the screws at the sharp end of the tension pointers and pivoting the tension cams to a new position; re-tighten the screws to set the new tension. Pointers set more towards the top of the carriage will loosen the tension, while settings towards the side of the carriage will tighten the tension. The right-hand pointer controls the tension for carriage passes from right to left, and the left-hand pointer controls tension for passes from left to right.

Needles with butts aligned all the way to the back of the bed are **out of work**; these needles will not be actuated by any cams in any setting, will not form stitches, and should not hold any yarn. Latches should be closed before placing needles in this position.

The "home" position for needles exiting the carriage is the approximately the standard **working position** (as mentioned above, due to a "bug" in the cam design you may sometimes need to adjust these needles manually to the true working position). When the working position levers are set to their top position, needles in this position will knit. When these levers are set to their bottom position, these needles will be passed over without knitting or collecting new yarn (aka "slipped"), which is useful for creating stranded colourwork or jacquard patterns in two passes (i.e. contrast colour slips on the first pass and knits on the second). In this position, latches can be open or closed, because the action of pushing the needle through the existing loop will push the latches open before catching a new loop of yarn in the hook.

Needles with their butts aligned all the way to the front of their slots are in **hold position**. When the hold cam levers are set to the top position, these needles will not knit but yarn will be deposited over them, which is useful for tuck stitches and short rows. When this lever is set to its bottom position, needles in the hold position will knit. Because the stitches are behind the latches in this position, it is particularly important to ensure latches are open before returning the needles to work, or the hook will not be able to catch a new loop of yarn before the old loop is dropped.

Between the working position and the hold position is the **forward working position**, at the point where latches have just pushed forward past the old loop on the needle. This position *always knits*. It is once again important to ensure latches are open before returning the needles to work, or the hook will not be able to catch a new loop of yarn before the old loop is dropped.

### Troubleshooting

As mentioned above, common causes of issues include insufficient weight, improperly closed latches, or yarn not having been properly fed into the yarn guide and yarn feeder; these can cause dropped stitches, skipped/tucked stitches, or split stitches.

Other issues may include:

#### Tension problems

Generally poor tension that can't be fixed within the available range of the tension cams or by changing to a different gauge of needlebed could be a problem if the yarn you have chosen is inappropriate, for example, too thick or textured for one stitch to pull smoothly through another. Previously good tension can be suddenly affected if the yarn is not flowing freely out of the ball, if it catches on another object, if it gets knotted, or if it gets wrapped around the yarn coil; to correct these problems, pause and check for impediments before re-knitting any problem stitches if necessary.

#### Carriage jams

Sometimes the carriage may jam due to one of its edges catching on part of the needlebed, usually where a connection between two beds is not completely flush; in this case, the jam can usually be cleared by gently lifting the leading edge of the carriage 1-2mm and gently sliding forward. 

In some cases the cause of a jam is a needle which has hit an unexpected obstacle due to being out of position: for example, if a needle which should be out of work has slipped forward slightly. Needles can also jam due to tension problems, knots in the yarn, or malformed stitches, which can all prevent needles from actuating through their full range.

Sometimes these needle jams may occur while the needle is inside the carriage, in which case it is difficult to see the source of the problem; in these cases, I recommend removing the carriage: lift the carriage off the rails, tilt forward to clear the needles, and set aside. Unwork any stitches from the unsuccessful pass and reset to start the row again.

Regardless of the cause of the jam, it is important to stop moving the carriage–do not try to push through sudden, unexpected resistance. Sometimes a needle jam can be cleared by *gently* wiggling the carriage back and forth by a centimetre or two, but attempting to force it may damage your machine.

### 3D printed parts and settings

|Part              |#  |Mirroring  |Orientation              |Layer height          |Supports?                  |Infill|Z-seam alignment|Initial layer horizontal expansion                                                       |Print time (est.)|Weight (est., g)|Metres (est.)|
|------------------|---|-----------|-------------------------|----------------------|---------------------------|------|----------------|-----------------------------------------------------------------------------------------|-----------------|----------------|-------------|
|backPlate         |1  |None       |Flat top aligned to plate|.2mm / adaptive layers|None                       |20%   |Sharpest corner |-0.1mm                                                                                   |12h33            |119             |39.93        |
|springCamInsert   |4  |Mirror half|Spring well down         |.2mm                  |Touching buildplate        |100%  |Sharpest corner |-0.2mm                                                                                   |34min            |3               |1.12         |
|holdCam *         |2  |Mirror half|Spring well up           |.2mm                  |n/a                        |100%  |Sharpest corner |-0.1mm (did get a teeny bit of EF on this print so maybe worth increasing neg. expansion)|3h31             |21              |7.07         |
|wpCam *           |2  |Mirror half|Spring well up           |.2mm                  |n/a                        |100%  |Sharpest corner |see holdCam                                                                              |see holdCam      |see holdCam     |see holdCam  |
|tCam *            |2  |Mirror half|Hex nut up               |.2mm                  |Normal, touching buildplate|100%  |Sharpest corner |see holdCam                                                                              |see holdCam      |see holdCam     |see holdCam  |
|Lever plates      |2  |Mirror half|Flat side down           |.2mm / adaptive layers|None                       |100%  |Sharpest corner |-0.1mm                                                                                   |20min            |2               |0.7          |
|tPointer          |2  |None       |n/a                      |.2mm                  |None                       |100%  |Sharpest corner |-0.2mm                                                                                   |36min            |4               |1.2          |
|leverLock         |2  |None       |n/a                      |                      |                           |      |                |                                                                                         |                 |                |             |
|stripperPlate     |1  |None       |Lay flat                 |.2mm / adaptive layers|None                       |100%  |Sharpest corner |-0.1mm                                                                                   |5h42             |35              |11.84        |
|Yarn feeder       |1  |n/a        |Lay flat                 |.12mm / adaptive      |None                       |20%   |Default         |-0.1mm                                                                                   |4h02             |25              |8.49         |
|Yarn carrier cover|1  |n/a        |Lay flat                 |.2mm                  |Below overhang             |20%   |Default         |-0.1mm                                                                                   |6h57             |                |             |
|Needlebed         |1  |n/a        |Lay flat                 |.2mm                  |None                       |15%   |Sharpest corner |-0.1mm                                                                                   |14h12            |111             |37.35        |
|Back cover **     |1  |n/a        |Lay flat                 |.2mm                  |None                       |20%   |Sharpest corner |-0.1mm                                                                                   |2h53             |23              |7.57         |
|Sponge cover **   |1  |n/a        |Lay flat                 |.2mm                  |None                       |20%   |Sharpest corner |-0.1mm                                                                                   |see backCover    |see backCover   |see backCover|
|Carriage rest     |2  |TBC        |TBC                      |TBC                   |TBC                        |TBC   |TBC             |TBC                                                                                      |TBC              |TBC             |TBC          |
|Clamps            |2  |TBC        |TBC                      |TBC                   |TBC                        |TBC   |TBC             |TBC                                                                                      |TBC              |TBC             |TBC          |
|Clamp heads       |2  |TBC        |TBC                      |TBC                   |TBC                        |TBC   |TBC             |TBC                                                                                      |TBC              |TBC             |TBC          |
