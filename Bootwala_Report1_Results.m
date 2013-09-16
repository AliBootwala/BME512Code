% Ali Bootwala
% Lab Report 1: Proof of Random Sampling
% 9/13/2013
%% Initialize workspace
clear; clc
global cellchoices
%% Make many many draws
testfunc = 0;
for c = 1:600
    Bootwala_RandomSampling
    if length(testfunc) == 1
        testfunc = cellchoices;
        clear('cellchoices')
    else
        testfunc = horzcat(testfunc, cellchoices);
        clear('cellchoices')
    end
end
%%
testfunc = sort(testfunc);
yax = 1/(600*599)*ones(size(testfunc));


binranges = 0:120:1200;
bincounts = histc(testfunc, binranges);
n.sd = std(bincounts(1:10));
n.mn = mean(bincounts(1:10));
err = n.sd*ones(size(bincounts(1:10)));
%%
figure(1);clf
subplot(2,1,1)
bar(binranges, bincounts, 'histc')
hold on
errorbar((binranges(2:11)-60),bincounts(1:10), err, 'LineStyle', 'none', 'color','k', 'LineWidth', 2.0);
line(0:binranges(end), n.mn*ones(1,binranges(end)+1),'color', 'k', 'LineWidth', 1.5)
xlabel('Bin Number')
ylabel('Choice Probability')
legend
grid on
subplot(2,1,2)
plot(testfunc, yax, 'ko')
grid on
xlabel('Cell Choice')
ylabel('Probability')
axis([0 1200 0 1e-5])
print -djpeg proofuniformdist
% fingers crossed
