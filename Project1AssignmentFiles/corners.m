function [] = corners(filename)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[filename,S,N,D,M] = read_corner_parameters(paramfilename)
i= grayscale(filename);
gaus= new_gausian(S);
i_smooth=convolution(i,Gx,Gy);


end