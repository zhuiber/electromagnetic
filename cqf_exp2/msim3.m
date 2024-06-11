clc;
clear;
close all;

% Parameters
a = 0.5e-3; % Inner conductor radius (meters)
b = 1e-3; % Inner conductor outer radius (meters)
c = 1.5e-3; % Outer conductor outer radius (meters)
I = 1; % Current (amperes)
adj = 2.2;
mu0 = 4 * pi * 1e-7; % Permeability of free space (H/m)
mur = 4 + adj; % Relative permeability
mu = mu0 * mur; % Material permeability (H/m)

% Define r range for theoretical calculation
r_theory = linspace(-c, c, 500);

% Pre-allocate arrays
H_theory = zeros(size(r_theory));
B_theory = zeros(size(r_theory));

% Calculate theoretical H and B
for i = 1:length(r_theory)
    r = abs(r_theory(i));
    if r < a
        H_theory(i) = (I * r) / (2 * pi * a^2);
        B_theory(i) = mu0 * H_theory(i);
    elseif r >= a && r <= b
        H_theory(i) = I / (2 * pi * r);
        B_theory(i) = mu * H_theory(i);
    elseif r > b && r <= c
        H_theory(i) = (I * (c^2 - r^2)) / (2 * pi * r * (c^2 - b^2));
        B_theory(i) = mu0 * H_theory(i);
    else
        H_theory(i) = 0;
        B_theory(i) = 0;
    end
end

% Plotting
figure;

% Plot H
subplot(2, 1, 1);
hold on;
plot(r_theory * 1e3, H_theory, 'b', 'LineWidth', 2);
xlabel('r (mm)');
ylabel('H (A/m)');
title('Magnetic Field Intensity H');

% Read and plot simulation data for H
file_path_H = 'D:\Desktop\电磁场与电磁波第二次仿真\sim3H.txt';
data_H = importdata(file_path_H);
r_sim_H = data_H.data(:, 1) * 1e-3; % Convert r values from mm to meters
H_sim = data_H.data(:, 2);
scatter(r_sim_H * 1e3, H_sim, 'r');
grid on;
legend('Theoretical Calculation', 'Simulation Data');
hold off;

% Plot B
subplot(2, 1, 2);
hold on;
plot(r_theory * 1e3, B_theory, 'b', 'LineWidth', 2);
xlabel('r (mm)');
ylabel('B (T)');
title('Magnetic Induction B');

% Read and plot simulation data for B
file_path_B = 'D:\Desktop\电磁场与电磁波第二次仿真\sim3B.txt';
data_B = importdata(file_path_B);
r_sim_B = data_B.data(:, 1) * 1e-3; % Convert r values from mm to meters
B_sim = data_B.data(:, 2);
scatter(r_sim_B * 1e3, B_sim, 'r');
grid on;
legend('Theoretical Calculation', 'Simulation Data');
hold off;
