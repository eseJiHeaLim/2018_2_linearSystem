function result=JiHea_rref (mat)
    % gauss jordan elimination function
    [m,n]=size(mat);
    % 0이 맨위인 경우 0을 나눌수가 없으므로 뒤집어줌
    if mat(1,1)==0
        mat= flip(mat)
    end
    
    for j=1:m
        for i=j+1:m
            xmult=mat(i,j)/mat(j,j);
            mat(i,:)=mat(i,:)-(mat(j,:)*xmult);
        end
        
        mat(j,:)=mat(j,:)/mat(j,j);
        
        for k=j-1:-1:1
            mat(k,:)=mat(k,:)-mat(j,:)*(mat(k,j)/mat(j,j));
        end
        mat
    end
    
    result= mat;
end
