% 清除命令窗口、工作空间和所有图形窗口
clc
clear
close all

% 定义常数和变量
e_0 = 8.854e-12;       % 真空中的电介质常数
R = 10 / 1000;         % 内导体半径，单位：米
b = 20 / 1000;         % 外导体内半径，单位：米
q1 = 1;                % 内导体带电，单位：C
q2 = -1;               % 外导体带电，单位：C

% 计算电介质常数
e1 = e_0 * 4.9;        % 上半部分的电介质常数
e2 = e_0 * 4;          % 下半部分的电介质常数

% 计算x轴上的电场强度
x = linspace(-30e-3, 30e-3, 1000);  % 生成等差数列从-30mm到30mm

% 计算电位移矢量
D_x = zeros(size(x));  % 初始化电位移矢量数组

% 计算 x < 0 的情况（负半轴）
mask = (x < 0) & (abs(x) >= R);
D_x(mask) = e1 * q1 ./ (2 * pi * (e1 + e2) * x(mask).^2);

% 计算 x > 0 的情况（正半轴）
mask = (x > 0) & (abs(x) >= R);
D_x(mask) = e2 * q1 ./ (2 * pi * (e1 + e2) * x(mask).^2);

% 从'test4_2.txt'文件导入数据
a = importdata('test4_2.txt');  % 导入数据
data = a.data;  % 获取导入的数据

% 绘制电场强度和电位移矢量的图
figure(1)
plot(x * 1000, D_x, 'b', 'DisplayName', 'Theoretical Electric Displacement');  % 绘制理论电位移矢量
hold on
scatter(data(:, 1), data(:, 2), 'ro', 'DisplayName', 'Simulated Data');  % 使用圆圈（o）绘制仿真值
grid on

% 设置图的标题和标签
title('Electric Displacement along x-axis');
xlabel('Distance from the center (mm)');
ylabel('Electric Displacement (C/m^2)');
legend('show');
