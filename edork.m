function [y, x] = edork(flinha, y0, varargin)
% EDORK is a function which estimates points of the solution for the ODE
% "flinha" given a initial condition "y0" and returns these points along
% with the x points used to estimate them.
% 
% INPUTS:
% - flinha: ODE we wanna solve.
% - y0: Initial condition of the ODE, (e.g.: y(0) = y0)
% - h: Parameter used to estimate the the solution.
% - n: Number of points used to calculate the solution.
% - x0: Initial value of x used in the ODE: (e.g.: y(x0) = y0)
% - order: Order of the Runge-Kutta.
% 
% OUTPUTS:
% - x: Some points where the solution of the ODE is calculated.
% - y: Some points of the Solution for the ODE.

% input control
if nargin < 2 || nargin > 6
    error(['Função ',mfilename, ' com número de inputs errados.'])
elseif nargin == 2
    h = 0.1;
    n = 100;
    x0 = 0;
    order = 2;
elseif nargin == 3
    h = varargin{1};
    n = 100;
    x0 = 0;
    order = 2;
elseif nargin == 4
    h = varargin{1};
    n = varargin{2};
    x0 = 0;
    order = 2;
elseif nargin == 5
    h = varargin{1};
    n = varargin{2};
    x0 = varargin{3};
    order = 2;
elseif nargin == 6
    h = varargin{1};
    n = varargin{2};
    x0 = varargin{3};
    order = varargin{4};
end

x(1) = x0;
y(1) = y0;

switch order
    case 2
        for n = 2:n
            x(n) = x(n-1) + h;
            s1 = flinha(x(n-1),y(n-1));
            s2 = flinha(x(n), y(n-1) + h*flinha(x(n-1),y(n-1)));
            y(n) = y(n-1) + (h/2)*(s1 + s2);
        end
    case 4
        for n = 2:n
            x(n) = x(n-1) + h;
            s1 = flinha(x(n-1), y(n-1));
            s2 = flinha(x(n-1) + h/2, y(n-1) + (h/2)*s1);
            s3 = flinha(x(n-1) + h/2, y(n-1) + (h/2)*s2);
            s4 = flinha(x(n-1) + h, y(n-1) + (h)*s3);
            y(n) = y(n-1) + (h/6)*(s1 + 2*s2 + 2*s3 + s4);
        end
end