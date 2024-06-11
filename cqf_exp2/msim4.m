clc;
clear;
close all;

% Define parameters
a = 1e-3; % Radius of the cylinder (meters)
d = 1e-3; % Distance between the centers of the cylinders (meters)
I = 1; % Current per unit length (amperes/meter)
mu0 = 4 * pi * 1e-7; % Permeability of free space (H/m)
x_range = linspace(-0.4e-3, 0.4e-3, 500); % Range of x-axis values (meters)

% Calculate the overlap area
overlap_area = 2 * (1/3 * pi * 1e-6 - 1/4 * sqrt(3) * 1e-6);

% Calculate the current density
J = I / (pi * a^2 - overlap_area); % Current density in the cylinders

% Initialize array for magnetic induction intensity B
B = zeros(size(x_range));

% Calculate magnetic induction intensity B along the x-axis
for i = 1:length(x_range)
    x = x_range(i);
    B1 = mu0 * x * J / 2;
    B2 = mu0 * (d - x) * J / 2;
    
    % Superpose magnetic induction intensities (considering magnitude only)
    B(i) = abs(B1 + B2);
end

% Load and plot the simulation data
file_path_B = 'D:\Desktop\电磁场与电磁波第二次仿真\sim4B.txt';
data_B = importdata(file_path_B);
r_sim_B = data_B.data(:, 1) * 1e-3; % Convert r values from mm to meters
B_sim = data_B.data(:, 2);

% Plot the results
figure;
plot(x_range, B, 'b-', 'LineWidth', 5); % Theoretical results
xlabel('x (m)');
ylabel('B (T)');
title('Magnetic Induction Intensity (B) along x-axis');
hold on;
scatter(r_sim_B, B_sim, 'r'); % Simulation results
legend('Theoretical Calculation', 'Simulation Data');
grid on;
hold off;
