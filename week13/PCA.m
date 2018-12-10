close all;
clear all;
clc;

%% �н� �̹��� �ҷ�����
S=[];
M=25;
icol=92;
irow=112;
N=icol*irow;

for i=1:M
    img=imread(['training\' num2str(i,'%03g') '.bmp']);
    temp=reshape(img',N,1);
    temptemptemp=temp;
    temp=double(temp);
    S=[S temp];
end

%% �̹��� ����ȭ
X= zeros(N,M);

for i=1:M
    temp=S(:,i);
    m=mean(temp);
    st=std(temp);
    Z=(temp-m)/st;
    X(:,i)=Z*128+128;
end
% ����ȭ�� �̹��� ���
%%figure(2);

for i=1:M
    img=reshape(X(:,i),icol,irow);
    img=uint8(img');
% %     subplot(ceil(sqrt(M)),ceil(sqrt(M)),i);
  %% imshow(img);
end

%% ��� �� ���
m=mean(X,2);
% img=uint8(m);
% img=reshape(img,icol,irow);

img=reshape(m,icol,irow);
img=uint8(img');
%%figure(3);
% img = imrotate(img,-90);
%%imshow(img);
%%title('��� ��','fontSize',12);

%% ����� ���ش�
A=zeros(N,M);
for i=1:M
    A(:,i)=double(X(:,i))-m;
end

%% ���л� ���
L=(A'*A)/(M-1);
[V,lamda]=eig(L);
%������������ ������ �Ѵ� by sort �Լ���
[lamda,index]=sort(lamda);
Vtemp=zeros(size(V));
len=length(index);
for i=1:len
    Vtemp(:,i)=V(:,len+1-index(i));
end
V=Vtemp;

%% ��� C�� �������͵�
U=[];

for i=1:size(V,2)
   U=[U (A*V(:,i))];
end

U_norm=[];
for i=1:size(U,2)
    U_norm(:,i)=U(:,i)./norm(U(:,i));
end
%% �������� �����ֱ�
%%figure(4);
for i=1:size(U_norm,2)
    img=reshape(U_norm(:,i),icol,irow);
    img=img';
    img=histeq(img,255);
   %% subplot(ceil(sqrt(M)),ceil(sqrt(M)),i);
    %%imshow(img);
end
%% �н� �̹����� �� eigenvrctor�� �����Ͽ� ����ġ�� ����Ѵ�
Omega=[];
for h=1:size(A,2)
    ww=[];
    for i=1:size(U_norm,2)
        weightofImage=dot(A(:,h),U_norm(:,i));
        ww=[ww;weightofImage];
    end
    Omega=[Omega ww];
end

cnt=0;

for num=1:M
%% �Է� �̹��� �ҷ�����
%%InputImage=input('�ν��� ���� ��ȣ�� �Է��ϼ���\n');
InputImage=num;

InputImage=imread(['test\' num2str(InputImage,'%03g') '.bmp']);
temp=reshape(double(InputImage)',irow*icol,1);

%�Է� �̹��� ����ȭ
me=mean(temp);
st=std(temp);
Z=(temp-me)/st;
x_hat=Z*128+128;

%substarxr the mean
a_hat=x_hat-m;

%% �Է� �̹��� ����ġ ���
omega_h=[];
for i=1:M;
    o=dot(a_hat,U_norm(:,i));
    omega_h=[omega_h;o];
end

%% �н� ����ġ�� �Է� ����ġ ���� �Ÿ� ���
e=[];
for i=1:size(Omega,2)
    mag=norm(omega_h-Omega(:,i));
    e=[e mag];
end

%%figure()
kk=1:size(e,2);
% % stem(kk,e);
% % xlim([0 26]);
% % ax=gca;
% % ac.XTick=1:1:25;
% % xlabel('�н��̹���','Fontsize',14);
% % ylabel('����ġ���� �Ÿ�','Fontsize',15);

% ���� ����� ���� �˾Ƴ���
[temp idx]=min(e);
disp(['�� ���� ' num2str(idx),'�� ���Դϴ�!'])
%%figure(5);
%%subplot(1,2,1)
%%imshow(InputImage);
% % title('�Է��̹���','Fontsize',15);
% % subplot(1,2,2)
% % imshow(uint8(reshape(S(:,idx),icol,irow)'));
% % title('�νĵ� �н��̹���','Fontsize',15)

if num==idx
   cnt=cnt+1; 
end
end

disp(cnt/M*100)