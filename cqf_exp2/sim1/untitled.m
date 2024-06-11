mu0 = 4 * pi * 1e-7;  % 真空磁导率
R_in = 1e-3;          % 内半径，米
R_out = 1.5e-3;       % 外半径，米
adj = 2.2;            % 电流调整因子
I = 1 + adj;          % 电流，安培

% 计算电流密度
A = pi * (R_out^2 - R_in^2);  % 横截面积
J = I / A;                    % 电流密度

% 定义x轴上的点
x = linspace(-10e-3, 10e-3, 1000);  % x轴坐标，米

% 计算x轴上磁场B的大小
B = zeros(size(x));
for k = 1:length(x)
    r = abs(x(k));  % 距离z轴的距离
    if r < R_in
        B(k) = 0;  % 内部没有磁场
    elseif r < R_out
        I_enc = J * pi * (r^2 - R_in^2);  % 环路包围的电流
        B(k) = (mu0 * I_enc) / (2 * pi * r);  % 安培环路定律
    else
        B(k) = (mu0 * I) / (2 * pi * r);  % 包围整个电流
    end
end

% 绘图
figure;
plot(x * 1e3, B, 'b--', 'LineWidth', 2);  % x轴转换为毫米
xlabel('x (mm)');
ylabel('B (T)');
title('x轴上的磁场 B');
hold on;

% 导入数据文件
a = importdata('D:\Desktop\电磁场与电磁波第二次仿真\sim1B.txt');
data = a.data;
scatter(data(:,1), data(:,2), 'r');
legend('Calculated', 'Simulated'); % Modify legend labels

hold off;
grid on;