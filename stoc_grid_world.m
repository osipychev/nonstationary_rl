clc
clear all
close all
tot_time=200;
row=20;
col=30;
no_patrol=5;
A=zeros(row,col);
%% Create Obstacles
A=obstacles(A);
%% Create patrol agents
for i=1:no_patrol
    enemy(i)=patrol_agent;
    enemy(i).identity=61-i;
    if mod(i,2)==0
        enemy(i).direction='left';
    else
        enemy(i).direction='right';
    end
end
%% Place patrol agents

A(1,5)=enemy(1).identity;
A(3,col-1)=enemy(2).identity;
A(5,1)=enemy(3).identity;
A(8,col)=enemy(4).identity;
A(10,1)=enemy(5).identity;

%% Create blue agent(s)

blu = blue_agent;
blu.identity=-30;

%% Place blue agent(s)

A(row,floor(col/2))=blu(1).identity;

%% Movement of patrol 

for i=1:tot_time
    for j=1:no_patrol
     [A,enemy(j)]=patrol_rules_stoc(A,enemy(j));
    end 
    if length(find(A==blu.identity)~=0)
        A=move_blue(A,blu);
    end
    imagesc(A);
    map=[0 0 1
    1 1 1
    0 0 0
    1 0 0];
    colormap(map);
%     colormapeditor;
    pause(0.05);
    capture = capture_check(A,enemy,blu);
    if capture==1
        display('You Lost!');
        return
    elseif capture==2
        display('You Won!');
        return
    end
end

if i==tot_time
    display('Time Up!');
end
 