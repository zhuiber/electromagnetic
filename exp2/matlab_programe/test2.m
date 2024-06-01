% 清除命令窗口、工作空间和所有图形窗口
clc;
clear;
close all;

% 设定参数
R = 22.9e-3; % 导线半径 (米)
I = 1; % 电流 (安培)
mu = 4 * pi * 1e-7; % 真空磁导率 (H/m)

% 导入仿真数据
data = importdata('test2.txt'); % 导入数据
z_sim = data.data(:, 1) * 1e-3; % 将仿真数据中的z从毫米转换为米
B_sim = data.data(:, 2); % 仿真数据中的B

% 定义z的范围用于理论计算
z_theory = linspace(min(z_sim), max(z_sim), 500);

% 计算理论磁感应强度沿轴的分布
B_theory = zeros(size(z_theory));

for i = 1:length(z_theory)
    z = z_theory(i);
    if z == 0
        B_theory(i) = mu * I / (2 * R); % 轴上z=0处的磁感应强度
    else
        B_theory(i) = (mu * I * R^2) / (2 * (R^2 + z^2)^(3/2)); % 轴上z处的磁感应强度
    end
end

% 绘图
figure;
hold on;
plot(z_theory * 1e3, B_theory, 'b-', 'LineWidth', 2); % 理论曲线，单位转换为毫米
scatter(z_sim * 1e3, B_sim, 'ro'); % 仿真散点图，用空心圆圈绘图
hold off;

% 设置图形标签和标题
xlabel('z (mm)');
ylabel('B (T)');
title('Magnetic Induction Intensity along the Axis');
legend('Theoretical Magnetic Induction', 'Simulated Magnetic Induction', 'Location', 'Best');

grid on;
