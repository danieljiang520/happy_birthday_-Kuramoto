clc;clear;close all;

filename1 = 'default.csv';  % pitch data
filename2 = 'quick.csv';  % rhythm data

data1 = readtable(filename1, 'ReadVariableNames', false);
data2 = readtable(filename2, 'ReadVariableNames', false);

theta1_pitch = data1.Var1 * 10;  
theta2_pitch = data1.Var2 * 10;
theta3_pitch = data1.Var3 * 10;

theta1_rhythm = data2.Var1;
theta2_rhythm = data2.Var2;
theta3_rhythm = data2.Var3;

% Compute the sine 
sin_theta1_pitch = sin(theta1_pitch);
sin_theta2_pitch = sin(theta2_pitch);
sin_theta3_pitch = sin(theta3_pitch);

numPoints = height(data1);
traceLength = 10;  

%% Create a figure for plotting
figure;
hold on;
axis equal;
xlabel('Cosine Rhythm');
ylabel('Sine Rhythm');
zlabel('Sine Pitch');
title('3D Visualization of Synchronization with Limited Trace');
grid on;
xlim([-1.5 1.5]);
ylim([-1.5 1.5]);
zlim([-1.5 1.5]);

% Plot unit circle
theta = linspace(0, 2*pi, 100);
plot3(cos(theta), sin(theta), zeros(size(theta)), 'k--'); % Circle at z=0
view(3);

% Initialize arrays to store the trace points
traceX1 = [];
traceY1 = [];
traceZ1 = [];
traceX2 = [];
traceY2 = [];
traceZ2 = [];
traceX3 = [];
traceY3 = [];
traceZ3 = [];

% Animation loop
for k = 1:1000
    % Update trace arrays
    traceX1 = [traceX1, cos(theta1_rhythm(k))];
    traceY1 = [traceY1, sin(theta1_rhythm(k))];
    traceZ1 = [traceZ1, sin_theta1_pitch(k)];
    traceX2 = [traceX2, cos(theta2_rhythm(k))];
    traceY2 = [traceY2, sin(theta2_rhythm(k))];
    traceZ2 = [traceZ2, sin_theta2_pitch(k)];
    traceX3 = [traceX3, cos(theta3_rhythm(k))];
    traceY3 = [traceY3, sin(theta3_rhythm(k))];
    traceZ3 = [traceZ3, sin_theta3_pitch(k)];

    if length(traceX1) > traceLength
        traceX1 = traceX1(end-traceLength+1:end);
        traceY1 = traceY1(end-traceLength+1:end);
        traceZ1 = traceZ1(end-traceLength+1:end);
        traceX2 = traceX2(end-traceLength+1:end);
        traceY2 = traceY2(end-traceLength+1:end);
        traceZ2 = traceZ2(end-traceLength+1:end);
        traceX3 = traceX3(end-traceLength+1:end);
        traceY3 = traceY3(end-traceLength+1:end);
        traceZ3 = traceZ3(end-traceLength+1:end);
    end

    % Clear previous points for animation clarity
    cla;
    
    % Redraw unit circle
    plot3(cos(theta), sin(theta), zeros(size(theta)), 'k--');

    % Draw lines for the traces
    plot3(traceX1, traceY1, traceZ1, 'r-');
    plot3(traceX2, traceY2, traceZ2, 'g-');
    plot3(traceX3, traceY3, traceZ3, 'b-');

    % Optional: Pause to visualize the animation effect
    pause(0.05);
end

hold off;

