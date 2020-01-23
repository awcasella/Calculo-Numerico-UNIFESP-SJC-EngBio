function [X, iter] = gaussJacobi(matriz)
% GAUSSJACOBI is a function which tries to calculate a solution X for the
% system specified in the input using the Gauss-Jacobi method using the
% line criteria to ensure convergence.
%
% INPUTS:
% - matriz: Matriz aumentada
%
% OUTPUT:
% - X: Vetor coluna [1xN] do resultado
% - iter: Numero de iteracoes

%% Input control
if isscalar(matriz) || ischar(matriz) || isvector(matriz) || iscell(matriz)
    error('Tá de brincadeira comigo! Tio, tem que passar uma matriz na função!!')
end

if size(matriz,1) < (size(matriz,2) - 1)
    error('Sistema não possui solução! Mas não fique triste, nem tudo são rosas...');
end

%% initial Settings

sistema = matriz(:,1:end-1);
resultado = (matriz(:, end));
sj = (-sistema.*(1 - eye(size(sistema)))) + diag(resultado);

% Verifying the convergence criteria according to the lines criteria
if ~convergence(sistema, 'line') && ~convergence(sistema, 'column')
    warning('System does not satisfy the line criteria, it might not converge...');
    warning('Changing the lines of the matrix');
    matriz = changeLines(matriz);
    
    clear sistema sj resultado
    sistema = matriz(:,1:end-1);
    resultado = (matriz(:, end));
    sj = ((-sistema).*(1 - eye(size(sistema)))) + diag(resultado);
end

if any(resultado == 0)
    warning('Temos pelo menos uma equação homegênea!');
end
%% Let's do the work
X = zeros(size(sistema,1), 1);  % Initial Values for x1, x2, ..., xn.
T = 10^-6;                      % Tolerance
iter = 0;
while sum(abs(sistema*X - resultado)) > T
    matX = repmat(X', [length(X), 1]);
    matX = matX.*(1 - eye(size(matX))) + eye(size(matX));
    X = sum(matX.*sj, 2)./diag(sistema);
    iter = iter + 1;
end

return

function nova = changeLines(matriz)
% sistema = matriz
% matriz = 

m = abs(matriz);
cont = 1;
nova = zeros(size(matriz));
linha = 1; 
while sum(sum(m)) > 0
    if cont > size(matriz,2)-1
        cont = 1;
        aux = sum(nova(:,1:end-1),2);
        [locs] = find(aux == 0);
        linha = locs(1);
    end
    vet = m(:,cont);
    locs = find(vet == max(vet));
    if length(locs) > 1
        cont = cont + 1;
        linha = linha + 1;
        continue;
    end
    nova(linha, :) = matriz(locs, :);
    m(locs, :) = 0;
    cont = cont + 1;
    linha = linha + 1;
end

return
