close all;
clear all;
clc;

%% 학습 이미지 불러오기
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

%% 이미지 정규화
X= zeros(N,M);

for i=1:M
    temp=S(:,i);
    m=mean(temp);
    st=std(temp);
    Z=(temp-m)/st;
    X(:,i)=Z*128+128;
end
% 정규화된 이미지 출력
%%figure(2);

for i=1:M
    img=reshape(X(:,i),icol,irow);
    img=uint8(img');
% %     subplot(ceil(sqrt(M)),ceil(sqrt(M)),i);
  %% imshow(img);
end

%% 평균 얼굴 계산
m=mean(X,2);
% img=uint8(m);
% img=reshape(img,icol,irow);

img=reshape(m,icol,irow);
img=uint8(img');
%%figure(3);
% img = imrotate(img,-90);
%%imshow(img);
%%title('평균 얼굴','fontSize',12);

%% 평균을 빼준다
A=zeros(N,M);
for i=1:M
    A(:,i)=double(X(:,i))-m;
end

%% 공분산 행렬
L=(A'*A)/(M-1);
[V,lamda]=eig(L);
%내림차순으로 정리를 한다 by sort 함수로
[lamda,index]=sort(lamda);
Vtemp=zeros(size(V));
len=length(index);
for i=1:len
    Vtemp(:,i)=V(:,len+1-index(i));
end
V=Vtemp;

%% 행렬 C의 고유벡터들
U=[];

for i=1:size(V,2)
   U=[U (A*V(:,i))];
end

U_norm=[];
for i=1:size(U,2)
    U_norm(:,i)=U(:,i)./norm(U(:,i));
end
%% 고유벡터 보여주기
%%figure(4);
for i=1:size(U_norm,2)
    img=reshape(U_norm(:,i),icol,irow);
    img=img';
    img=histeq(img,255);
   %% subplot(ceil(sqrt(M)),ceil(sqrt(M)),i);
    %%imshow(img);
end
%% 학습 이미지를 각 eigenvrctor로 투영하여 가중치를 계산한다
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
%% 입력 이미지 불러오기
%%InputImage=input('인식할 얼굴의 번호를 입력하세요\n');
InputImage=num;

InputImage=imread(['test\' num2str(InputImage,'%03g') '.bmp']);
temp=reshape(double(InputImage)',irow*icol,1);

%입력 이미지 정규화
me=mean(temp);
st=std(temp);
Z=(temp-me)/st;
x_hat=Z*128+128;

%substarxr the mean
a_hat=x_hat-m;

%% 입력 이미지 가중치 계산
omega_h=[];
for i=1:M;
    o=dot(a_hat,U_norm(:,i));
    omega_h=[omega_h;o];
end

%% 학습 가중치와 입력 가중치 간의 거리 계산
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
% % xlabel('학습이미지','Fontsize',14);
% % ylabel('가중치간의 거리','Fontsize',15);

% 가장 가까운 얼굴을 알아냄다
[temp idx]=min(e);
disp(['이 얼굴은 ' num2str(idx),'번 얼굴입니다!'])
%%figure(5);
%%subplot(1,2,1)
%%imshow(InputImage);
% % title('입력이미지','Fontsize',15);
% % subplot(1,2,2)
% % imshow(uint8(reshape(S(:,idx),icol,irow)'));
% % title('인식된 학습이미지','Fontsize',15)

if num==idx
   cnt=cnt+1; 
end
end

disp(cnt/M*100)