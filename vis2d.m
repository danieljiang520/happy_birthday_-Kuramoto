% h = kuramoto(3,1,0);

% Name of the CSV file
filename = 'quick.csv';

% Read the data from the CSV file
data = readtable(filename, 'ReadVariableNames', false);

% Extract theta values for each oscillator from the table
range_start = 1;
range_end = 800;
theta1 = data.Var1(range_start:range_end);
theta2 = data.Var2(range_start:range_end);
theta3 = data.Var3(range_start:range_end);

% Compute the sine of theta values
sin_theta1 = sin(theta1);
sin_theta2 = sin(theta2);
sin_theta3 = sin(theta3);

cos_theta1 = cos(theta1);
cos_theta2 = cos(theta2);
cos_theta3 = cos(theta3);

% average pos
order = sqrt(((sin_theta1 + sin_theta2 + sin_theta3) / 3).^2 + ((cos_theta1 + cos_theta2 + cos_theta3) / 3).^2);

% Create a time vector assuming each row is at consecutive equal time intervals
time = 0:(length(theta1)-1);

% Plot the results
figure;
subplot(2,1,1);
hold on;
plot(time, sin_theta1, 'r-', 'LineWidth', 0.5);
plot(time, sin_theta2, 'g-', 'LineWidth', 0.5);
plot(time, sin_theta3, 'b-', 'LineWidth', 0.5);
hold off;

% Enhancing the plot
title('Sine of Theta Values Over Time for Three Oscillators (Rhythm)');
xlabel('Time (arbitrary units)');
ylabel('Sine of Theta');
legend('Oscillator 1', 'Oscillator 2', 'Oscillator 3');
grid on;

subplot(2,1,2);
plot(time, order);
title('Order Parameter');
xlabel('Time (arbitrary units)');
legend(['Order Parameter']);

grid on;
