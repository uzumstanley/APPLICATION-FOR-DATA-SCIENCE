load net

[filename, pathname] = uigetfile('*.*');

if isequal(filename,0) || isequal(pathname,0)
       warndlg('User pressed cancel')
else
       g = imread(strcat( pathname,filename));
       g = imresize(g,[256 256]);
       %figure,imshow(g);
       subplot(2,2,1); imshow(g); title("Original Image")
       label = classify(net,g);
       %disp(label);
end

a = imread(strcat( pathname,filename));
a = imresize(a,[256 256]);
c = rgb2hsv(a);
%figure, imshow(a)
%figure, imshow(c)

H = c(:,:,1);
S = c(:,:,2);
V = c(:,:,3);

f = fspecial('gaussian', [9,9]);
filter = imfilter(H, f);
subplot(2,2,2); imshow(filter); title("Filter Image")

if label == 'Bacteria'
    bw = filter > 0.17 & filter <0.65;
    Bw = ~bw;
    BW2 = bwareafilt(Bw,[5 1000]);
    figure, imshow(Bw)
    %subplot(2,2,3); imshow(Bw); title("Binarized Image")
    %subplot(2,2,4); imshow(BW2); title("Image with Spots")
elseif label == 'Fungi' 
    bw = filter > 0.15 & filter <0.5;
    Bw = ~bw;
    BW2 = bwareafilt(Bw,[5 1000]);
    figure, imshow(Bw)
    %subplot(2,2,3); imshow(Bw); title("Binarized Image")
    %subplot(2,2,4); imshow(BW2); title("Image with Spots")
elseif label == 'Nematodes' 
    bw = filter > 0.08 & filter <0.5;
    Bw = ~bw;
    BW2 = bwareafilt(Bw,[5 600]);
    figure, imshow(Bw)
    %subplot(2,2,3); imshow(Bw); title("Binarized Image")
    %subplot(2,2,4); imshow(BW2); title("Image with Spots")
elseif label == 'Virus' 
    bw = filter > 0.08 & filter <0.3;
    Bw = ~bw;
    BW2 = bwareafilt(Bw,[5 2000]);
    figure, imshow(Bw)
    %subplot(2,2,3); imshow(Bw); title("Binarized Image")
    %subplot(2,2,4); imshow(BW2); title("Image with Spots")
elseif label == 'Normal' 
    bw = filter > 0.1 & filter <0.5;
    Bw = ~bw;
    BW2 = bwareafilt(Bw,[5 2000]);
    figure, imshow(Bw)
    %subplot(2,2,3); imshow(Bw); title("Binarized Image")
    %subplot(2,2,4); imshow(BW2); title("Image with Spots")
    
end

cc = bwconncomp(BW2);
Spots = cc.NumObjects ;
%disp(Spots)

fisObject = readfis("FuzzyLeaf.fis");
fis = getFISCodeGenerationData(fisObject);

opt = evalfisOptions('NumSamplePoints',51);
evalfisOutput = evalfis(fis, Spots, opt);
%plotfis(fisObject)

x = ['The disease on the leaf is caused by:', label];
y = ['     The leaf is ', num2str(evalfisOutput), '% Healthy'];
disp(x)
disp(y)
