function path, path2 = FindThePath(width, height, buoypos, boatLocation, circleCan)

filePath = fullfile(fileparts(which('PathPlanningExample')),'data','exampleMaps.mat');
load(filePath)
%buoypos = [6 15; 8 20; 18 22; 21 30; 28 18; 30 12; 33 6; 37 10; 38 16; 38 24; 36 24; 39 32; 37 40; 33 38; 30 35; 28 37]; %array of obstacles %Receive
%width = 40; %map x width in meters %Receive
%height = 40; %map y heigth in meters %Receive
map = robotics.BinaryOccupancyGrid(width,height,30);
setOccupancy(map, buoypos, 1);
robotRadius = 0.5;
mapInflated = copy(map);
inflate(mapInflated,0.3);
prm = robotics.PRM
prm.Map = mapInflated;
prm.NumNodes = 150;
prm.ConnectionDistance = 15;
prm2 = robotics.PRM
prm2.Map = mapInflated;
prm2.NumNodes = 150;
prm2.ConnectionDistance = 15;
%boatLocation = [2 3]; %xy of the boat %Receive
%circleCan = [2 4]; %xy to circle the can %Receive
exitLocation = boatLocation + [0 20]; %xy to exit the field %Receive

path = findpath(prm, boatLocation, circleCan);
path2 = findpath(prm2, circleCan, exitLocation);

% Display path
path
path2

end