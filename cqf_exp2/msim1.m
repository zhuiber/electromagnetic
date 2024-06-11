clc;
clear;
close all;

mu0 = 4 * pi * 1e-7;  % Permeability of free space
R_in = 1e-3;          % Inner radius, meters
R_out = 1.5e-3;       % Outer radius, meters
adj = 2.2;            % Current adjustment factor
I = 1 + adj;          % Current, amperes

% Calculate current density
A = pi * (R_out^2 - R_in^2);  % Cross-sectional area
J = I / A;                    % Current density

% Define points on the x-axis
x = linspace(-10e-3, 10e-3, 1000);  % x-axis coordinates, meters

% Calculate the magnitude of the magnetic field B on the x-axis
B = zeros(size(x));
for k = 1:length(x)
    r = abs(x(k));  % Distance from the z-axis
    if r < R_in
        B(k) = 0;  % No magnetic field inside
    elseif r < R_out
        I_enc = J * pi * (r^2 - R_in^2);  % Enclosed current in the loop
        B(k) = (mu0 * I_enc) / (2 * pi * r);  % Ampere's law
    else
        B(k) = (mu0 * I) / (2 * pi * r);  % Enclosing the entire current
    end
end

% Plot
figure;
plot(x * 1e3, B, 'b--', 'LineWidth', 2);  % Convert x-axis to millimeters
xlabel('x (mm)');
ylabel('B (T)');
title('Magnetic field B on the x-axis');
hold on;

% Import data file
a = importdata('D:\Desktop\电磁场与电磁波第二次仿真\sim1B.txt');
data = a.data;
scatter(data(:,1), data(:,2), 'r');

legend('Theoretical calculation', 'Simulation data');
hold off;
grid on;
