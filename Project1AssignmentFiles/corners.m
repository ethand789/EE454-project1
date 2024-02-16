function [] = corners(filename)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[file,S,N,D,M] = read_corner_parameters(filename);
i = grayscale(filename);
gaus = new_gausian(S);
i_smooth = imfilter(i,gaus);
imagesc(i_smooth);
colormap(gray);


end