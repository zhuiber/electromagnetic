% 清除命令窗口、工作空间和所有图形窗口
clc;
clear;
close all;

% 设定参数
a = 1e-3; % 内半径 (米)
b = 1.5e-3; % 外半径 (米)
I = 3.9; % 电流 (安培)
mu = 4 * pi * 1e-7; % 真空磁导率 (H/m)

% 导入仿真数据
data = importdata('test1.txt'); % 导入数据
r_sim = data.data(:, 1) * 1e-3; % 将仿真数据中的r从毫米转换为米
B_sim = data.data(:, 2); % 仿真数据中的B

% 定义r的范围用于理论计算
r_theory = linspace(min(r_sim), max(r_sim), 500);

% 计算理论磁感应强度
B_theory = zeros(size(r_theory));

for i = 1:length(r_theory)
    r = abs(r_theory(i));
    if r <= a
        B_theory(i) = 0;
    elseif r > a && r <= b
        B_theory(i) = ((r^2 - a^2) / (b^2 - a^2)) * (mu * I / (2 * pi * r));
    else
        B_theory(i) = mu * I / (2 * pi * r);
    end
end

% 绘图
figure;
hold on;
plot(r_theory * 1e3, B_theory, 'b-', 'LineWidth', 2); % 理论曲线，单位转换为毫米
scatter(r_sim * 1e3, B_sim, 'ro'); % 仿真散点图，用空心圆圈绘图
hold off;

% 设置图形标签和标题
xlabel('r (mm)');
ylabel('B (T)');
title('Magnetic Induction Intensity');
legend('Theoretical Magnetic Induction', 'Simulated Magnetic Induction', 'Location', 'Best');


grid on;
