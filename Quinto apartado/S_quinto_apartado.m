%% 5. Simulación de Imagen Movida (Interactivo)

% --- CONFIGURACIÓN ---
N = 256; % Tamaño de la imagen (resolución espacial)

% --- AQUÍ ESTÁ LA OPCIÓN DE CAMBIAR LA LONGITUD ---
L = input('Introduce la longitud del movimiento L (en píxeles): ');


if L > N
    warning('La longitud L es mayor que la imagen. Se recortará.');
    L = N;
end

%% 5.1 Construcción de la PSF (Trayectoria Rectilínea)
PSF = zeros(N,N);
centro = floor(N/2) + 1;

angulo = input('Introduce el ángulo del movimiento (grados): ');
theta = angulo * pi / 180;   % radianes

k = -(L-1)/2 : (L-1)/2;

x = centro -k * cos(theta);
y = centro + k * sin(theta);

x = round(x);
y = round(y);

validos = x >= 1 & x <= N & y >= 1 & y <= N;
x = x(validos);
y = y(validos);

PSF(sub2ind([N N], y, x)) = 1;
PSF = PSF / sum(PSF(:));
%% 5.2 Cálculo de la MTF
% Calculamos la FFT 2D y centramos
OTF = fftshift(fft2(PSF));
MTF = abs(OTF);

%% Representación Gráfica (Plots)
figure('Name', ['Análisis para L = ' num2str(L) ...
               ' y \theta = ' num2str(angulo)], 'Color', 'w');

% 1. Visualizar la PSF (El "borrón")
subplot(2,2,1);
imagesc(PSF); colormap gray; axis square;
title(['PSF Espacial (L = ' num2str(L) ' px)']);
xlabel('x'); ylabel('y');

% 2. Visualizar la MTF (Frecuencias)
subplot(2,2,2);
imagesc(MTF); colormap(gca, 'jet'); axis square; colorbar;
title('MTF (Magnitud de la FFT)');
xlabel('Frecuencia u'); ylabel('Frecuencia v');

% 3. Perfil de la MTF (Corte horizontal)
subplot(2,1,2);
u_axis = linspace(-0.5, 0.5, N); % Eje de frecuencias normalizadas
perfil = MTF(centro, :);
plot(u_axis, perfil, 'LineWidth', 2, 'Color', 'b');
grid on;
title('Perfil de la MTF (Corte u)');
xlabel('Frecuencia Espacial (ciclos/pixel)');
ylabel('Modulación');
xlim([-0.1 0.1]); % Zoom en la zona central para ver bien la Sinc

% Añadir nota sobre el primer cero
primer_cero = 1/L;
xline(primer_cero, '--r', ['Primer cero: 1/L = ' num2str(primer_cero, '%.3f')]);

%% 5.3 

%abrimos imagen deseada
[file,path] = uigetfile({'*.bmp';'*.tif';'*.*'},'Select an Image');
file1 = fullfile(path,file);
v=double(imread(file1));
v = imresize(v, [N N]);

V=fft2shift(v);

%convolucion usamos que la transformada de la convolución es el producto de
%transformadas
H=V.*MTF;
h=real(ifft2shift(H)); %imagen movida

%dibujamos la imagen movida y la original
figure(2)
subplot(1,2,1)
imagesc(v)
colormap gray
axis tight equal

subplot(1,2,2)
imagesc(h)
colormap gray
axis tight equal

%% 5.4 

epsilon = 1e-3;
FTh=fft2shift(h);
figure(3)
subplot(1,2,1)
imagesc(h)
colormap gray
axis tight equal

s=real(ifft2shift(FTh./(MTF+epsilon)));
subplot(1,2,2)
imagesc(s)
colormap gray
axis tight equal

