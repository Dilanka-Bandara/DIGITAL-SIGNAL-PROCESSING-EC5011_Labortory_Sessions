%BANDARA H.G.T.D. 2022e048
%Part 03

x = [1 0 4 0 3];              % Input
h = [0.6 0.2 -0.4];           % Impulse response

% 1. Using convolution
y_conv = conv(x, h);

% 2. Using filter
b = h;                        % Numerator coefficients
a = 1;                        % Denominator (FIR)
y_filter = filter(b, a, x);

% 3. Using initial condition
zi = [1 2];                   % Initial condition (for longer systems)
[y_ic, zf] = filter(b, a, x, zi);

% 4. Plot all
subplot(4,1,1); stem(x); title('Input x[n]');
subplot(4,1,2); stem(y_conv); title('Using conv()');
subplot(4,1,3); stem(y_filter); title('Using filter()');
subplot(4,1,4); stem(y_ic); title('Using filter() with initial condition');


% 7. manual convolution
x = [1 2 3];
h = [1 -1];
N = length(x) + length(h) - 1;
y = zeros(1, N);

for n = 1:N
    for k = 1:length(x)
        if n-k+1 > 0 && n-k+1 <= length(h)
            y(n) = y(n) + x(k)*h(n-k+1);
        end
    end
end
stem(y);
