function [ A_new,pat ] = patrol_rules_stoc( A,pat) 

A_new=A;
[enemy_row,enemy_col]=find(A==pat.identity);
A(A>1)=1;
A(enemy_row,enemy_col)=pat.identity;
[row,col]=size(A);
[row_obs,col_obs]=find(A==1);
obs=[row_obs,col_obs];
dir=pat.direction;
enemy_row_old=enemy_row;
enemy_col_old=enemy_col;

move_up=0;
move_down=0;
move_left=0;
move_right=0;

random_prob = rand;

%% Preferred policy
if random_prob<0.75
if strcmp(dir,'left')
    if enemy_col == 1  %reached leftmost point 
        dir='right';
        enemy_col=enemy_col;
    elseif sum(ismember(obs,[enemy_row enemy_col-1],'rows')) %obstacle on left        
        if ~sum(ismember(obs,[enemy_row-1 enemy_col],'rows')) && (enemy_row ~= 1) %look up, hurray!
            enemy_row=enemy_row-1; %move up
            move_up=1;
        elseif ~sum(ismember(obs,[enemy_row+1 enemy_col],'rows')) && (enemy_row ~= row) %look down, hurray!
            enemy_row=enemy_row+1; %move down
            move_down=1;
        elseif ~sum(ismember(obs,[enemy_row enemy_col+1],'rows')) && (enemy_col ~= col) %look right, hurray!
            enemy_col=enemy_col+1;%move right
            dir='right';
            move_right=1;
        else
            enemy_col=enemy_col; %stay put, huh!
            enemy_row=enemy_row;
        end 
    else
        enemy_col=enemy_col-1;
    end 
end


if strcmp(dir,'right')
    if enemy_col == col  %reached rightmost point 
        dir='left';
        enemy_col=enemy_col;
    elseif sum(ismember(obs,[enemy_row enemy_col+1],'rows')) %obstacle on right      
        if ~sum(ismember(obs,[enemy_row-1 enemy_col],'rows')) && (enemy_row ~= 1) %look up, hurray!
            enemy_row=enemy_row-1; %move up
            move_up=1;
        elseif ~sum(ismember(obs,[enemy_row+1 enemy_col],'rows')) && (enemy_row ~= row) %look down, hurray!
            enemy_row=enemy_row+1; %move down
            move_down=1;
        elseif ~sum(ismember(obs,[enemy_row enemy_col-1],'rows')) && (enemy_col ~= col) %look left, hurray!
            enemy_col=enemy_col-1;%move left
            move_left=1;
            dir='left';
        else
            enemy_col=enemy_col; %stay put, huh!
            enemy_row=enemy_row;
        end
    else
        enemy_col=enemy_col+1;
        move_right=1;
    end 
end
% keyboard;
end



%% Stochasticity
if random_prob>=0.75
    
if strcmp(dir,'left')
    if enemy_col == 1  %reached leftmost point 
        dir='right';
        enemy_col=enemy_col;
    elseif sum(ismember(obs,[enemy_row enemy_col-1],'rows')) %obstacle on left        
        
        if ~sum(ismember(obs,[enemy_row enemy_col+1],'rows')) && (enemy_col ~= col) %look right, hurray!
            enemy_col=enemy_col+1;%move right
            dir='right';
            move_right=1;
        elseif ~sum(ismember(obs,[enemy_row-1 enemy_col],'rows')) && (enemy_row ~= 1) %look up, hurray!
            enemy_row=enemy_row-1; %move up
            move_up=1;
        elseif ~sum(ismember(obs,[enemy_row+1 enemy_col],'rows')) && (enemy_row ~= row) %look down, hurray!
            enemy_row=enemy_row+1; %move down
            move_down=1;
        
        else
            enemy_col=enemy_col; %stay put, huh!
            enemy_row=enemy_row;
        end 
    else
        enemy_col=enemy_col-1;
    end 
end


if strcmp(dir,'right')
    if enemy_col == col  %reached rightmost point 
        dir='left';
        enemy_col=enemy_col;
    elseif sum(ismember(obs,[enemy_row enemy_col+1],'rows')) %obstacle on right      
        if ~sum(ismember(obs,[enemy_row enemy_col-1],'rows')) && (enemy_col ~= col) %look left, hurray!
            enemy_col=enemy_col-1;%move left
            move_left=1;
            dir='left';
        elseif ~sum(ismember(obs,[enemy_row-1 enemy_col],'rows')) && (enemy_row ~= 1) %look up, hurray!
            enemy_row=enemy_row-1; %move up
            move_up=1;
        elseif ~sum(ismember(obs,[enemy_row+1 enemy_col],'rows')) && (enemy_row ~= row) %look down, hurray!
            enemy_row=enemy_row+1; %move down
            move_down=1;
        
        else
            enemy_col=enemy_col; %stay put, huh!
            enemy_row=enemy_row;
        end
    else
        enemy_col=enemy_col+1;
        move_right=1;
    end 
end
% keyboard;
end

%% Final movement
pat.direction=dir;
A_new(enemy_row_old,enemy_col_old)=0;
A_new(enemy_row,enemy_col) = pat.identity;

end

