%1.1 FUNCION SINUISOIDAL Y TF


N=128;
%bucle
x=0:N-1;
v=linspace(0,2,100);
figure(1)
for i=1:length(v)
    u = v(i);
    s=sin(2*pi*u*x);
    f = (-N/2:N/2-1)/N;
    S=fftshift(fft(s))/N;

    subplot(1,2,1)
    plot(x,s)
    ylim([-1 1]) 
    subplot(1,2,2)
    plot(f, abs(S))

    if abs(v(i) - 0.5) < 1e-2
        pause(3)
    else 
        pause(0.1)
    end
   
end

%%
%1.2
N=1000;
x=0:N-1;
nu=0.05;
s=sin(2*pi*nu*x);
figure(2)
t=linspace(0,1000,100);
for i=1:length(t)
    A=t(i);
    s_dec=s.*exp(-x/A);
    S_dec=fftshift(fft(s_dec));

    
    subplot(1,2,1)
    plot(x,s_dec)
    subplot(1,2,2)
    f = (-N/2:N/2-1)/N;
    plot(f,abs(S_dec/N))

    pause(0.01)
end

%%
%1.3
N=516;
x=0:N-1;
nu1=0.04;
nu2=0.03;
A1=1;
A2=2;
alpha1 = 0.002;  % línea estrecha
alpha2 = 0.001;  % línea ancha

s1=A1*sin(2*pi*nu1*x).*exp(-alpha1*x);
s2=A2*sin(2*pi*nu2*x).*exp(-alpha2*x);
s=s1+s2;
S=fftshift(fft(s));

figure(3)
subplot(1,2,1)
plot(x,s)
xlabel('x')
ylabel('s1+s2')

subplot(1,2,2)
f = (-N/2:N/2-1)/N;
plot(f,abs(S)/N)
