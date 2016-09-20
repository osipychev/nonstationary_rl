function [ flag ] = capture_check( A,enemy,blu )

[dum_a size_red]=size(enemy);
[dum_b size_blu]=size(blu);
flag=0;


for i=1:size_red
    for j=1:size_blu
        [red_x red_y]=find(A==enemy(i).identity);
        [blu_x blu_y]=find(A==blu(j).identity);
        if length(blu_x)==0 && length(blu_y)==0 || length(red_x)==0 && length(red_y)==0
          	flag=1 ;           
        end 
    end
      
end


[main_blu_row main_blu_col]=find(A==blu(1).identity);
if main_blu_row==1
    flag=2;
end

end

