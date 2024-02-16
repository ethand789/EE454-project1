function [i] = grayscale(file)
%return a matrix contain the intensity value of coresponding pixels from
%file
I=imread(file);
i=rgb2gray(I);
end