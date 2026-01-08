img = im2double(imread('imagen.png'));
if size(img,3) == 3
    img = rgb2gray(img);
end



img_shifted = shift_fft(img);

figure
subplot(1,2,1)
imshow(img, [])
title('Original')

subplot(1,2,2)
imshow(img_shifted, [])
title('Desplazada')