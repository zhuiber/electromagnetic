clc;
clear;
close all;

% Parameters
adj = 2.2; % Adjustment factor (mm)
radius = (20 + adj) * 1e-3; % Radius (m)
I = 1; % Current (A)
mu = 4 * pi * 1e-7; % Permeability of free space (H/m)

% Load simulation data from TXT file
file_path = 'D:\Desktop\电磁场与电磁波第二次仿真\sim2B.txt';
data = importdata(file_path);
data = data.data;
data(:, 1) = data(:, 1) * 1e-3; % Convert mm to m

% Extract the value at z = 0 from simulation data
z_sim_zero_idx = find(data(:, 1) == 0);
if ~isempty(z_sim_zero_idx)
    B_sim_zero = data(z_sim_zero_idx, 2);
    disp(['Simulation magnetic field B at z = 0: ', num2str(B_sim_zero), ' T']);
else
    disp('No simulation data found for z = 0');
end

% Redefine parameters
radius = 22.2e-3; % Wire radius (m)

% Calculate theoretical magnetic induction B
z_theory = linspace(-10e-3, 10e-3, 1000); 
B = mu * I * radius^2 ./ (2 * (radius^2 + z_theory.^2).^1.5);

% Plot the results
figure;
plot(z_theory, B, 'b', 'LineWidth', 2); % Theoretical values
hold on;
scatter(data(:, 1), data(:, 2), 'r'); % Simulation values
grid on;

% Calculate and display the center magnetic field B
B_center = (mu * I * radius^2) / (2 * radius^3);
disp(['Center magnetic field B (theory): ', num2str(B_center), ' T']);

% Add legend
legend('Theoretical B', 'Simulation B', 'Location', 'Best');

% Add title and labels
title('Magnetic Field B along the z-axis of a Circular Wire');
xlabel('Distance along the axis (m)');
ylabel('Magnetic Field B (T)');

hold off;
