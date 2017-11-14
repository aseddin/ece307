close all;

%% Fourier Series Coefficients [CHANGE ACCORDING TO YOUR v_i(t), v_o(t)]


% Coefficients as a matrix
% Input voltage
w0_in = pi;
a0_in = 0;
an_in = [0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0];
bn_in = [0.6366   -0.3183    0.2122   -0.1592    0.1273   -0.1061    0.0909   -0.0796    0.0707   -0.0637    0.0579   -0.0531    0.0490   -0.0455    0.0424   -0.0398    0.0374   -0.0354    0.0335   -0.0318];

% Output voltage
w0_out = pi;
a0_out = 0;
an_out = [1.5237    0.0035   -0.3620    0.1172    0.1105   -0.1041    0.0721   -0.0214    0.0242    0.0389    0.0191   -0.0264    0.0225   -0.0119   -0.0175   -0.0078    0.0048   -0.0113    0.0109   -0.0074];
bn_out = [-0.9336    0.7052    0.0683   -0.1893    0.0982   -0.0132   -0.0301    0.0564    0.0414   -0.0025    0.0261   -0.0069   -0.0059    0.0162   -0.0011    0.0133    0.0128   -0.0047   -0.0014    0.0066];

%% Frequency Spectrum plots [NO CHANGE NEEDED]

spectrum_in = [a0_in, an_in - bn_in*1j];
spectrum_out = [a0_out, an_out - bn_out*1j];

harmonic = 0:length(spectrum_in) - 1;
figure;

% Magnitude Spectrum
subplot(2, 1, 1);
stem(harmonic, abs(spectrum_in), 'fill', 'MarkerSize', 7, 'LineWidth', 2);
title('Input Magnitdue Spectrum');
xlabel('Harmonic');

% Phase Spectrum
subplot(2, 1, 2);
stem(harmonic, abs(spectrum_out), 'fill', 'MarkerSize', 7, 'LineWidth', 2);
title('Output Magnitdue Spectrum');
xlabel('Harmonic');