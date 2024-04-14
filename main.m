% h = kuramoto(3,1,0);

% Name of the CSV file
filename = 'default.csv';

% Read the data from the CSV file
data = readtable(filename, 'ReadVariableNames', false);

% Extract theta values for each oscillator from the table
theta1 = data.Var1(600:800);
theta2 = data.Var2(600:800);
theta3 = data.Var3(600:800);

% Compute the sine of theta values
sin_theta1 = sin(theta1);
sin_theta2 = sin(theta2);
sin_theta3 = sin(theta3);

% Create a time vector assuming each row is at consecutive equal time intervals
time = 0:(length(theta1)-1);

% Plot the results
figure;
hold on;
plot(time, sin_theta1, 'r-', 'LineWidth', 0.5);
plot(time, sin_theta2, 'g-', 'LineWidth', 0.5);
plot(time, sin_theta3, 'b-', 'LineWidth', 0.5);
hold off;

% Enhancing the plot
title('Sine of Theta Values Over Time for Three Oscillators');
xlabel('Time (arbitrary units)');
ylabel('Sine of Theta');
legend('Oscillator 1', 'Oscillator 2', 'Oscillator 3');

% Grid on for better visualization
grid on;
