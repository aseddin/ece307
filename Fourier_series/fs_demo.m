close all;

%% Fourier Series Coefficients [CHANGE ACCORDING TO YOUR f(t)]

% Fundamental angular frequency [rad/s]
w0 = pi; 

% Coefficients as a matrix
a0 = 0.5;
an = [0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0];
bn =[0.6366         0    0.2122         0    0.1273         0    0.0909         0    0.0707         0    0.0579         0    0.0490         0    0.0424         0    0.0374         0    0.0335         0];


%% Generate and plot f(t) [NO CHANGE NECESSRY]

% Generate enough time points for a single period
t = linspace(0, 2*pi/w0, 1000);

figure;
% plot DC component only
f = ones(size(t)) * a0;
subplot(4, 1, 1);
plot(t, f);
xlabel('t');
title('a_0 or DC');

subplot(4, 1, 4);
plot(t, f);
xlabel('t');
title('f(t)');

pause;

% plot f(t) using n Harmonics
for n = 1:length(an)
    
    s1 = an(n) * cos(n * w0 * t);
    s2 = bn(n) * sin(n * w0 * t);
    f = f + s1 + s2; 
    
    % nth harmonic cos
    subplot(4, 1, 1);
    plot(t, s1);
    title('a_n cos(n \omega_0 t)');
    xlabel('t');
    
    % nth harmonic sin
    subplot(4, 1, 2);
    plot(t, s2); 
    title('b_n sin(n \omega_0 t)');
    xlabel('t');
    
    %nth harmonic
    subplot(4, 1, 3);
    plot(t, s1 + s2); 
    title('a_n cos(n \omega_0 t) + b_n sin(n \omega_0 t)');
    xlabel('t');
    
    % f reconstructed with n harmonics
    subplot(4, 1, 4);
    plot(t, f); 
    title(['f(t) reconstructed using', int2str(n), ' Harmonics']);
    
    pause;
    
end

%% Frequency Spectrum plots [NO CHANGE NECESSRY]

spectrum = [a0, an- bn*1j];
harmonic = 0:length(spectrum) - 1;
figure;

% Magnitude Spectrum
subplot(2, 1, 1);
stem(harmonic, abs(spectrum), 'fill', 'MarkerSize', 7, 'LineWidth', 2);
title('Magnitdue Spectrum');
xlabel('Harmonic');

% Phase Spectrum
subplot(2, 1, 2);
stem(harmonic, rad2deg(angle(spectrum)), 'fill', 'MarkerSize', 7, 'LineWidth', 2);
title('Phase Spectrum');
xlabel('Harmonic');
