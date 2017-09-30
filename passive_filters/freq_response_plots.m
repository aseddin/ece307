close all;

%% Generate w, H(w)
w = 0:0.01:1000;

% complex H(w)
h = (100 * pi) ./ (200 * pi + w * 1j);

% magnitude |H(w)|
mag_h = abs(h);

% phase /_ Theta
phase_h = angle(h);

%% Generate magnitude plot
subplot(2, 1, 1);
plot(w, mag_h);
xlabel('w');
ylabel('|H(w)|');
grid on;

%% Generate phase angle plot
subplot(2, 1, 2);
plot(w, phase_h);
xlabel('w');
ylabel('\angle\theta');
grid on;