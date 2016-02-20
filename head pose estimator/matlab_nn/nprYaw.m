% Solve a Pattern Recognition Problem with a Neural Network
% Script generated by NPRTOOL
% Created Mon Jun 06 15:00:17 CEST 2011
%
% This script assumes these variables are defined:
%
%   A - input data.
%   yaw - target data.

inputs = A;
targets = yaw;

% Create a Pattern Recognition Network
hiddenLayerSize = 22;
net1 = patternnet(hiddenLayerSize);

% Choose Input and Output Pre/Post-Processing Functions
% For a list of all processing functions type: help nnprocess
net1.inputs{1}.processFcns = {'removeconstantrows','mapminmax'};
net1.outputs{2}.processFcns = {'removeconstantrows','mapminmax'};

% Setup Division of Data for Training, Validation, Testing
net1.divideFcn = 'dividerand';  % Divide data randomly
net1.divideMode = 'sample';  % Divide up every sample
net1.divideParam.trainRatio = 67/100;
net1.divideParam.valRatio = 33/100;
net1.divideParam.testRatio = 0/100;

% For help on training function 'trainlm' type: help trainlm
% For a list of all training functions type: help nntrain
% net.trainFcn = 'trainlm';  % Levenberg-Marquardt

% Choose a Performance Function
% For a list of all performance functions type: help nnperformance
net1.performFcn = 'mse';  % Mean squared error

% Train the Network
[net1,tr] = train(net1,inputs,targets);

% Test the Network
%outputs = net(inputs);
%errors = gsubtract(targets,outputs);
%performance = perform(net,targets,outputs);

% View the Network
%view(net)

% Plots
% Uncomment these lines to enable various plots.
%figure, plotperform(tr)
%figure, plottrainstate(tr)
%figure, plotconfusion(targets,outputs)
%figure, ploterrhist(errors)
