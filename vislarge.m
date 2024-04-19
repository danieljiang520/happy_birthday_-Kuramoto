% Clear workspace and close all figures
clc; clear; close all;

% Name of the CSV file and setup
filename = 'large_quick.csv';
type = "Beethoven 9"; % 5
N = 100;  % Set this to the number of oscillators you have data for
K = 5;

% Read the data from the CSV file
data = readtable(filename, 'ReadVariableNames', false);

% Specify the range of data to analyze
range_start = 1;
range_end = 150;

% Initialize arrays for storing theta, sine, and cosine values
thetas = zeros(range_end - range_start + 1, N);
sins = zeros(size(thetas));
coss = zeros(size(thetas));

% Extract theta values for each oscillator from the table and compute sine and cosine
for i = 1:N
    thetas(:, i) = data{range_start:range_end, i};
    sins(:, i) = sin(thetas(:, i));
    coss(:, i) = cos(thetas(:, i));
end

% Compute average position for order parameter
avg_sin = mean(sins, 2);
avg_cos = mean(coss, 2);
order = sqrt(avg_sin.^2 + avg_cos.^2);

% Create a time vector assuming each row is at consecutive equal time intervals
time = range_start:range_end;

% Plot the results
f = figure;
subplot(2,1,1);
hold on;
colors = 'rgbcmky';  % Color for each oscillator, add more colors if N > 7
for i = 1:N
    plot(time, sins(:, i), 'Color', colors(mod(i-1, length(colors)) + 1), 'LineWidth', 0.5);
end
hold off;

% Enhancing the plot
title(sprintf('Sine of Theta Values Over Time (%s: N=%d, K=%.1f)', type, N, K));
xlabel('Time (arbitrary units)');
ylabel('Sine of Theta');
% legend(arrayfun(@(x) sprintf('Oscillator %d', x), 1:N, 'UniformOutput', false));
grid on;

subplot(2,1,2);
plot(time, order, 'k-', 'LineWidth', 1.5);
title('Order Parameter');
xlabel('Time (arbitrary units)');
ylabel('Order');
legend('Order Parameter');
fontsize(f, 18, "points");
grid on;
axis([range_start range_end -0.1 1]);
