function [gIm] = grayscale(file)
%return a matrix contain the intensity value of coresponding pixels from
%file
Im = imread(file);
Im = double(Im);
gIm =(Im(:,:,1) + Im(:,:,2) + Im(:,:,3))/3;
end