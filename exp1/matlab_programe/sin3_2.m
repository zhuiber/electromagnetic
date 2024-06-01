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

% 计算x轴上的电位移矢量
x = linspace(0, 50e-3, 1000);  % 生成等差数列从0到50mm

% 对于 r < R 的情况，电位移矢量为0
D_x = zeros(size(x));

% 对于 R <= r < b 的情况
mask = (x >= R);
D_x(mask) = Q / (4 * pi) * 1 ./ (x(mask).^2);


% 从'test3_2.txt'文件导入数据
a = importdata('test3_2.txt');  % 导入数据
data = a.data;  % 获取导入的数据

% 绘制电位移矢量的图
figure(1)
plot(x * 1000, D_x, 'b', 'DisplayName', 'Electric Displacement');  % 绘制电位移矢量
hold on
scatter(data(:, 1), data(:, 2), 'ro', 'DisplayName', 'Simulated Data');  % 使用圆圈（o）绘制仿真值
grid on

% 设置图的标题和标签
title('Electric Displacement along x-axis');
xlabel('Distance from Ball Center (mm)');
ylabel('Electric Displacement (C/m^2)');
legend('show');
