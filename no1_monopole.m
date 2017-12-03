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
% figure(2)
% plot(abs(mic1FFT(:,1:size(freq,2))))

pref = 20e-6;   % Reference pressure, Pa
wref = 10^-12;  % Reference power, W

% Calculate intensity.
mic1RMS = rms(mic(1,:));
mic2RMS = rms(mic(2,:));
p0 = 1.41; % kg/m^3
c0 = 343; % m/s
I1 = mic1RMS^2/(p0*c0);   % Watts
I2 = mic2RMS^2/(p0*c0);   % Watts

% Calculate sound power level. Units: W.
r = 4 * 0.3048; % mic locations from center (meters) 
pow1 = I1*4*pi*r^2;
pow2 = I2*4*pi*r^2;
pwl1 = 10*log10(pow1/wref);
pwl2 = 10*log10(pow2/wref);

% Calculate sound pressure level. Units: dB.

spl1 = 20*log10(mic1Ampl/pref);
spl2 = 20*log10(mic2Ampl/pref);

% Calculate sound intensity level. Units: dB.
Iref = 10^-12;    % Reference intensity, W/m^2
sil1 = 20*log10((mic1RMS/pref)+10*log10(pref^2/(p0*c0*Iref)));
sil2 = 20*log10((mic2RMS/pref)+10*log10(pref^2/(p0*c0*Iref)));