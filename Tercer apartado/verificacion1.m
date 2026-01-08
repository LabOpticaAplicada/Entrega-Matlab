N = 128;
img = zeros(N);
img(40:80,40:80) = 1;



img_shifted = shift_fft(img);

figure
subplot(1,2,1)
imshow(img, [])
title('Original')

subplot(1,2,2)
imshow(img_shifted, [])
title('Desplazada')