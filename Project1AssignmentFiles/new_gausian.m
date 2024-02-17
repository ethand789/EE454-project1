function [G] = new_gausian(S)
%generate a gausian kernal from S
size = S;
[xx,yy]=meshgrid(-size:size,-size:size);
G=exp(-1/(2*S^2) * (xx.^2 + yy.^2));
end