A=[0.7 0.1 0 ; 0.2 0.9 0.2 ; 0.1 0 0.8]
% ���� �Ի��� ���� transpose?���ĺ� ����?,,,,,,,,,,
x=[25 20 55]'
y=A*x
z=A*y
u=A*z
t=[2009 ,2014, 2019]
%%
hold on;
box on;
plot(t,y,'b-o')
plot(t,z,'r-o')
plot(t,u,'k-o')
xlabel('year')
ylabel('C.I.R')
legend('2009','2014','2019')

%%
hold on;
plot(t,[x(1) x(1) x(1)])
plot(t,[x(2) x(2) x(2)])
plot(t,[x(3) x(3) x(3)])

plot(t,[x(1) y(1) z(1) u(1)])
plot(t,[x(1) y(1) z(1) u(1)]) % 2�� �ٲ���� 
plot(t,[x(1) y(1) z(1) u(1)]) %�ִ� 3���� �ٲٰ�

