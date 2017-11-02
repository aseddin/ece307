close all;

%% Fourier Series Coefficients [CHANGE ACCORDING TO YOUR f(t)]


% Coefficients as a matrix
% % Square wave 
w0 = pi; 
a0 = 0.5;
an = [0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0];
bn =[0.6366         0    0.2122         0    0.1273         0    0.0909         0    0.0707         0    0.0579         0    0.0490         0    0.0424         0    0.0374         0    0.0335         0];

% % Sawtooth
% w0 = 2 * pi / 3;
% a0 = 3;
% an = [0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0     0];
% bn = [1.9099    0.9549    0.6366    0.4775    0.3820    0.3183    0.2728    0.2387    0.2122    0.1910    0.1736    0.1592    0.1469    0.1364    0.1273    0.1194    0.1123    0.1061    0.1005    0.0955];
%% Generate and plot f(t) [NO CHANGE NEEDED]

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
    % fix the y axis limits to observe the harmonic decay with frequency
    if(an(1) ~= 0) 
        ylim([-an(1) an(1)]);
    end
    
    % nth harmonic sin
    subplot(4, 1, 2);
    plot(t, s2); 
    title('b_n sin(n \omega_0 t)');
    xlabel('t');
    % fix the y axis limits to observe the harmonic decay with frequency
    if(bn(1) ~= 0) 
        ylim([-bn(1) bn(1)]);
    end
    
    % nth harmonic
    subplot(4, 1, 3);
    plot(t, s1 + s2); 
    title('a_n cos(n \omega_0 t) + b_n sin(n \omega_0 t)');
    xlabel('t');
    % fix the y axis limits to observe the harmonic decay with frequency
    if((an(1) ~= 0) || (bn(1) ~= 0)) 
        ylim([-max(an(1), bn(1)) max(an(1), bn(1))]);
    end
    
    % f reconstructed with n harmonics
    subplot(4, 1, 4);
    plot(t, f); 
    title(['f(t) reconstructed using', int2str(n), ' Harmonics']);

    
    pause;
    
end

%% Frequency Spectrum plots [NO CHANGE NEEDED]

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
