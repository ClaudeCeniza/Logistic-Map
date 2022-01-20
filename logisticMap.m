function time = logisticMap(dr)

r_start = 1;
r_end = 4;
r = (r_start:dr:r_end); % Range 1 <= r <= 4
length_r = length(r);
% r = linspace(1,4,100) %alternative, 100 points from 1 to 4

imax = 1000; % numnber of iterations
imax_post = 100;

x = zeros(imax, length_r);
x(1,:) = 0.5; % Initial value of seed

figure(1);
title('Logistic Map')
xlabel('r')
ylabel('x_n')
hold on;

t0 = clock; % time start

     for i = 2:imax
         x(i,:) =   r .* x(i-1,:)  .* (1 - x(i-1,:));
     end
     
     y = zeros(imax_post,length_r);
     y(1,:) = x(imax,:);
     
     for j = 2:imax_post
         y(j,:) = r .* y(j-1,:) .* (1 - y(j-1,:));
     end
     plot(r,y,'.r', 'MarkerSize',1) % display marker as dot (.), red color (r)
     
     % Overplot the curve (r-1)/r
%      z = zeros(length_r,1);
%      for idx = 1:length_r
%          z(idx) = (r(idx) - 1) / r(idx)
%      end
%      plot(r,z,'r')
     
tf = clock; % time end
time = etime(tf,t0) % total time to do the calculation
end
