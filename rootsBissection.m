function [result] = rootsBissection(f, ini, fim, tolerance)
% INPUTS
% - f: Funcao anonima univariavel
% - ini: inicio do dominio
% - fim: fim do dominio
% - tolerance: Tolerancia maxima de erro
%  
% OUTPUT:
% - result: Resultado
%


cont = 0;                 % Contador de iterações
x = (fim+ini)/2;          % Valor intermediário
while abs(f1) > tolerance || abs(ini - fim) > tolerance
    fini = ini^3 - ini^2 - 1;      % f(ini)
    ffim = fim^3 - fim^2 - 1;      % f(fim)
    if fini*f1 < 0 
        fim = (fim+ini)/2;
    elseif ffim*f1 < 0 
        ini = (fim+ini)/2;
    else
        zero = (fim+ini)/2;
        break;
    end
    x = (fim+ini)/2;
    f1 = x^3 - x^2 - 1;
    cont = cont + 1;
end

end