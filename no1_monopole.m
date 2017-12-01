clear
load project_2_data.mat;

% Plot signals to get an overview of the data.
% figure(1)
% plot(mic(1,:))
% hold on
% plot(mic(2,:))

% Perform FFT on each signal to obtain signal amplitude.
N = 2000; % Number of sample points
fmax = 5e3; % Nyquist frequency (Hz)
dt   = 1/(2*fmax);  % Sample rate based on Shannon's sampling theorem (s)
T    = N*dt;        % Time period (s)
df   = 1/T;         % Frequency spacing (Hz)
freq   = 0:df:fmax;     % frequency domain (Hz)

mic1FFT = (2/N)*fft(mic(1,:));
mic2FFT = (2/N)*fft(mic(2,:));

% Determine signal amplitude and frequency from the FFT.
[mic1Ampl,mic1Freq] = max(abs(mic1FFT));
[mic2Ampl,mic2Freq] = max(abs(mic2FFT));

% Plot FFT of each signal.
figure(2)
plot(abs(mic1FFT(:,1:size(freq,2))))

