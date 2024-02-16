function [] = corners(filename)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[file,S,N,D,M] = read_corner_parameters(filename)
i= grayscale(file);
gaus= new_gausian(S);
i_smooth=imfilter(i,gaus);
imshow(i);


end