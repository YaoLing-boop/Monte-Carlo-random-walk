clear
N = 1e4;   % Total steps
r = 500; % Total runs
e1 = zeros(1,r);
e2 = zeros(1,r);
x = zeros(1,N);
y = zeros(1,N);
for j = 1:1:r
    tic
    x = xvector(N);
    e1(1,j) = toc; 
end

for k = 1:1:r
    tic
    y = xloop(N);
    e2(1,k) = toc;
end

plot(1:1:r,e2)
hold on
plot(1:1:r,e1)
hold off
xlabel('Run Count')
ylabel('Allocated Time (s)')
title(['1D Monte Carlo Random Walk for N = ',num2str(N),' Steps'])

%% Function Section

function loop = xloop(N)
    loop = zeros(length(N));
    for i = 1:1:N-1
        if rand > 0.5
            loop(i+1) = loop(i)+1; 
        else
            loop(i+1) = loop(i)-1;
        end
    end
end
function vector = xvector(N)
    prob = 0.5;
    random = rand(1,N);
    steps = 2*(random>= prob) - 1;
    vector = cumsum(steps);
end
