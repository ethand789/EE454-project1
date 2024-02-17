function [] = corners()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[file,S,N,D,M] = read_corner_parameters("cornerparams.dat");


%step 2: converting image to a grayscale
I = grayscale(file);
% imagesc(I);
% colormap("gray");

% step 3: smoothing the image
gaus = new_gausian(S);
I_smooth = imfilter(I,gaus);
% imagesc(I_smooth);
% colormap("gray");

% step 4: computing gradients Ix and Iy
filtx = [-1 0 1;
         -2 0 2;
         -1 0 1]* 0.25;
Ix = conv2(I_smooth, filtx);
% imagesc(Ix);
% colormap("gray");

filty = [-1 -2 -1;
          0 0 0;
          1 2 1]* 0.25;
Iy = conv2(I_smooth, filty);
% imagesc(Iy);
% colormap("gray")

% step 5: Compute Harris corner “R” score values
%a
IxIx = Ix .* Ix;
IxIy = Ix .* Iy;
IyIy = Iy .* Iy;

%b
boxfilt = ones(N); % NxN kernel of all 1 s
Sx2 = conv2(IxIx, boxfilt);
Sxy = conv2(IxIy, boxfilt);
Sy2 = conv2(IyIy, boxfilt);

%c
R = (Sx2 .* Sy2) - (Sxy.^2) - 0.05*(Sx2 + Sy2).^2;
imagesc(R);
colormap("gray");

% step 6: "M" best corner features
max = ordfilt2(R, D, true(D));
bordermask = zeros(size(R));
bordermask(D+1:end-D, D+1:end-D) = 1;
corners = (R==max)  & bordermask;
[y_corners, x_corners] = find(corners);
[~, sorted_indices] = sort(R(corners), 'descend');
top_M_corners_x = x_corners(sorted_indices(1:M));
top_M_corners_y = y_corners(sorted_indices(1:M));

% step 7: 
fileID = fopen('corner_features.dat', 'w');

% Write the corner features to the file
fprintf(fileID, "100\n");
for i = 1:numel(top_M_corners_x)
    fprintf(fileID, '%f\t%d\t%d\n', R(top_M_corners_y(i), top_M_corners_x(i)), top_M_corners_x(i), top_M_corners_y(i));
end

% Close the file
fclose(fileID);
% cornerMarks(I, top_M_corners_x, top_M_corners_y);
end