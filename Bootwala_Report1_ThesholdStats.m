% Ali Bootwala
% Lab Report #1: Stimulation Thresholds and Stats
% 9/13/2013
%% Initialize Workspace
clear; clc
%% Data: cells chosen were cell # 488, 543, 676, 1148
data = [97.5, 54; 97.5, 53; 95, 52; 24, 9.7];
SDur = data(:,1);
LDur = data(:,2);
Tops = [LDur(3:4); SDur(3:4)];
Bots = [LDur(1:2); SDur(1:2)];
%% Statistics: Top Cells vs. Bottom Cells
% H_0 : The mean of the Top Cells Stim Thresholds
% are equal to the mean of the Bottom Cells Stim
% Thresholds
% H_1 : mean of Top unequal to Mean of Bottom
Topcellmean = mean(Tops)
Topstd = std(Tops)
Botcellmean = mean(Bots)
Botstd = std(Bots)
[h_tb, p_tb, ci_tb, z_tb] = ttest2(Bots, Tops, 0.05)

%% Stats: Long Dur Thresh vs. Short Dur Thresh
Smean = mean(SDur)
Sstd = std(SDur)
Lmean = mean(LDur)
Lstd = std(LDur)
[h_sl, p_sl, ci_sl, z_sl] = ttest2(SDur, LDur, 0.05)

%% Disregarding the fourth cell due to it being an exteme outlier 
data2 = data(1:3, :);
SD2 = data2(:,1);
LD2 = data2(:,2);
Tops2 = [LD2(3), SD2(3)];
Bots2 = [LD2(1:2); SD2(1:2)];
% Stats: Top vs. Bot
Topcellmean2 = mean(Tops2)
Topstd2 = std(Tops2)
Botcellmean2 = mean(Bots2)
Botstd2 = std(Bots2)
[h_tb2, p_tb2, ci_tb2, z_tb2] = ttest2(Bots2, Tops2, 0.05)
% Stats: Long vs. Short
Smean2 = mean(SD2)
Sstd2 = std(SD2)
Lmean2 = mean(LD2)
Lstd2 = std(LD2)
[h_sl2, p_sl2, ci_sl2, z_sl2] = ttest2(SD2, LD2, 0.05)

%% Plots demonstrating ttests
x = linspace(-50, 200, 300);
Toppdf = 1./sqrt(2*pi*Topstd2^2).*exp(-(x-Topcellmean2).^2./(2*Topstd2^2));
Botpdf = 1./sqrt(2*pi*Botstd2^2).*exp(-(x-Botcellmean2).^2./(2*Botstd2^2));
%
figure(1);clf
plot(x, Toppdf, 'k-', x, Botpdf, 'k--')
title('Paired t-test of Stimulus Threshold Distribution for Top Cells and Bottom Cells')
legend('Top Cells Dist', 'Bottom Cell Dist', 0)
xlabel('Threshold Stimulus (nA)')
ylabel('Probability')
axis([-50 200 0 0.016])
print -djpeg TTESTTOPBOTTOM

Spdf = 1./sqrt(2*pi*Sstd2^2).*exp(-(x-Smean2).^2./(2*Sstd2^2));
Lpdf = 1./sqrt(2*pi*Lstd2^2).*exp(-(x-Lmean2).^2./(2*Lstd2^2));
figure(2);clf
plot(x, Spdf, 'k-', x, Lpdf, 'k--')
title('Paired t-test of Stim Threshold Dist for Short Dur vs. Long Dur Stimulus')
legend('Short Duration Dist', 'Long Duration Dist', 0)
xlabel('Threshold Stimulus (nA)')
ylabel('Probability')
axis([40 110 0 0.4])
print -djpeg TTESTLONGSHORT
