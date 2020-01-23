function [X, iter] = nlsNewton(f1, f2, Jacob, X, tolerance)
% Newton's Method - Nonlinear Systems
% INPUTS
% - f1: Funcao anonima univariavel
% - f2: Funcao anonima univariavel
% - Jacob: Matriz jacobiana das funções f1 e f2
% - X: Valores iniciais
% - tolerance: Tolerancia maxima de erro
%  
% OUTPUT:
% - X: Resultado
% - iter: Numero de iteracoes



F = zeros(2,1);                               % Setting The F Vector

iter = 0;                                     % Set counter to zero.

while max(abs([f1(X(1), X(2)), f2(X(1), X(2))])) > tolerance
    F(1) = f1(X(1), X(2));
    F(2) = f2(X(1), X(2));
    
    J1 = Jacob(X(1), X(2));
    
    delta1 = J1\-F;
    
    if max(abs(delta1)) < tolerance
        break;
    end
    iter = iter + 1;
    X = X + delta1;
end

end