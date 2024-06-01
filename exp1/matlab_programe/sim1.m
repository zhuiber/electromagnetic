% 清除命令窗口、工作空间和所有图形窗口
clc
clear
close all

% 定义常数和变量
e_0 = 8.854e-12;       % 真空中的电介质常数
e_r = 3.9;             % 介质相对电容率
r_s = 10 / 1000;       % 球的半径（单位：米）
C = 1;                 % 球的电荷
dens = C / (4 / 3 * pi * r_s^3);  % 计算电荷密度

% 计算球内部电场强度和电势的分布
x = linspace(0, r_s, 101);  % 生成等差数列从0到r_s

% 修改球内部电场强度的计算公式
e_field = x * dens / (3 * e_0 * e_r);  % 球内部电场强度

potential = dens / (2 * e_0 * e_r) * (r_s^2 - x.^2 / 3);  % 球内部电势

% 计算球外部电场强度和电势的分布
x2 = linspace(r_s, r_s * 4, 101);  % 生成等差数列从r_s到r_s*4
e_field2 = dens * r_s^3 ./ (3 * e_0 .* x2.^2);  % 球外部电场强度
potential2 = dens * r_s^3 ./ (3 * e_0 .* x2);  % 球外部电势

% 绘制电场强度的图
figure(1)
scatter(x * 1000, e_field, 'r', 'x');  % 在球内部绘制电场强度的散点图
hold on
scatter(x2 * 1000, e_field2, 'r');  % 在球外部绘制电场强度的散点图

% 从'test1.txt'文件导入数据并绘制
a = importdata('test1.txt');  % 导入数据
data = a.data;  % 获取导入的数据
plot(data(:, 1), data(:, 2));  % 绘制导入的数据

% 设置图例、标题和标签
legend('Internal Field', 'External Field', 'Simulation Data');
title('Electric Field Distribution');
xlabel('Distance (mm)');
ylabel('Electric Field (V/m)');
