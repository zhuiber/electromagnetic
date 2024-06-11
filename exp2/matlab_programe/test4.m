% 清除命令窗口、工作空间和所有图形窗口
clc;
clear;
close all;

% 参数设定
I = 1; % 电流 (安培)
mu0 = 4 * pi * 1e-7; % 真空磁导率 (H/m)
d = 1e-3; % 圆柱之间的距离 (米)
a = 0.5e-3; % 圆柱的半径 (米)

J = I./((pi/3+0.5*(3)^(1/2))*10^(-3));

% 导入仿真数据
data_B = importdata('test4.txt'); % 假设数据保存在test4.txt文件中
x_sim_B = data_B.data(:, 1) * 1e-3; % 将仿真数据中的x从毫米转换为米
B_sim = data_B.data(:, 2); % 仿真数据中的B

% 定义x的范围用于理论计算
x_theory = linspace(-0.4e-3, 0.4e-3, 500);

% 计算理论磁感应强度 B
B_theory = zeros(size(x_theory));

% 计算理论磁感应强度 B
for i = 1:length(x_theory)
    x = x_theory(i);
    % 计算磁感应强度
    B_theory(i) = (mu0 *J) /2;
end

% 绘图
figure;
hold on;
plot(x_theory * 1e3, B_theory, 'b-', 'LineWidth', 2); % 理论曲线，单位转换为毫米
scatter(x_sim_B * 1e3, B_sim, 'ro'); % 仿真散点图，用红色圆圈绘图
hold off;

% 设置图形标签和标题
xlabel('x (mm)');
ylabel('B (T)');
title('Magnetic Induction Intensity (B) on the x-axis');
legend('Theoretical Magnetic Induction', 'Simulated Magnetic Induction', 'Location', 'Best');
grid on;
