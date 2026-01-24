
% Código para el ejercicio 2 de la entrega
% en este script se generan e imprimen las tres imágenes del apartado b

figura = GenerarForma(512, 32, 64, 'circulo');

figure(1)
imagesc(figura)
colormap gray
axis tight equal

peine = GenerarForma(512, 200, 200, 'peine');

figure(2)
imagesc(peine)
colormap gray
axis tight equal

convo = Convolucion(figura, peine, 'r');

figure(3)
imagesc(convo)
colormap gray
axis tight equal