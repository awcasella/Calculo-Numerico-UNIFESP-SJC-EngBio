function [varargout] = intSimpson(f, linf, lsup, L, varargin)
% INTSIMPSON computes the numerical intergation of the function "f" from
% the inferior limit "linf" until the superior limit "lsup" with "n"
% trapezoidal interpolated partitions. This function returns the estimated 
% area under the curve.
% 
% INPUTS:
% - f:
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

h = (lsup - linf)/(2*L);

x = linspace(linf, lsup, 2*L+1);
y = f(x);
pesos = ones(1, length(x));
pesos(2:2:end-1) = 4;
pesos(3:2:end-1) = 2;

area = (h/3)*sum(pesos.*y);

if plotar || nargout == 0
    figure;
    fplot(f, [linf, lsup], 'k','LineWidth',5);
    hold on;
    for n = 1:length(x)
        line([x(n), x(n)], [0,f(x(n))],'Color','red','LineWidth',2)
        if n > 1
            line([x(n-1), x(n)], [f(x(n-1)),f(x(n))],'Color','red','LineWidth',2)
        end
    end
    xlim([linf-0.1, lsup+0.1])
    ylim(sort([f(linf), f(lsup)]))
    xlabel('x')
    ylabel('f(x)')
    title(['Area = ', num2str(area),' com ', num2str(L),' divisões'])
end
if nargout == 1
    varargout{1} = area;
end

