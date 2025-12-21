%% 1.1 FUNCION SINUISOIDAL Y TF

N=128;
%bucle
x=0:N-1; %fs=1

figure(1)
for v = 0:0.05:2  %aliasing fs/2=0.5
    s=sin(2*pi*v*x);
    f = (-N/2:N/2-1)/N;
    S=fftshift(fft(s))/N;

    subplot(1,2,1)
    plot(x, s, '-')
    hold on
    plot(x, s, 'o', 'MarkerSize', 3,'MarkerFaceColor', 'red')
    hold off
    xlabel('x')
    ylabel('f(x)')
    xlim([-5 70])  
    ylim([-1.2 1.2])
    yline(0,Linewidth=1)
    xline(N,Linewidth=0.5)
    xline(0,Linewidth=1)
    title(sprintf('Seno para frecuencia \\nu=%.2f ',v))

    subplot(1,2,2)
    plot(f, abs(S), '-')
    hold on
    plot(f, abs(S), 'o', 'MarkerSize', 3,'MarkerFaceColor', 'red')
    hold off
    yline(0,Linewidth=1)
    xline(0,Linewidth=1)
    xlabel('\nu')
    ylabel('F(\nu)/N')


    if v==0.5
        pause(4)
    else 
        pause(0.3)
    end 
end

%% 1.2. Seno con exponencial decreciente

N=64;
x=0:N-1;
f = (-N/2:N/2-1)/N;
nu=1.2;

%primera amplitud

A1=10;
s=sin(2*pi*nu*x);
s_dec1=s.*exp(-x/A1);
figure(2)

sgtitle('Función y transformada para \nu=1.2')
subplot(2,2,1)
plot(x, s_dec1, '-')
hold on
plot(x, s_dec1, 'o', 'MarkerSize', 3,'MarkerFaceColor', 'red')
plot(x,exp(-x/A1),'--','Color','magenta')
hold off
xlabel('x')
ylabel('f(x)')
xlim([-20 65])  
ylim([-1.2 1.2])
yline(0,Linewidth=1)
xline(0,Linewidth=1)

S_dec1=fftshift(fft(s_dec1));
subplot(2,2,2)
plot(f, abs(S_dec1/N))
hold on
plot(f, abs(S_dec1/N), 'o', 'MarkerSize', 3,'MarkerFaceColor', 'red')
hold off
xlabel('\nu')
ylim([0 0.38])
ylabel('F(\nu)/N')
yline(0,Linewidth=1)
xline(0,Linewidth=1)

%segunda amplitud

A2=100;
s_dec2=s.*exp(-x/A2);
subplot(2,2,3)
plot(x, s_dec2, '-')
hold on
plot(x, s_dec2, 'o', 'MarkerSize', 3,'MarkerFaceColor', 'red')
plot(x,exp(-x/A2),'--','Color','magenta')
hold off
xlabel('x')
ylabel('f(x)')
xlim([-20 65])  
ylim([-1.2 1.2])
yline(0,Linewidth=1)
xline(0,Linewidth=1)

S_dec2=fftshift(fft(s_dec2));
subplot(2,2,4)
plot(f, abs(S_dec2/N))
hold on
plot(f, abs(S_dec2/N), 'o', 'MarkerSize', 3,'MarkerFaceColor', 'red')
hold off
xlabel('\nu')
ylabel('F(\nu)/N')
yline(0,Linewidth=1)
xline(0,Linewidth=1)
ylim([0 0.38])

%%

cla
N=64;
x=0:N-1;
nu=1.2;
s=sin(2*pi*nu*x);
figure(3)
t=linspace(0,100,100);
for i=1:length(t)
    A=t(i);
    s_dec=s.*exp(-x/A);
    S_dec=fftshift(fft(s_dec));

    
    subplot(1,2,1)
    plot(x,s_dec)
    xlabel('x')
    ylabel('f(x)')
    xlim([-20 65])  
    ylim([-1.2 1.2])
    yline(0,Linewidth=1)
    xline(0,Linewidth=1)
    
    subplot(1,2,2)
    f = (-N/2:N/2-1)/N;
    plot(f,abs(S_dec/N))
    xlabel('\nu')
    ylabel('F(\nu)')
    ylim([-0.1 0.4])
    yline(0,Linewidth=1)
    xline(0,Linewidth=1)

    pause(0.1)
end


%% 1.3 doblete

N=64;
x=0:N-1;
nu1=0.3;
nu2=0.25;

A1 = 100;  % línea estrecha
A2 = 20;  % línea ancha

a1=1;
a2=4;

s1=a1*sin(2*pi*nu1*x).*exp(-x/A1);
s2=a2*sin(2*pi*nu2*x).*exp(-x/A2);
s=s1+s2;
S=fftshift(fft(s));

figure(4)
subplot(1,2,1)
plot(x,s)
hold on
plot(x, s, 'o', 'MarkerSize', 3,'MarkerFaceColor', 'red')
hold off
xlim([-2 N])
xlabel('x')
ylabel('s1+s2')
yline(0,Linewidth=1)
xline(0,Linewidth=1)

subplot(1,2,2)
f = (-N/2:N/2-1)/N;
plot(f,abs(S/N))
hold on
plot(f,abs(S/N), 'o', 'MarkerSize', 3,'MarkerFaceColor', 'red')
hold off
yline(0,Linewidth=1)
xline(0,Linewidth=1)
xlabel('\nu')
ylabel('F(\nu)/N')
