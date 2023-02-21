include<params.scad>;

camClearance = 2;

tCamCoords = [43.724 - xOffset, -90.844, camClearance];
tPivotCoords = [96.191 - xOffset, -90.75, camHeight + camPlateHeight/2 - 1];
nutCoords = [54.746 - xOffset, -72.624, camClearance];
tSlotCoords = [56.62 - xOffset, -70.401, camHeight - 1];
frontWallCoords = [46.178 - xOffset, -97, camClearance];
backWallCoords = [16.5 - xOffset, -63.999, camClearance];
bumperCoords = [94.5 - xOffset, -75.85, camClearance];

wpPin = [36.591 - xOffset, -70.584, 0]; 
holdPin = [38.041 - xOffset, -93.531, 0];

wpCamCoord = [25.392 - xOffset, -77.327, camClearance];
wpCamSpringCoord = [29.967 - xOffset, -72.587, camHeight - 3 + 0.05];
wpCamSpringRevCoord = [34.564 - xOffset, -72.581, camHeight - tolerance];

holdCamCoord = [19.867 - xOffset, -101.933, camClearance];
holdCamSpringCoord = [32.226 - xOffset, -98.494, camHeight - 3 + 0.05];
holdCamSpringRevCoord = [36.04 - xOffset, -95.531, camHeight - tolerance];

tPointerCoord = [43.724 - xOffset, -93.75, camHeight + camPlateHeight+ tolerance];
tensionMarksDist = -65;
tensionMarksStartAngle = 360-23.5;
tensionAngleInc = 1;