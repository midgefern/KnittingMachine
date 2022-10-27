include<params.scad>;

camClearance = 2;

tCamCoords = [40.724 - xOffset, -90.844, camClearance];
tPivotCoords = [93.191 - xOffset, -90.75, camHeight + camPlateHeight/2 - 1];
nutCoords = [51.746 - xOffset, -72.624, camClearance];
tSlotCoords = [53.62 - xOffset, -70.401, camHeight - 1];
frontWallCoords = [43.178 - xOffset, -97, camClearance];
backWallCoords = [16.5 - xOffset, -63.999, camClearance];
bumperCoords = [91.5 - xOffset, -75.85, camClearance];

wpPin = [33.591 - xOffset, -70.584, 0]; 
holdPin = [35.041 - xOffset, -93.531, 0];

wpCamCoord = [18.125 - xOffset, -77.327, camClearance];
wpCamSpringCoord = [26.967 - xOffset, -72.587, camHeight - 3 + 0.05];
wpCamSpringRevCoord = [31.564 - xOffset, -72.581, camHeight - tolerance];

holdCamCoord = [16.867 - xOffset, -101.933, camClearance];
holdCamSpringCoord = [29.226 - xOffset, -98.494, camHeight - 3 + 0.05];
holdCamSpringRevCoord = [33.04 - xOffset, -95.531, camHeight - tolerance];