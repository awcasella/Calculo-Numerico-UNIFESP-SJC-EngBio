function [coeffs] = polyInterp(x,y,tipo)
% POLYINTERP is a function which calculates the polynomium that best fits
% the sample points givem by the inputs. The two first inputs represents
% the function y(x), and the third represents the kind of output you want.
% 
% If "tipo" is specified as "polyvet", then you'll have the output "coeffs"
% as a vector with the polynomial coefficients.
% 
% If "tipo" is specified as "fhandle", then you'll have the output "coeffs"
% as a function handle with the polynomial coefficients.

if isscalar(x) || ischar(x) || iscell(x) || isscalar(y) || ischar(y) || iscell(y)
    error('Both inputs MUST be arrays!');
end
if length(x) ~= length(y)
    error('Both inputs MUST have the same length!');
end
if nargin == 2
    tipo = 'polyvet';
end
%% Let's do the work
% set both inputs as column vectors
x = x(:);
y = y(:);

% specifing the order of the polynomial
N = length(x);
matX = repmat(x, [1, N]);
ordem = 0:N-1;

mat = matX.^ordem;

coeffs = fliplr((mat\y)');

if strcmp(tipo, 'fhandle')
    syms x
    y = x.^fliplr(ordem);
    y = sum(y.*coeffs);
    coeffs = matlabFunction(y);
end

return

