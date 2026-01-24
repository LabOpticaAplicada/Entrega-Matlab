function f = GenerarForma(N, DimX, DimY, forma)

% La funcion de las dimensiones depende del tipo de forma que se genere

m = ones(N, N);

x = (1:N) - N/2;

switch forma
    case 'circulo'
        % DimY no se usa

        [X2, Y2] = meshgrid(x.^2, x.^2);

        R2 = X2 + Y2;
        r2 = DimX*DimX;

        m(R2>r2) = 0;

    case 'rectangulo'

        [X, Y] = meshgrid(x, x);
        
        m(X<-DimX/2) = 0;
        m(X>DimX/2) = 0;
        m(Y<-DimY/2) = 0;
        m(Y>DimY/2) = 0;

    case 'triangulo'

        pendiente = DimY/DimX;

        [X, Y] = meshgrid(x, x);
        
        m(X<-DimX/2) = 0;
        m(X>DimX/2) = 0;
        m(Y<-DimY/2) = 0;
        m(Y>DimY/2) = 0;

        m(Y>pendiente*X) = 0;

    case 'peine'
        % en este caso las dimensiones son la separacion entre puntos

        m = zeros(N, N);
        for i=1:DimY:N
            for j=1:DimX:N
                m(i, j) = 1;
            end
        end

    otherwise
        % No hay una instruccion por defecto

end

f = m;