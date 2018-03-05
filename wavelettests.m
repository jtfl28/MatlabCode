clear all; close all;
xnoise = rand(100)./10;
y = @(x) 4*sin(x) + 15*cos(x);
x = y(xnoise);
xwav = dwt(x);