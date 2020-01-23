%% EXAMPLE BISSECTION

% Encontre um zero da função f(x)=x^3-x^2-1. Conte o número de iterações usando precisão igual a 1e-6.

ini = 0;                  % Valor inicial
fim = 4;                  % Valor final

T = 10^-6;                % Tolerância

f = @(x) x^3 - x^2 - 1;        % Função f(x)

res = rootsBissection(f, ini, fim, T);

%% EXAMPLE NEWTON

% Encontre um zero da função f(x)=x^3-x^2-1. Conte o número de iterações usando precisão igual a 1e-6.

T = 10^-6;                % Tolerância
x0 = 2;
f = @(x) x^3 - x^2 - 1;        % Função f(x)
g = @(x) 3*x^2 - 2*x;

[result, erro] = rootsNewton(f, g, x0, T)

%% EXAMPLE SECANTE

% Encontre um zero da função f(x)=x^3-x^2-1 usando o método da secante.

T = 10^-6;                % Tolerância
xn = 2;                   % Valor atual de x
xn_1 = 3;                 % Valor anterior de x
f = @(x) x^3 - x^2 - 1;        % Função f(x)

[resultado, iter] = rootsSecante(f, xn, xn_1, T);

%% EXAMPLE NEWTON FOR NON LINEAR SYSTEMS

X = [1; -1];                                 % Initial Values
f1 = @(x1, x2) x1.^3 + 3*x2.^2 -21;           % Annonymous function for f1
f2 = @(x1, x2) x1.^2 + 2*x2 + 2;              % Annonymous function for f2
Jacob1 = @(x1, x2) [3*x1^2, 6*x2; 2*x1, 2];   % Annonimous function for jacobian Matrix
E = 10^-6;                                    % Tolerance

[X, iter] = nlsNewton(f1, f2, Jacob, X, tolerance)

%% LINEAR SYSTEMS: GAUSSIAN ELIMINATION METHOD

% Teste seu programa para resolver o seguinte sistema linear de equações Ax=b, onde

A1 = [1 -1 0 5;
	3 -2 1 -1;
	1 1 9 4;
	1 -7 2 3];
b1 = [18 8 47 32]';

m1 = [A1, b1];

disp(['Exercicio 1. Pelo método de Eliminação Gaussiana:'])
[X, iter] = gaussianElim2(m1);

%% LINEAR SYSTEMS: GAUSS JACOBI METHOD

% Teste seu programa para resolver o seguinte sistema linear de equações Ax=b, onde

A1 = [1 -1 0 5;
	3 -2 1 -1;
	1 1 9 4;
	1 -7 2 3];
b1 = [18 8 47 32]';

m1 = [A1, b1];

disp(['Exercicio 1. Pelo método de Gauss-Jacobi:'])
[X, iter]  = gaussJacobi(m1);

%% LINEAR SYSTEMS: GAUSSIAN SEIDEL METHOD

% Teste seu programa para resolver o seguinte sistema linear de equações Ax=b, onde

A1 = [1 -1 0 5;
	3 -2 1 -1;
	1 1 9 4;
	1 -7 2 3];
b1 = [18 8 47 32]';

m1 = [A1, b1];

disp(['Exercicio 1. Pelo método de Gauss-Seidel:'])
[X, iter]  = gaussSeidel(m1);


%% INTERPOLATION - LAGRANGE

% Assumindo que haja um caminho linear de x=2 a x=4.25,  qual é o valor de y quando x=4? Dica: Use um polinômio de lagrange 1a ordem. 

xi = [2, 4.25, 5.25, 7.81, 9.2, 10.6];
yi = [7.2, 7.1, 6, 5, 3.5, 5];

[x,y] = lagrangiano(xi(1:2), yi(1:2));

f = 4;
a = abs(x-f);
r = find(a == min(a));

figure;
plot(xi(1:2), yi(1:2), 'o', 'LineWidth', 3, 'DisplayName', 'Pontos Dados');
hold on;
plot(x, y, 'LineWidth', 3, 'DisplayName', 'Interpolação Lagrangiana');
plot(x(r), y(r),'k*', 'LineWidth', 3, 'DisplayName', 'f(4)')
grid minor
legend('show')


%% EXAMPLE NEWTON'S DIVIDED DIFFERENCE INTERPOLATION

% Assumindo que haja um caminho linear de x=2 a x=4.25,  qual é o valor de y quando x=4? 
% Dica: Use o metodo da diferenca dividida de Newton. 

