% 清除命令窗口、工作空间和所有图形窗口
clc;
clear;
close all;

% 设定参数
a = 0.5e-3; % 内导体半径 (米)
b = 1e-3; % 内导体外径 (米)
c = 1.5e-3; % 外导体外径 (米)
I = 1; % 电流 (安培)
mu0 = 4 * pi * 1e-7; % 真空磁导率 (H/m)
mur = 6.9; % 相对磁导率
mu = mu0 * mur; % 材料的磁导率 (H/m)

% 导入仿真数据
data_B = importdata('test3_1.txt'); % 假设数据保存在test3_1.txt文件中
r_sim_B = data_B.data(:, 1) * 1e-3; % 将仿真数据中的r从毫米转换为米
B_sim = data_B.data(:, 2); % 仿真数据中的B

% 定义r的范围用于理论计算
r_theory = linspace(min(r_sim_B), max(r_sim_B), 500);

% 预分配数组
B_theory = zeros(size(r_theory));

% 计算理论磁感应强度 B
for i = 1:length(r_theory)
    r = abs(r_theory(i));
    if r < a
        B_theory(i) = (mu0 * r * I) / (2 * pi * a^2);
    elseif r >= a && r <= b
        B_theory(i) = (mu * I) / (2 * pi * r);
    elseif r > b && r <= c
        B_theory(i) = (mu0 * (c^2 - r^2) * I) / (2 * pi * r * (c^2 - b^2));
    else
        B_theory(i) = 0;
    end
end

% 绘图
figure;
hold on;
plot(r_theory * 1e3, B_theory, 'b-', 'LineWidth', 2); % 理论曲线，单位转换为毫米
scatter(r_sim_B * 1e3, B_sim, 'ro'); % 仿真散点图，用空心圆圈绘图
hold off;

% 设置图形标签和标题
xlabel('x (mm)');
ylabel('B (T)');
title('Magnetic Induction Intensity (B)');
legend('Theoretical Magnetic Induction', 'Simulated Magnetic Induction', 'Location', 'Best');
grid on;
