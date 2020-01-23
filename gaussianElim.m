function [X, iter] = gaussianElim2(aumentada)
%GAUSSIANELIM Summary of this function goes here
%   Detailed explanation goes here
%
% INPUTS:
% - aumentada: Matriz aumentada
%
% OUTPUT:
% - X: Vetor coluna [1xN] do resultado
% - iter: Numero de iteracoes

iter = 0;
[linha, coluna] = size(aumentada);
for n = 1:(linha-1)
    cont = 1;
    while aumentada(n,n) == 0
        aux = aumentada(n,:);
        aumentada(n,:) = aumentada((n+cont),:);
        aumentada((n+cont),:) = aux;
        cont = cont +1;
        iter = iter + 1;
    end
    for i = (n+1):linha
        coeficiente2 = aumentada(i,n)/aumentada(n,n);
        aumentada(i,:)= aumentada(i,:)-(coeficiente2*aumentada(n,:));
        iter = iter + 1;
    end
    if aumentada(n,n) ~= 0
        aumentada(n,:) = aumentada(n,:)*(1/aumentada(n,n));
    end
    iter = iter + 1;
end

mat_T2 = aumentada(:,1:(coluna-1));
coluna2 = aumentada(:,coluna);

X = zeros(1,size(mat_T2,1));
for k = length(X):-1:1
    if k == X(end)
        X(k) = coluna2(end);
    else
        X(k) = coluna2(k) - sum(mat_T2(k,:).*X);
    end
    iter = iter + 1;
end

X = X';

return

