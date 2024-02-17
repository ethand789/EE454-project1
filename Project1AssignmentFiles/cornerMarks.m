function [] = cornerMarks(image,x_corners, y_corners)
imagesc(image);
colormap("gray");
hold on;

% Define the size of the square around each corner
square_size = 5; 

% Iterate through the detected corner locations
for i = 1:numel(x_corners)
    x = x_corners(i);
    y = y_corners(i);
    
    % Define the bounding box for the square around the corner
    xmin = max(1, x - square_size / 2);
    ymin = max(1, y - square_size / 2);
    width = square_size;
    height = square_size;
    
    % Draw a square around the corner
    rectangle('Position', [xmin, ymin, width, height], 'EdgeColor', 'r', 'LineWidth', 1);
end
hold off;
end