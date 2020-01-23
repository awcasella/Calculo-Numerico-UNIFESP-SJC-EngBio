function [result, erro] = rootsNewton(f, g, x0, tolerance)
% INPUTS
% - f: Funcao anonima univariavel
% - g: Funcao anonima univariavel que eh a derivada de f
% - ini: inicio do dominio
% - fim: fim do dominio
% - tolerance: Tolerancia maxima de erro
%  
% OUTPUT:
% - result: Resultado
%

erro = 1;     % Erro atual entre valor calculado e valor real.
n = 0;        % Contador de iteracoes
while erro > tolerance
    derivada1 = (3*x0^2-2*x0);
    x1 = x0 -(x0^3 - x0^2 - 1)/derivada1;
    erro = abs(x1^3 - x1^2 - 1);
    if abs(x0 - x1) < tolerance
        break;
    end
    x0 = x1;
    n = n+1;
end

result = x1;

end