[x, y, z] = ndgrid(-5:0.1:5, -5:0.1:5, -5:0.1:5);

% Построение начальной функции
fSRC = 11*x.^2 - 2*x.*y - 2*x.*z + 2*y.*z + 9*z.^2 - 4*x + y + z;
subplot (1, 2, 1);
isosurface(fSRC, 0);
title ("First plot");

A = [11 -1 -1; -1 0 1; -1 1 9];
a = [-2; 1/2; 1/2];

% Получение собственных значений и векторов
[vecs, vals] = eigs(A);
transCol1 = transpose(vecs(:, 1));
transCol2 = transpose(vecs(:, 2));
transCol3 = transpose(vecs(:, 3));

% Получение стобца коэффициентов линейной формы
ST = [transCol1; transCol2; transCol3];
a1 = ST*a;

% Построение полученной функции
fRES = vals(1,1)*x.^2 + vals(2,2)*y.^2 + vals(3,3)*z.^2 + a1(1)*x + a1(2)*y + a1(3)*z;
subplot (1, 2, 2);
isosurface(fRES, 0);
title ("Second plot");

