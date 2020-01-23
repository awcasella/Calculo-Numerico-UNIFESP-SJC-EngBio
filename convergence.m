function bin = convergence(matriz, varargin)
% CONVERGENCE is a function which calculates the covergence of a linear
% system set in the first input according to the criteria specified in the
% second input, and returns a boolean output with the answer.

%% Input control
if nargin == 1
    warning('Usando critério de linha como padrão');
    tipo = 'line';
elseif nargin == 2
    if ~ischar(varargin{1})
        error('Tá de brincadeira comigo! Tio, tem que passar uma matriz e uma string na função!!');
    end
    tipo = varargin{1};
else
    error(['Função ', mfilename,' só aceita no máximo dois inputs!']);
end

if isscalar(matriz) || ischar(matriz) || isvector(matriz) || iscell(matriz)
    error('Tá de brincadeira comigo! Tio, tem que passar uma matriz e uma string na função!!')
end

% if size(matriz,1) < (size(matriz,2) - 1)
%     error('Sistema não possui solução! Mas não fique triste, nem tudo são rosas...');
% end

%% Let's do the work

switch tipo
    case 'line'
        bin = all(abs(diag(matriz)) < sum(abs(matriz.*(1 - eye(size(matriz)))),2));
    case 'column'
        bin = all(abs(diag(matriz))' < sum(abs(matriz.*(1 - eye(size(matriz))))));
    case 'sassenfeld'
        beta = ones(size(diag(matriz)));          % Initialization
        d = diag(matriz);                         % Getting the diagonal of the matrix
        matriz = matriz.*(1 - eye(size(matriz))); % Excluding the diagonal
        beta(1) = sum(matriz(1, :))/d(1);         % First beta value
        for n = 2:length(d)                       % All the other beta values
            soma = sum(matriz(n, :).*(beta'));
            beta(n) = soma/d(n);
        end
        bin = all(beta < 1); % True if it converges, False if it does not.
    case 'aula' % Criteria seen in the class
        matriz = matriz./repmat(diag(matriz), [1, size(matriz, 2)]);
        matriz = matriz.*(1 - eye(size(matriz))); % Excluding the diagonal
        X = ones(size(diag(matriz)));             % Initialization
        X(1) = sum(matriz(1, :));                 % First beta value
        for n = 2:length(X)                       % All the other beta values
            X(n) = sum(matriz(n, :).*(X'));
        end
        bin = max(X) < 1;
    otherwise
        error(['Watch out! Specify a valid criteria for the function ', mfilename, '!']);
end

return

