function [ B ] = obstacles( A )
[row,col]=size(A);
for i=1:row
    for j=1:col
        if (mod(i+j,3)==0) && mod(j,3)==0
            B(i,j)=30;
        else
            B(i,j)=0;
        end
    end
end

B(1,10)=30;
B(2,10)=30;
B(5,17)=30;
B(10,10)=30;
B(8,10)=30;
B(7,10)=30;
end

