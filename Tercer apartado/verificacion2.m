N = 128;
[x, y] = meshgrid(0:N-1, 0:N-1);

fx = 0.05;
fy = 0.1;

img = sin(2*pi*(fx*x + fy*y));



% Desplazamiento por Fourier
img_shifted = shift_fft(img);

% Solución analítica
img_analitica = sin(2*pi*(fx*(x-dx) + fy*(y-dy)));

% Error
error = img_shifted - img_analitica;
error_max = max(abs(error(:)));

fprintf('Error máximo = %.2e\n', error_max);



figure

subplot(2,2,1)
imshow(img, [])
title('Sinusoidal original')

subplot(2,2,2)
imshow(img_shifted, [])
title('Desplazada (FFT)')

subplot(2,2,3)
imshow(img_analitica, [])
title('Desplazada analítica')

subplot(2,2,4)
imshow(error, [])
title('Error (FFT - analítica)')
colorbar