function [] = corners()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[file,S,N,D,M] = read_corner_parameters("cornerparams.dat");


%step 2: converting image to a grayscale
I = grayscale(file);

% step 3: smoothing the image
gaus = new_gausian(S);
I_smooth = conv2(I,gaus);
imagesc(I_smooth);
colormap(gray);

% step 4: computing gradients Ix and Iy
filtx = [1/2, 0, -1/2];
Ix = conv2(I_smooth, filtx);
imagesc(Ix);

filty = filtx';
Iy = conv2(I_smooth, filty);
imagesc(Iy);
end