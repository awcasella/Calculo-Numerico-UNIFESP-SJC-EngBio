%TC5 - parte II

%Paramaetros

x = [1 2 3 4 5 6 7 8];
y = [0.5 0.6 0.9 0.8 1.2 1.5 1.7 2.0];

%Exercicio 1
% (a) Aproximacao por uma reta y = a + bx - a1

grau1a = 1;
n1a = grau1a + 1;
A1a = zeros(n1a);
b1a = zeros(n1a,1);

for i = (1:n1a)
   for j = (1:n1a)
      A1a(i,j) = sum(x.^(i+j-2));
   end
   b1a(i) = sum((x.^(i-1)).*y);
end

a1a = A1a\b1a;

% (b) Aproximacao por uma parabola y = a + bx + cx^2

grau1b = 2;
n1b = grau1b + 1;
A1b = zeros(n1b);
b1b = zeros(n1b,1);

for i = (1:n1b)
   for j = (1:n1b)
      A1b(i,j) = sum(x.^(i+j-2));
   end
   b1b(i) = sum((x.^(i-1)).*y);
end

a1b = A1b\b1b;

%Exercicio 2

x2 = [1872 1890 1900 1920 1940 1950 1960 1970 1980 1991 1996]
y2 = [9.9 14.3 17.4 30.6 41.2 51.9 70.2 93.1 119.0 146.2 157.1]

grau2 = 2;
n2 = grau2 + 1;
A2 = zeros(n2);
b2 = zeros(n2,1);

for i = (1:n2)
   for j = (1:n2)
      A2(i,j) = sum(x2.^(i+j-2));
   end
   b2(i) = sum((x2.^(i-1)).*y2);
end

a2 = A2\b2;