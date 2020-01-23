function [Y] = polylms(t, y, varargin)
%POLYLMS Summary of this function goes here
%   Detailed explanation goes here

% input control
if length(t) ~= length(y)
    error(['Error using, ',mfilename,'! Vectors must be the same length.'])
end

if nargin < 3
    error('Watch out! Take a look at the number of inputs.');
elseif nargin == 3 
    tipo = varargin{1};
    N = 1;
elseif nargin == 4
    N = varargin{1};
    tipo = varargin{2};
end

% Let's do the work
if strcmpi(tipo,'poly')
    b = y(:);
    t = t(:);
    ordem = N:-1:0;
    
    A = repmat(t, [1, size(ordem,2)]).^repmat(ordem, [size(t,1), 1]);
    
    X = inv((A')*A)*(A')*b;
    Y = A*X;
elseif strcmpi(tipo,'ln')
    R = log(y(:));
    W = t(:);
    
    A = [log(W), ones(size(W))];
    
    X = log(inv((A')*A)*(A')*R);
%     X(2) = log(X(2));
    Y = A*X;
end

