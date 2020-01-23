function [polinomio] = diffdiv(t, y)
% DIFFDIV is a function which takes samples of a function "y" of a domain
% "t" and computes the polynomial that interpolates the function y(x). It
% is based on symbolic toolbox and on annonymous function. This function
% returns the function handles for the polynomial you want.

if ischar(t) || isscalar(t) || ischar(y) || isscalar(y)
    error('Watch out! You must give to vectors as inputs.');
end

% Declaring x as symbolic variable.
syms x;

% Initiating the polynomium.
P = y(1);

% Calculating the difference and updating y
y = diff(y)./diff(t);

% xa and xb are updates of t
xa = t(3:end);
xb = t(1:end-2);

% saving the first difference along the delta array
delta(1) = y(1);

% initiating the multiplication factor "parcela"
parcela = (x - t(1));

% updating the polynomial
P = P + parcela*delta(1);

% setting counter to 2
cont = 2;

% loop to the polynomial grow strong and happy
while cont < length(t)
    parcela = parcela*(x - t(cont));     % updating "parcela"
    y = diff(y)./(xa - xb);              % computing the difference
    xa = t(cont+2:end);                  % updating "xa"
    xb = t(1:end-cont-1);                % updating "xb"
    delta(cont) = y(1);                  % saving the first difference along 
                                         % the delta array
    P = P + parcela*delta(cont);         % updating the polynomial
    cont = cont + 1;                     % updating the counter
end

% converting symbolic variable "P" into a annonymous function "polinomio"
polinomio = matlabFunction(P);

% The following video is the reference uppon this function. They are the
% real heroes here. :)
% https://www.youtube.com/watch?v=OxJwjpZxEkc

return
