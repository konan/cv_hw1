% Mike Schreiber, tum.mike@googlemail.com, Matrikelnummer: 3021909
% Philipp Tiefenbacher, philtief@googlemail.com, Matrikelnummer: 
% Clemens Horch, ch@tum.de, Matrikelnummer: 3013692
% Kinan Mahdi, kinan.mahdi@tum.de, Matrikelnummer: 

%SOBEL_XY
function [Fx,Fy]=sobel_xy(Image)
% Sx=[1 0 -1;2 0 -2;1 0 -1];
% Sy=[1 2 1;0 0 0;-1 -2 -1];

Image=double(Image);

Fx=zeros(size(Image));
Fy=zeros(size(Image));

% darf nicht verwendet werden!
% Fx=conv2(Sx,Image);
% Fy=conv2(Sy,Image);

 
for r=2:size(Image,1)-1
    for c=2:size(Image,2)-1
        Fx(r,c) = Image(r-1,c-1) - Image(r-1,c+1) + 2*Image(r,c-1) - 2*Image(r,c+1) + Image(r+1,c-1) - Image(r+1,c+1);
        Fy(r,c) = Image(r-1,c-1) + 2*Image(r-1,c) + Image(r-1,c+1) - Image(r+1,c-1) - 2*Image(r+1,c) - Image(r+1,c+1);
    end
end



% Fx=uint8(Fx);
% Fy=uint8(Fy);
% figure
% imshow(Fx)
% figure
% imshow(Fy)
%
%     Fx=conv2(Sx,Image);
%     Fy=conv2(Sy,Image);
%     Fx=uint8(Fx);
%     Fy=uint8(Fy);
%     figure
%     imshow(Fx)
%     figure
%     imshow(Fy)
end