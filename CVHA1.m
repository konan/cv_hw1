% Mike Schreiber, tum.mike@googlemail.com, Matrikelnummer: 3021909
% Philipp Tiefenbacher, philtief@googlemail.com, Matrikelnummer: 
% Clemens Horch, ch@tum.de, Matrikelnummer: 3013692
% Kinan Mahdi, kinan.mahdi@tum.de, Matrikelnummer: 3623887

%F�r die letztendlich Abgabe bitte das folgende auskommentieren, und korrekte
%Parameter Ihres Harris Detektors �bergeben
Image = imread('Bilder/haus.png');
IGray = rgb_to_gray(Image);
[Fx,Fy]=sobel_xy(IGray);
%tic
Merkmale = harris_detektor(IGray,7,0.04,1000,1);
%toc

%Merkmale = fail(IGray,7,0.06,500000000000,1);