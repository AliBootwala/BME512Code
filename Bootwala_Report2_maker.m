% Lab Report 2 Script
% Ali Bootwala
% Sakai Assignment 2
%% initialize Workspace
clear;clc
%% load variables
load('Vmap_tr1_t2000ms.txt');
cells = Vmap_tr1_t2000ms(:,1);
Vm = Vmap_tr1_t2000ms(:,2);
load('cell0_40nA.txt')
time = cell0_40nA(:,1);
Volt = cell0_40nA(:,4);

%% formatting matrix
Vmap = zeros(30,40);
r = 0;
for n = 1:1200
    c = mod(cells(n),40)+1;
    if c == 1
        r = r+1;
    end
    Vmap(r,c) = Vm(n);
end

x = 0:39;
y = 0:29;
%%
figure(1);clf
[C,h] = contourf(x,y,Vmap);
xlabel('horizontal cells')
ylabel('vertical cells')
title('Voltage map at time 2.0 msec')
clabel(C, h, 0:-40:-80, 'Color', 'w', 'LabelSpacing', 48,...
        'Rotation', 0)
colorbar
text(5,25,...
        {'Ali H. Bootwala';'Map taken at time t = 2.0msec'},...
        'HorizontalAlignment', 'left',...
        'BackgroundColor', [1,1,1],...
        'FontSize', 10)
print -djpeg Vmaptime2ms

%%
xl = 2.*ones(1,100);
yl = linspace(-100, 40,100);
figure(2);clf
plot(time, Volt, 'b', 'LineWidth', 2)
hold on
plot(xl,yl, 'r', 'LineWidth', 1.5)
grid on
xlabel('Time (msec)')
ylabel('V_m (mV)')
title('Cell 0 Membrane Voltage after 40nA stim for 0.4msec duration')
text(2.1, -35, '\leftarrow Map taken at t = 2msec',...
        'HorizontalAlignment', 'left',...
        'BackgroundColor', [0.3, 0.6, 0.7],...
        'FontSize', 10)
print -djpeg Cell0Volt
%% Finding and plotting Intracellular cuurent
I_D = -(diff(Vmap)./4000).*10^3; %nA
u_d = zeros(size(I_D));
[xd, yd] = meshgrid(0:39, 1:29);
I_L = -(diff(Vmap,1,2)./2000).*10^3; %nA
v_l = zeros(size(I_L));
[xl, yl] = meshgrid(0:38, 0:29);
%%
r = 30;
Vmapflip = zeros(size(Vmap));
for row = 1:30
    Vmapflip(row,:) = Vmap(r,:);
    r = r-1;
end
I_U = -(diff(Vmapflip)./4000).*10^3; %nA
u_u = zeros(size(I_U));
[xu, yu] = meshgrid(39:-1:0, 28:-1:0);
I_R = -(diff(Vmapflip,1,2)./2000).*10^3; %nA
v_r = zeros(size(I_R));
[xr, yr] = meshgrid(39:-1:1, 29:-1:0);
%%
figure(3);clf
[C1, h1] = contourf(x,y,Vmap); hold on
quiver(xd, yd, u_d, I_D,'w');
quiver(xl, yl, I_L, v_l, 'w')
%quiver(xu, yu, u_u, I_U, 'g')
%quiver(xr, yr, I_R, v_r, 'k')
axis([0 39 0 29])
xlabel('Horizontal Cells'); ylabel('Vertical Cells')
title('Intracellular Current at Time 2.0msec')
print -djpeg CellSheetIntraCurr
%%
figure(4);clf
subplot(1,2,1)
[C2, h2] = contourf(x,y,Vmap); hold on
quiver(xd, yd, u_d, I_D,'w');
quiver(xl, yl, I_L, v_l, 'w')
axis([0 7 0 6])
xlabel('Horizontal Cells'); ylabel('Vertical Cells')
title('Current near Left Stimulation Cell')
subplot(1,2,2)
[C3, h3] = contourf(x,y,Vmap); hold on
quiver(xd, yd, u_d, I_D,'w');
quiver(xl, yl, I_L, v_l, 'w')
axis([32 39 0 5.5])
xlabel('Horizontal Cells'); ylabel('Vertical Cells')
title('Current near Right Stimulation Cell')
print -djpeg ZoomIntraCurr 