% Ali Bootwala
% BME 512L
% Random Sampling Generator
% Proof of Uniform Random Sampling
%% Initialize Workspace
global cellchoices
%% Begin generating two tuples
% Generate two random discrete variable on Uniform(0,599)
b1 = floor(600.*rand);
b2 = floor(600.*rand);
% Make it such that b2 cannot equal b1, so that it is sampled uniformly
% from the same distribution excluding the value of b1
while b2 == b1;
    b2 = floor(600.*rand);
end
% Generate two random discrete variables on Uniform(600,1199)
t1 = floor(600.*rand) + 600;
t2 = floor(600.*rand) + 600;
% Make it such that t2 cannot equal t1, so that it is sampled uniformly
% from the same distribution excluding the value of t1
while t2 == t1;
    t2 = floor(600.*rand) + 600;
end
cellchoices = [b1, b2, t1, t2];