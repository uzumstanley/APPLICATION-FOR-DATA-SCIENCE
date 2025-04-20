% Project Title: Pomegranate Leaf Disease Detection

clc
close all 
clear all

[filename, pathname] = uigetfile({'*.*';'*.bmp';'*.jpg';'*.gif'}, 'Pick a Leaf Image File');
I = imread([pathname,filename]);
I = imresize(I,[256,256]);
figure, imshow(I); title('Query Leaf Image');

[feat_disease seg_img] =  EvaluateFeatures(I);

load('Blight_Feat.mat')
load('Anthracnose_Feat.mat')
load('Alternaria_Feat.mat')

T = [Blight_Feat;Healthy_Feat;Alternaria_Feat];
C = [ zeros(1,10) ones(1,10) 2*ones(1,10) ];
test = feat_disease;
result = multisvm(T,C,test)
disp(result);
