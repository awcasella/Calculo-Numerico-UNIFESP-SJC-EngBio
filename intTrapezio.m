function [varargout] = intTrapezio(f, linf, lsup, L, varargin)
% INTTRAPEZIO computes the numerical intergation of the function "f" from
% the inferior limit "linf" until the superior limit "lsup" with "n"
% trapezoidal partitions. This function returns the estimated area under
% the curve.

plotar = true;

if nargin < 3 || nargin > 5
    error(['Atenção! Verifique o número de inputs da função', mfilename]);
elseif nargin == 3
    L = 1;
    plotar = false;
elseif nargin == 4
    plotar = false;
elseif nargin == 5
    plotar = varargin{1};
end

% Calculate the height of the trapezoids.
h = (lsup - linf)/L;

% Defining the points in x-axis to be used.
pontos = linspace(linf, lsup, L+1);

% Calculating f(x) in the existing points in the x-axis.
fx = f(pontos);

% Calculating the weighing coefficients
pesos = [1,2*ones(1,length(pontos)-2),1];

% Calculate the area
area = (h/2)*sum(fx.*pesos);

if plotar || nargout == 0
    figure;
    fplot(f, [linf, lsup]);
    hold on;
    for n = 1:length(pontos)
        line([pontos(n), pontos(n)], [0,f(pontos(n))],'Color','red','LineWidth',2)
        if n > 1
            line([pontos(n-1), pontos(n)], [f(pontos(n-1)),f(pontos(n))],'Color','red','LineWidth',2)
        end
    end
    xlim([linf-0.1, lsup+0.1])
    ylim(sort([min(f(pontos)), max(f(pontos))]))
    xlabel('x')
    ylabel('f(x)')
    title(['Area = ', num2str(area),' com ', num2str(L),' divisões'])
end
if nargout == 1
    varargout{1} = area;
end
