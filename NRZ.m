bits = [1 0 1 0 0 0 1 1 0];
bitrate = 1;

T = length(bits) / bitrate;
n = 200;
N = n * length(bits);
dt = T / N;
t = 0:dt:(T); % Adjust the length of the time vector
x = zeros(1, length(t));

for i = 0:length(bits)-1
    if bits(i+1) == 1
        x(i*n+1:(i+1)*n) = 1;
    else
        x(i*n+1:(i+1)*n) = 0;
    end
end

plot(t, x, 'LineWidth', 3);
axis([0 t(end) -0.1 1.1]);
grid on;
title(['whatever nrz:[' num2str(bits) ']']);