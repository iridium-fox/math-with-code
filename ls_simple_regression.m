rng(666, 'twister');
x = (-5:5)';
N = length(x);
d = 2*x + 4*(2*rand(N,1) - 1);
% generate outlier
% d(10) = 20;
% lsq
aEstimate = x'*d / (x'*x);

plot(x, d, 'ko', 'MarkerFaceColor', 'k')
hold on
plot(x, aEstimate*x, 'k--', 'LineWidth', 2)
hold off, axis square, grid on, xlabel('x')
legend('data', 'fit', 'location', 'Northwest')
show()
