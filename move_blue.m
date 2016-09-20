function [ A_new ] = move_blue( A,blu )

A_new=A;
[blu_row,blu_col]=find(A==blu.identity);
A(A<0)=1;
A(blu_row,blu_col)=blu.identity;
[row,col]=size(A);
[row_obs,col_obs]=find(A==30);
obs=[row_obs,col_obs];
blu_row_old=blu_row;
blu_col_old=blu_col;

joy=jst;
side=joy(2);
up=joy(1);
%   keyboard;
sens=0.4;

if side<-sens
%         keyboard;
        if sum(ismember(obs,[blu_row blu_col-1],'rows')) || blu_col==1 %obs on left
            blu_row=blu_row_old; %stay put
            blu_col=blu_col;
        else
            blu_row=blu_row_old; %move to left
            blu_col=blu_col_old-1;
        end
%         keyboard;
elseif side>sens
        
        if sum(ismember(obs,[blu_row blu_col+1],'rows')) || blu_col==col %obs on right
        	blu_row=blu_row_old; %stay put
            blu_col=blu_col;
        else
            blu_row=blu_row_old; 
            blu_col=blu_col_old+1; %move to left
        end
            
elseif  up<-sens
           
        if sum(ismember(obs,[blu_row-1 blu_col],'rows')) || blu_row==1 %obs up            
            blu_row=blu_row_old; %stay put
            blu_col=blu_col;
%             keyboard;
        else
            blu_row=blu_row_old-1; %move up
            blu_col=blu_col_old; 
%             keyboard;
        end
elseif  up>sens
       
        if sum(ismember(obs,[blu_row+1 blu_col],'rows')) || blu_row==row %obs down
            blu_row=blu_row_old; %stay put
            blu_col=blu_col;
        else
            blu_row=blu_row_old+1; %move down
            blu_col=blu_col_old; 
        end  
    
end

A_new(blu_row_old,blu_col_old)=0;
A_new(blu_row,blu_col) = blu.identity;

