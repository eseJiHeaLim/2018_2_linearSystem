clc;
clear;
b=[14 13 5]
mat=[2 8 2 14; 1 6 -1 13; 2 -1 2 5]
[m,n]=size(mat)

for k=1: m-1
    for i=k+1:m
        xmult=mat(i,k)/mat(k,k)
        for j=k+1:m
            mat(i,j)=mat(i,j)-xmult*mat(k,j)
        end
        b(i)=b(i)-xmult*b(k)
    end
end


x=zeros(m,1);
x(m)=b(m)/mat(m,m)

for i=m,-1:-1:1
    sum=b(i)
    for j=i+1:m
        sum=sum-mat(i,j)*x(j)
    end
    x(i)=sum/mat(i,i)
end

%%
clear;
clc;

mat=[2 8 2 14; 1 6 -1 13; 2 -1 2 5]
[m,n]=size(mat);

for j=1:m-1
    for i=j+1:m
        xmult=mat(i,j)/mat(j,j);
        mat(i,:)=mat(i,:)-mat(j,:)*xmult;
    end
    if mat(j,j) ~= 1
        mat(j,:)=mat(j,:)/mat(j,j)
    end
end
x=zeros(1,m);
for s=m:-1:1
    c=0;
    for k=2:m
        c=c+mat(s,k)*x(k);
    end
    x(s)=(mat(s,n)-c)/mat(s,s);
end

mat
x

%%
clear;
clc;

mat=[ 0 2 1 -2;3 5 -5 1 ; 2 4 -2 2 ]
[m,n]=size(mat)

if mat(1,1)==0
   mat= flip(mat)
end


for j=1:m
    
    for i=j+1:m
        mat(i,:)=mat(i,:)-mat(j,:)*(mat(i,j)/mat(j,j));
    end
    mat(j,:)=mat(j,:)/mat(j,j);
    for i=j-1:-1:1
        mat(i,:)=mat(i,:)-mat(j,:)*(mat(i,j)/mat(j,j));
    end
    mat
end

 %%
% 
% for j=m:-1:2
%     for i=j-1:-1:1
%         mat(i,:)=mat(i,:)-mat(j,:)*(mat(i,j)/mat(j,j));
%     end
%     mat
% end

for j=1:m
    for i=j-1:-1:1
        mat(i,:)=mat(i,:)-mat(j,:)*(mat(i,j)/mat(j,j));
    end
    mat
end
% for s=1:m
%     mat(s,:)=mat(s,:)/mat(s,s);
%     x(s)=mat(s,n);
%     mat
% end
