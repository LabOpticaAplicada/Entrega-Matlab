function F = ifft2shift(f)
% Realiza la transformada de Fourier inversa bidimensional desplazando los
% cuadrantes antes y después de la transformada. Es decir está considerando
% el centro de coordenadas igual al centro de la matriz
%
% Sintaxis
%   F = fft2shift(f);

F = fftshift( ifft2 (fftshift (f) ) );