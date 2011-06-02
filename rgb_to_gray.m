% Mike Schreiber, tum.mike@googlemail.com, Matrikelnummer: 3021909
% Philipp Tiefenbacher, philtief@googlemail.com, Matrikelnummer: 
% Clemens Horch, ch@tum.de, Matrikelnummer:
% Kinan Mahdi, kinan.mahdi@tum.de, Matrikelnummer: 

%RGB_TO_GRAY
function Gray_image = rgb_to_gray(Image)
    if size(Image,3) == 1
        Gray_image = uint8(Image);
        fprintf('Input is already a gray image!\n')
    else
        Gray_image(:,:,1) = Image(:,:,1) .* 0.299 + Image(:,:,2) .* 0.587 + Image(:,:,3) .* 0.114;
        Gray_image = uint8(Gray_image);
    end
end