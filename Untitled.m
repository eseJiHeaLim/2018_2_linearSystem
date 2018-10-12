Fs = 1e3; Ts = 1/Fs; % sampling frequency and sampling period
N = 200; t = (0:N-1)*Ts;
x = randi([0 1], N, 1); % Bernoulii process
figure(1);
stairs( t, x, 'LineWidth', 1 ); ylim([-0.2 1.2]); grid on;
xlabel('time $t$ (sec)', 'Interpreter', 'latex');
[r, lags] = xcorr(x,100, 'unbiased');
figure(2), plot(lags*Ts, r, 'LineWidth', 1); grid on;
xlabel('delay $\tau$ (sec)', 'Interpreter', 'latex');
%%
p = 0.2;
y = rand(N,1) < p;
figure(3); stairs( t, y, 'LineWidth', 1 ); ylim([-0.2 1.2]);
grid on; set( gca, 'YTick', [0 1] );
mean(y)
%%
Fs = 1e3; Ts = 1/Fs; N = 200; t = (0:N-1)*Ts;
b = 2*randi([0 1], N, 1) - 1; % +1 or -1, Bernoulli process
x = cumsum(b);  
figure(1); stairs( t, x, 'LineWidth', 1 ); grid on;
xlabel('time $t$ (sec)', 'Interpreter', 'latex');
%%
x=[0 1 1 -1];
y=cumsum(x)

%%
res=zeros(1000,1);

for i=0 :1000
    N = 1000;
    x = cumsum(randn(N,1));
    y = cumsum(randn(N,1));
    
    for j=1:1000
        if (abs(sqrt(x(j)^2 +y(j)^2))<5)
            res(j)=res(j)+1;
        end
    end
end

x=1:1000;
y=res/1000;
plot(x,y)

%%
