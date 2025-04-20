%Step 1
%Creating a datastore
imds = imageDatastore('Leaf_Disease_Dataset','IncludeSubfolders',true,...
        'LabelSource','foldernames');
    
    disp(imds);
    
% %Step 2
% %Splitting the data

[traindata,testdata] = splitEachLabel(imds,0.8);

%Step 3
layer = [imageInputLayer([256 256 3])
        convolution2dLayer(5,20)
        reluLayer
        maxPooling2dLayer(2, 'Stride', 2)
        fullyConnectedLayer(5)
        softmaxLayer
        classificationLayer
        ];
    
 %Step 4
 %Training options
 
 options = trainingOptions('rmsprop', ...
            'Plots', 'training-progress', ...
            'LearnRateSchedule', 'piecewise', ...
            'MaxEpochs',30, ...
            'LearnRateDropFactor', 0.4, ...
            'LearnRateDropPeriod',7, ...
            'MiniBatchSize', 300);
            %options.MaxEpochs = 30;
        
  %Step 5
  %Training the network
  
  [net,info] = trainNetwork(traindata,layer,options);
  
  save net net
  
  %Training completed
  
  helpdlg('Training completed');
 
 