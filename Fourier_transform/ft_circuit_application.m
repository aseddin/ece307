close all

% The code in this example cannot be generalized to other functions easily
% it was calculated by hand and it used for illustrative purposes only

% Time (t) and Frequency (w)
t = 0:0.05:1.5;
w = 0:0.05:25*pi;

% Generate vi(t) = e^(-5t) and Vi(w)
vi_t = exp(-5 * t);
vi_w = 1 ./ (5 + w*1j);

% Generate h(t) and H(w)
h_w = (-1e7)./(w.^2 - 200e3*1j*w - 1e7);

% Generate vo(t) and Vo(w)
vo_w = vi_w .* h_w;
vo_t = 2.5e-4 * exp(-2e5 * t) - 1.1 * exp(-50 * t) + 1.1 * exp(-5 * t);

% Generate plots

% vi(t)
subplot(2, 3, 1)
plot(t, vi_t)
xlabel('t')
ylabel('v_i(t)')

% |Vi(w)|
subplot(2, 3, 4)
plot(w, abs(vi_w))
xlabel('\omega')
ylabel('|V_i(\omega)|')


% h(t)
% NOT NEEDED FOR THIS EXAMPLE

% |H(w)|
subplot(2, 3, 5)
plot(w, abs(h_w))
xlabel('\omega')
ylabel('|H(\omega)|')

% vo(t)
subplot(2, 3, 3)
plot(t, vo_t)
xlabel('t')
ylabel('v_o(t)')

% |Vi(w)|
subplot(2, 3, 6)
plot(w, abs(vo_w))
xlabel('\omega')
ylabel('|V_o(\omega)|')