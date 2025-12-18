function F = fft2shift(f)
% Realiza la transformada de Fourier bidimensional desplazando los
% cuadrantes antes y después de la transformada. Es decir está considerando
% el centro de coordenadas igual al centro de la matriz
%
% Sintaxis
%   F = fft2shift(f);
 
F = fftshift( fft2 (fftshift (f) ) );
