function [x, iter] = rootsSecante(f, xn, xn_1, tolerance)
% INPUTS
% - f: Funcao anonima univariavel
% - xn: Valor atual de x
% - xn_1: Valor anterior de x
% - tolerance: Tolerancia maxima de erro
%  
% OUTPUT:
% - x: Resultado
% - iter: Numero de iteracoes

erro = 1;                 % Variável que guarda o valor do erro atual
iter = 0;                % Contador de iteraçoes

while erro > tolerance & y > 0
    coeficiente = (xn-xn_1)/(f(xn)-f(xn_1));
    x = xn -(f(xn)*coeficiente);
    erro = abs(f(x));
    if abs(xn - x) < tolerance
        break;
    end
    xn_1 = xn;
    xn = x;
    iter = iter+1;
end

end