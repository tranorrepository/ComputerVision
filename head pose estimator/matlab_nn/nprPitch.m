% Solve a Pattern Recognition Problem with a Neural Network
% Script generated by NPRTOOL
% Created Mon Jun 06 16:00:53 CEST 2011
%
% This script assumes these variables are defined:
%
%   A - input data.
%   pitch - target data.

inputs = A;
targets = pitch;

% Create a Pattern Recognition Network
hiddenLayerSize = 250;
net2 = patternnet(hiddenLayerSize);

% Choose Input and Output Pre/Post-Processing Functions
% For a list of all processing functions type: help nnprocess
net2.inputs{1}.processFcns = {'removeconstantrows','mapminmax'};
net2.outputs{2}.processFcns = {'removeconstantrows','mapminmax'};


% Setup Division of Data for Training, Validation, Testing
% For a list of all data division functions type: help nndivide
net2.divideFcn = 'dividerand';  % Divide data randomly
net2.divideMode = 'sample';  % Divide up every sample
net2.divideParam.trainRatio = 67/100;
net2.divideParam.valRatio = 33/100;
net2.divideParam.testRatio = 0/100;

% For help on training function 'trainlm' type: help trainlm
% For a list of all training functions type: help nntrain
%net.trainFcn = 'trainlm';  % Levenberg-Marquardt

% Choose a Performance Function
% For a list of all performance functions type: help nnperformance
net2.performFcn = 'mse';  % Mean squared error

% Choose Plot Functions
% For a list of all plot functions type: help nnplot
%net.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
%  'plotregression', 'plotfit'};


% Train the Network
[net2,tr] = train(net2,inputs,targets);

% Test the Network
%outputs = net(inputs);
%errors = gsubtract(targets,outputs);
%performance = perform(net,targets,outputs)

% Recalculate Training, Validation and Test Performance
%trainTargets = targets .* tr.trainMask{1};
%valTargets = targets  .* tr.valMask{1};
%testTargets = targets  .* tr.testMask{1};
%trainPerformance = perform(net,trainTargets,outputs)
%valPerformance = perform(net,valTargets,outputs)
%testPerformance = perform(net,testTargets,outputs)

% View the Network
%view(net)

% Plots
% Uncomment these lines to enable various plots.
%figure, plotperform(tr)
%figure, plottrainstate(tr)
%figure, plotconfusion(targets,outputs)
%figure, ploterrhist(errors)
