function [x, y] = EDOeuler(flinha, y0, varargin)
% EDOEULER is a function which estimates points of the solution for the ODE
% "flinha" given a initial condition "y0" and returns these points along
% with the x points used to estimate them.
% 
% INPUTS:
% - flinha: ODE we wanna solve.
% - y0: Initial condition of the ODE, (e.g.: y(0) = y0)
% - h: Parameter used to estimate the the solution.
% - n: Number of points used to calculate the solution.
% - x0: Initial value of x used in the ODE: (e.g.: y(x0) = y0)
% 
% OUTPUTS:
% - x: Some points where the solution of the ODE is calculated.
% - y: Some points of the Solution for the ODE.

% input control
if nargin < 2 || nargin > 5
    error(['Atenção, verifique o número de inputs da função ', mfilename]);
elseif nargin == 2
    h = 0.1;
    n = 100;
    x0 = 0;
elseif nargin == 3
    h = varargin{1};
    n = 100;
    x0 = 0;
elseif nargin == 4
    h = varargin{1};
    n = varargin{2};
    x0 = 0;
elseif nargin == 5
    h = varargin{1};
    n = varargin{2};
    x0 = varargin{3};
end

% Let's do the work

% Creating "x" array
% x = x0:h:(n-1)*h;
x = linspace(x0,x0+n*h,n);
% % % % % % % % % % % % % % % % 
% % % Creating "y" array: % % %
% % % % % % % % % % % % % % % % 

% Adjusting the first position of y
y(1) = y0;
% Calculating the others positions
for p = 2:n
    y(p) = y(p-1) + h*flinha(x(p-1),y(p-1));
end

