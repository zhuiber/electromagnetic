% 清除命令窗口、工作空间和所有图形窗口
clc
clear
close all

% 定义常数和变量
e_0 = 8.854e-12;       % 真空中的电介质常数
e_r = 4;               % 同心介质球壳的相对介电常数
R = 10 / 1000;         % 理想导体小球的半径（单位：米）
Q = 1;                 % 理想导体小球上的总电荷（单位：库仑）

% 计算相对介电常数下的电介质常数
e = e_0 * e_r;

% 计算x轴上的电场强度
x = linspace(0, 50e-3, 1000);  % 生成等差数列从0到50mm

% 对于 r < R 的情况，电场为0
E_x = zeros(size(x));

% 对于 R <= r < b 的情况
mask = (x >= R);
E_x(mask) = Q / (4 * pi * e) * 1 ./ (x(mask).^2);

% 对于 r >= b 的情况
b = 49 / 1000;  % 外套的半径，单位从mm转换为m
mask = (x >= b);
E_x(mask) = Q / (4 * pi * e_0) * 1 ./ (x(mask).^2);  % 在空气中的电场强度

% 从'test3.txt'文件导入数据
a = importdata('test3.txt');  % 导入数据
data = a.data;  % 获取导入的数据

% 绘制电场强度的图
figure(1)
plot(x * 1000, E_x, 'b', 'DisplayName', 'Electric Field');  % 绘制电场强度
hold on
scatter(data(:, 1), data(:, 2), 'ro', 'DisplayName', 'Simulated Data');  % 使用圆圈（o）绘制仿真值
grid on

% 设置图的标题和标签
title('Electric Field along x-axis');
xlabel('Distance from Ball Center (mm)');
ylabel('Electric Field (V/m)');
legend('show');
