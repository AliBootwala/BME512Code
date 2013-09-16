% Ali H. Bootwala
% Lab Report 1: Threshold Stimulus response Graphs
% 9/13/2013
%% Initialize Workspace
clear; clc
%% Vectors
c48802=load('c488_0p2ms_97p5nA.txt');
c48805=load('c488_0p5ms_53nA.txt');
c54302=load('c543_0p2ms_97p5nA.txt');
c54305=load('c543_0p5ms_53nA.txt');
c67602=load('c676_0p2ms_95nA.txt');
c67605=load('c676_0p5ms_53nA.txt');
c114802=load('c1148_0p2ms_24nA.txt');
c114805=load('c1148_0p5ms_09p7nA.txt');
%%
figure(1);clf
subplot(2,1,1)
plot(c48802(:,1), 97.5.*c48802(:,2), 'k')
title('Cell 1 Short Duration')
axis([0 4 0 100])
ylabel('Current (nA)')
subplot(2,1,2)
plot(c48802(:,1),c48802(:,4), 'k')
axis([0 4 -100 -20])
xlabel('Time (ms)')
ylabel('Voltage (mV)')
print -djpeg cell1shortdur
%%
figure(2);clf
subplot(2,1,1)
plot(c48805(:,1), 53.*c48805(:,2), 'k')
axis([0 4 0 100])
ylabel('Current (nA)')
subplot(2,1,2)
plot(c48805(:,1),c48805(:,4), 'k')
axis([0 4 -100 -20])
xlabel('Time (ms)')
ylabel('Voltage (mV)')
print -djpeg cell1longdur
%%
figure(3);clf
subplot(2,1,1)
plot(c54302(:,1), 97.5.*c54302(:,2), 'k')
title('Cell 1 Short Duration')
axis([0 4 0 100])
ylabel('Current (nA)')
subplot(2,1,2)
plot(c54302(:,1),c54302(:,4), 'k')
axis([0 4 -100 -20])
xlabel('Time (ms)')
ylabel('Voltage (mV)')
print -djpeg cell2shortdur
%%
figure(4);clf
subplot(2,1,1)
plot(c54305(:,1), 53.*c54305(:,2), 'k')
title('Cell 543 Long Duration')
axis([0 4 0 100])
ylabel('Current (nA)')
subplot(2,1,2)
plot(c48805(:,1),c48805(:,4), 'k')
axis([0 4 -100 -20])
xlabel('Time (ms)')
ylabel('Voltage (mV)')
print -djpeg cell2longdur
%%
figure(5);clf
subplot(2,1,1)
plot(c67602(:,1), 97.5.*c67602(:,2), 'k')
title('Cell 676 Short Duration')
title('Cell 1 Short Duration')
axis([0 4 0 100])
ylabel('Current (nA)')
subplot(2,1,2)
plot(c67602(:,1),c67602(:,4), 'k')
axis([0 4 -100 -20])
xlabel('Time (ms)')
ylabel('Voltage (mV)')
print -djpeg cell3shortdur
%%
figure(6);clf
subplot(2,1,1)
title('Cell 676 Long Duration')
plot(c67605(:,1), 53.*c67605(:,2), 'k')
axis([0 4 0 100])
ylabel('Current (nA)')
subplot(2,1,2)
plot(c67605(:,1),c67605(:,4), 'k')
axis([0 4 -100 -20])
xlabel('Time (ms)')
ylabel('Voltage (mV)')
print -djpeg cell3longdur
%%
figure(7);clf
subplot(2,1,1)
plot(c114802(:,1), 24.*c114802(:,2), 'k')
title('Cell 1148 Short Duration')
axis([0 4 0 100])
ylabel('Current (nA)')
subplot(2,1,2)
plot(c48802(:,1),c48802(:,4), 'k')
axis([0 4 -100 -20])
xlabel('Time (ms)')
ylabel('Voltage (mV)')
print -djpeg cell4shortdur
%%
figure(8);clf
subplot(2,1,1)
plot(c114805(:,1), 09.7.*c114805(:,2), 'k')
title('Cell 1148 Long Duration')
axis([0 4 0 100])
ylabel('Current (nA)')
subplot(2,1,2)
plot(c114805(:,1),c114805(:,4), 'k')
axis([0 4 -100 -20])
xlabel('Time (ms)')
ylabel('Voltage (mV)')
print -djpeg cell4longdur