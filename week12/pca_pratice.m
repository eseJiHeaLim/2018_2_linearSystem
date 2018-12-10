x1=[2.5 0.5 2.2 1.9 3.1 2.3 2.0 1.0 1.5 1.1]';
x2=[2.4 0.7 2.9 2.2 3.0 2.7 1.6 1.1 1.6 0.9]';
x1_p=x1-mean(x1);
x2_p=x2-mean(x2);

figure(1);
plot(x1,x2,'b+');
hold on;
% plot(x1_p,x2_p,'r*')
plot([-1 4],[0 0],'k:');
plot([0 0],[-1 4],'k:');
title('Original data');
xlim([-1 4]);
ylim([-1 4]);
axis square;

figure(2);
plot(x1_p,x2_p,'b+');
hold on;
plot([-1.5 1.5],[0 0],'k:');
plot([0 0],[-1.5 1.5],'k:');
title('Data with the means substracted');
axis square;
%% 
x_p=[x1_p x2_p];
C=cov(x_p)
[E ,D]=eig(C)
temp=E(:,1);
E(:,1)=E(:,2);
E(:,2)=temp;
e_max=E(:,1)

figure (3)
plot(x_p(:,1),x_p(:,2),'b+');
hold on;
plot([-2 2 ],[0 0],'k:');
plot([0 0 ],[-2 2 ],'k:');
plot(x_p(:,1),E(2,1)/E(1,1)*x_p(:,1),'r:');
plot(x_p(:,1),E(2,2)/E(1,2)*x_p(:,1),'r:');
title('Mean adjusted data with eigenveters overlayed');
xlim([-2 2]);
ylim([-2 2]);
axis square;
%% p53 
Y_all = x_p *E;
figure(4);
plot(Y_all(:,1),Y_all(:,2),'b+');
hold on;
plot([-2 2],[0 0],'k:');
plot([0 0],[-2 2],'k:');
title('Data transform with 2 eigrnvectors')
axis square;
xlim([-2 2]);
ylim([-2 2]);

%% 
[E , Y_all_func,D]=pca([x1,x2]);

figure;
plot (Y_all(:,1),Y_all(:,2),'b+','MarkerSize',10);
hold on;
plot (Y_all_func(:,1),-Y_all_func(:,2),'r*');
plot([-2 2 ],[0 0 ],'k:');
plot ([0 0],[-2 2],'k:');
xlim([-2 2]);
ylim([-2 2]);
title('Data transform with 2 eigrnvectors');
axis square;

%%
y_pca = x_p * e_max;
figure(5);
plot(y_pca , zeros(size(y_pca)),'b+');
hold on;
plot([-2 2 ],[0 0 ],'k:');
plot ([0 0],[-2 2],'k:');
xlim([-2 2]);
ylim([-2 2]);
title('Data transform with 1 eigrnvectors');
axis square;

%%
figure(6);
plot (Y_all_func(:,1), zeros(size(y_pca)),'r*');
hold on;
title('Data transform with 1 eigrnvectors');
plot([-2 2 ],[0 0 ],'k:');
plot ([0 0],[-2 2],'k:');
xlim([-2 2]);
ylim([-2 2]);
axis square;

%%

x_p_new=y_pca * e_max';
x1_mean =mean (x1)* ones(10,1);
x2_mean =mean (x2)* ones(10,1);
x_mean=[x1_mean x2_mean];
x_hat(:,1)=x_p_new(:,1)+x1_mean;
x_hat(:,2)=x_p_new(:,2)+x2_mean;
figure(7);
plot (x_hat(:,1), x_hat(:,2),'b+');
hold on;
title('Original data restored using only a single eigenvector');
plot([-1 4 ],[0 0 ],'k:');
plot ([0 0],[-1 4],'k:');
xlim([-1 4]);
ylim([-1 4]);
axis square;
