function funcao = minimosq (g, x)
    for i = 1:numel(g)
        for j = 1:numel(g)
            A(i,j) = sum(g{i}(x).*g{j}(x));
        end
        b(i) = sum(g{i}(x).*y);
    end
    alfa = A\b';
    func = 0;
    for n = i:numel(alfa)
        func = func+(alfa(n)*(f.^(n-1)));
    end
    funcao = matlabFunction(func);
end