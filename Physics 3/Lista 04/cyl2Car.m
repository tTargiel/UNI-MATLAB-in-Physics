%
%   Book: MATLAB-Based Electromagnetics (Pearson Prentice Hall)
%   Author: Branislav M. Notaros
%   Instructor Resources
%   (c) 2011
%
%   This MATLAB code or any part of it may be used only for 
%   educational purposes associated with the book
%
%
%

% Transformation from Cylindrical to Cartesian coordinate system
function [X,Y,Z] = cyl2Car(r,phi,z)
X = r.*cos(phi);
Y = r.*sin(phi);
Z = z;

