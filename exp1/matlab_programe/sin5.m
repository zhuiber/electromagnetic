% 清除命令窗口、工作空间和所有图形窗口
clc
clear
close all

% 定义常数和变量
epsilon_0 = 8.854e-12;  % 真空中的介电常数
% 定义两个球的半径和球心坐标
R1 = 20 / 1000;  % 第一个球半径，单位：米
R2 = 8 / 1000;   % 第二个球半径，单位：米
center1 = [0, 0, 0];    % 第一个球的球心坐标，单位：米
center2 = [10 / 1000, 0, 0];  % 第二个球的球心坐标，单位：米

% 计算体电荷密度
V_diff = 4/3*pi*R1^3 - 4/3*pi*R2^3;  % 两个球的体积差
Q_diff = 1;  % 两个球的电荷量差
rho = Q_diff / V_diff;  % 体电荷密度，单位：C/m^3

% 定义积分范围
c = 10 / 1000;  % 第二个球的球心坐标 x 分量，单位：米
b = R2;         % 第二个球的半径，单位：米
x_min = c - b;  % x轴范围下限，单位：米
x_max = c + b;  % x轴范围上限，单位：米

% 计算每个点上的电场
x_values = linspace(x_min, x_max, 1000);  % 生成 x 轴上的点
E_values = (rho / (3 * epsilon_0)) * (-1).*(center1(1) - center2(1)) * ones(size(x_values)); % 计算每个点上的电场值

% 从'text5.txt'文件导入仿真数据
a = importdata('test5.txt');  % 导入数据
data = a.data;  % 获取导入的数据

% 绘制电场强度和仿真数据的图
figure(1)
plot(x_values * 1000, E_values, 'b', 'DisplayName', 'Theoretical Electric Field');  % 绘制理论电场强度
hold on
scatter(data(:, 1), data(:, 2), 'ro', 'DisplayName', 'Simulated Data');  % 使用圆圈（o）绘制仿真值
grid on

% 设置图的标题和标签
title('Electric Field along x-axis');
xlabel('Distance from the center (mm)');
ylabel('Electric Field (N/C)');
legend('show');
