% ME 621                                                        Fall 2017
% muffler transmission loss

clear

C      = 0.9547;     % muffler length (m)
% lambda = 1;             % wavelength (m)
k      = (2*pi)/381.9;  % wave number (1/m)
m      = (2*sqrt(.245/pi))/.002;       % muffler to inlet/outlet pipe area ratio, B/A
freq = 0:0.1:400;
kFin = k*freq

% transmission loss ( muffler length , area ratio ) (dB)
for cc = 1:length(kFin)
    TL(cc) = 10*log10(1 + 0.25*((m-1/m)*sin(kFin(cc)*C)).^2);
end

% plot routine
plot(freq, TL)
xlabel('Frequency (Hz)')
ylabel('TL (dB)')
title('Transmission Loss in Designed Muffler (Problem 3)')
