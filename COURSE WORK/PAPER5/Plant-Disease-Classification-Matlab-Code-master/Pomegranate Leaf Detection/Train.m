% Training Part
%Features of Anthracnose
for i=1:10
    disp(['Processing frame no.',num2str(i)]);
    img=imread(['Anthracnose\',num2str(i),'.jpg']);
    img = imresize(img,[256,256]);
    imshow(img);title('Leaf Image');
    [feat_disease seg_img] =  EvaluateFeatures(img);
    Healthy_Feat(i,:) = feat_disease;
    save Healthy_Feat;
    close all
end

% Features of Bacterial Blight
for i=1:10
    disp(['Processing frame no.',num2str(i)]);
    img=imread(['Bacterial Blight\',num2str(i),'.jpg']);
    img = imresize(img,[256,256]);
    imshow(img);title('Leaf Image');
    [feat_disease seg_img] =  EvaluateFeatures(img);
    Blight_Feat(i,:) = feat_disease;
    save Blight_Feat;
    close all
end

% Features of Alternaria Alternata
for i=1:10
    disp(['Processing frame no.',num2str(i)]);
    img=imread(['Alternaria Alternata\',num2str(i),'.jpg']);
    img = imresize(img,[256,256]);
    imshow(img);title('Leaf Image');
    [feat_disease seg_img] =  EvaluateFeatures(img);
    Alternaria_Feat(i,:) = feat_disease;
    save Alternaria_Feat;
    close all
end