set(0, 'DefaultFigureWindowStyle','docked')
clc;
clear all;
close all;

%constants
nx = 100; %size of matrix in x
ny = 100; %size of matrix in y
iter = 10000; %number of iterations

%generate matrix
V = zeros(nx,ny);

%initial condition
%boundary on left
for i = 1:nx
    V(i,1) = 1;
    %add this section for second boundary condition requirement; comment
    %out for part 1
    V(i,nx) = 0; 
end

%repeat iterations 
for n = 1:iter
%internal voltages
for j = 2:ny-1
    for i = 2:nx-1
        left = V(i-1,j);
        top = V(i,j-1);
        right = V(i+1,j);
        bottom = V(i,j+1);

        V(i,j) = (left+right+top+bottom)/4;
    end
end

%boundary conditions
for i = 1:nx
    %for part 1 (comment out for part 2)
        %V(1,i) = V(2,i);
        %V(ny,i) = V(ny-1,i);
     %for part 2 (comment out for part 1)
        V(1,i) = 0;
        V(ny,i) = 0;
        V(1,1) = 1;
        V(1,ny) = 0;

end
end
%find electric field
[Ex,Ey] = gradient(V);

%generate surface plot
figure(1)
surf(V)

%generate vector field
figure(2)
quiver(Ex,Ey);