x = [1, 2, 3, 4, 5, 6];
y = [14.5, 19.5, 30.5, 53.5, 94.5, 159.5];

f = diffdiv(x,y);

figure;
fplot(f, [x(1), x(end)]);
xlabel('x')
ylabel('y')

%% EXAMPLE LEAST MEAN SQUARES INTERPOLATION

% Interpolar os seguintes dados, com um interpolador de primeira e de segunda ordem e plotar os resultados

x = [1, 2, 3, 4, 5, 6, 7, 8];
y = [0.5, 0.6, 0.9, 0.8, 1.2, 1.5, 1.7, 2.0];

[Y1a] = polylms(x, y, 1, 'poly'); % Interpolador de ordem 1
[Y1b] = polylms(x, y, 2, 'poly'); % Interpolador de ordem 2

figure('Color', 'White');

subplot(1,2,1)
plot(x,Y1a, 'LineWidth', 3, 'DisplayName', 'Interpolação LMS');
hold on;
plot(x,y,'ro', 'MarkerFaceColor', 'r', 'LineWidth', 3, 'DisplayName', 'Pontos Dados');
title('Interpolação 1º grau');
legend('show');
xlim([0, 9]);
ylim([0.2, 2.2]);
xlabel('a)')

subplot(1,2,2)
plot(x,Y1b, 'LineWidth', 3, 'DisplayName', 'Interpolação LMS');
hold on;
plot(x,y,'ro', 'MarkerFaceColor', 'r', 'LineWidth', 3, 'DisplayName', 'Pontos Dados');
title('Interpolação 2º grau');
legend('show')
xlim([0, 9]);
ylim([0.2, 2.2]);
xlabel('b)')


%% EXAMPLE NUMERICAL INTEGRATION

fa = @(x) exp(x);
linfa = 1;
lsupa = 2;

fb = @(x) sqrt(x);
linfb = 1;
lsupb = 4;

fc = @(x) 1./sqrt(x);
linfc = 2;
lsupc = 14;

% number of divisions
L2 = 4;
L3 = 6;

% - SIMPSOM METHOD

area2(1,2) = intSimpson(fa, linfa, lsupa, L3);
area2(2,2) = intSimpson(fb, linfb, lsupb, L3);
area2(3,2) = intSimpson(fc, linfc, lsupc, L3);

% - TRAPEZOID METHOD

area2(1,1) = intTrapezio(fa, linfa, lsupa, L2);
area2(2,1) = intTrapezio(fb, linfb, lsupb, L2);
area2(3,1) = intTrapezio(fc, linfc, lsupc, L2);


%% EXAMPLE EDO

% - Euler
% Calcule y(0.4) usando o metodo de euler com h = 0.01 e o PVI : y' = y e y(0) = 1

ylinha1 = @(x, y) y;
y01 = 1;
h1 = 0.01;
n1 = 1/h1;

[x1, y1] = EDOeuler(ylinha1, y01, h1, n1);

figure;
plot(x1,y1, 'LineWidth', 3)

pontox = x1(find(abs(x1-0.4) == min(abs(x1-0.4))));
pontoy = y1(find(abs(x1-0.4) == min(abs(x1-0.4))));

%% - Runge-Kutta
% Um corpo com massa inicial de 200 kg está se movimentando sob a ação de uma força constante de 2000 N. Sabendo-se que esse corpo está
% perdendo 1 kg de sua massa por segundo e considerando que a resistência do ar é o dobro de sua velocidade e que o corpo está em repouso no instante t =
% 0, então a EDO que descreve a variação da sua velocidade é dada por:
% 
% v′(t) = (2000 − 2v(t)) / (200 − t) para t > 0
% v(0) = 0
% Determine a velocidade do corpo em v(t) no instante t = 5 segundos com intervalos de 0.5 segundos, usando Runge Kutta 2a e 4a ordem


ylinha1 = @(x, y) (2000 - 2*y)/(200 - x);
y01 = 0;
x01 = 0;
h1 = 0.5;
n1 = 20;

[y1a, x1a] = edork(ylinha1, y01, h1, n1, x01, 2);
[y1b, x1b] = edork(ylinha1, y01, h1, n1, x01, 4);

um_a = find(abs(x1a-5) == min(abs(x1a-5)), 1);
um_b = find(abs(x1b-5) == min(abs(x1b-5)), 1);

disp(['Pelo método de RK 2ª ordem: ', num2str(y1a(um_a))])
disp(['Pelo método de RK 4ª ordem: ', num2str(y1b(um_b))])