function [x, y] = lagrangiano(xi, yi)
%LAGRANGIANO Summary of this function goes here
%   Detailed explanation goes here

passo = mean(diff(xi))/10;
cont = 1;
for x = xi(1):passo:xi(end)
    for n = 1:length(xi)
        num = 1;
        den = 1;
        for m = 1:length(xi)
            if m ~= n
                num = num*(x - xi(m));
                den = den*(xi(n) - xi(m));
            end
        end
        L(n) = num/den;
    end
    y(cont) = sum(yi.*L);
    cont = cont + 1;
end
x = xi(1):passo:xi(end);

return