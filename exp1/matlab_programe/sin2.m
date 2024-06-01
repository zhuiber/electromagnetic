% 清除命令窗口、工作空间和所有图形窗口
clc
clear
close all

% 定义常数和变量
e_0 = 8.854e-12;       % 真空中的电介质常数
R = 10 / 1000;         % 圆盘的半径（单位：米）
Q = 3.9;               % 圆盘上的总电荷（单位：库仑）

% 计算圆盘上的电荷密度
sigma_s = Q / (pi * R^2);

% 计算z轴上的电场强度
z = linspace(0e-3, 50e-3, 1000);  % 生成等差数列从0mm到50mm
E_z = sigma_s / (2 * e_0) * (1 - abs(z) ./ sqrt(z.^2 + R^2));

% 从'test2.txt'文件导入数据
a = importdata('test2.txt');  % 导入数据
data = a.data;  % 获取导入的数据

% 绘制电场强度的图
figure(1)
plot(z * 1000, E_z, 'b', 'DisplayName', 'Calculated');  % 绘制计算得到的电场强度
hold on
plot(data(:, 1), data(:, 2), 'ro', 'DisplayName', 'Simulated');  % 使用圆圈（o）绘制仿真值
grid on

% 设置图的标题和标签
title('Electric Field Along z-axis');
xlabel('Distance from Disk Center (mm)');
ylabel('Electric Field (V/m)');
legend('show');
