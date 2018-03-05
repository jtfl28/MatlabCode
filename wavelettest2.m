clear all; close all;
A = importdata('das-grbp-wt-1um-10min-mos2-0813_000.txt.000');
i = mat2gray(A);
figure
imshow(i)
bg = imopen(i,strel('rectangle',[5,512]));
i_new = i-bg;
% figure; imshow(bg);
m = min(min(i_new));
ma = max(max(i_new));
i_new = mat2gray(i_new,[m ma]);
% figure; imshow(i_new);
e = double(edge(i_new,'Canny'));
figure; imshow(e);
[a,h,v,d] = haart2(e);
figure; imshow(ihaart2(a,h,v,d,1))
% 
% pic = ihaart2(a,h,v,d);
% % figure; imshow(pic);
% newpic = double(edge(pic,'Canny'));
% % figure; imshow(newpic);
% 
% neuron = [];
% % neuron = neuralAI(neuron,e,'feed','haart2');
