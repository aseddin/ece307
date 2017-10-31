close all;

%% Generate w, H(w)
w = 0:0.01:10;

%% Generate different order Bode mag plot
LEGENDS = [];
figure;
for n = 1:4
    % Generate the complex H(w)
    h = ((-1)^n) ./ ((1 + 1i * w).^n);
    semilogx(w, 20*log10(abs(h)));
    hold on;
    grid on;
    xlabel('\omega');
    ylabel('|H(\omega)| dB');
    
    % Display filter order in the legend
    LEGENDS = [LEGENDS, int2str(n)];
    legend(LEGENDS(:));
    pause
end
