%% Time domain waveform
T = 2e-3; % pulse duration
Fs = 1e5; Ts = 1/Fs;
t = -T/2:Ts:T/2;
x = 50*(cos(2*pi*t/T)+1);
figure(1); plot( t, x, 'LineWidth', 2 );

grid on; 
 xlim(1.0e-3*[-2 2]);
 set( gca, 'XTick', 1e-3*[-2:0.5:2]);
xlabel('time $t$ (sec)', 'Interpreter', 'latex');

%% Frequency domain spectrum
fd = 10; % frequency resolution
N  = 2^(nextpow2(ceil(Fs/fd)));
X  = fft(x, N)*Ts; Xc = fftshift(X);
XcdB = 20*log10(abs(Xc));
f  = Fs/2*([0:N-1]-N/2)/N;
figure(2); plot( f, XcdB-max(XcdB), 'LineWidth', 2 );
grid on; xlim(5e3*[-1 1]); ylim([-100 0]);
xlabel('frequency $f$ (Hz)', 'Interpreter', 'latex');
ylabel('normalized power (dB)');
