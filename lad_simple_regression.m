rng(666, 'twister');
x = (-5:5)';
N = length(x);
d = 2*x + 4*(2*rand(N,1) - 1);
% generate outlier
d(10) = 50;
% lsq
aEstimate = x'*d / (x'*x);

% lad
numIter = 10;
aLAD = aEstimate;
for k = 1:numIter
  w = 1 ./ ( abs(aLAD*x - d) + eps );
  aLAD = w' * (d.*x) / (w' * (x.^2));
end

plot(x, d, 'ko', 'MarkerFaceColor', 'k')
hold on
plot(x, aEstimate*x, 'k--', 'LineWidth', 2)
plot(x, aLAD*x, 'k-', 'LineWidth', 2)
hold off, axis square, grid on, xlabel('x')
legend('data', 'lsq fit', 'lad fit', 'location', 'Northwest')
show()
