function [inputs,targets] = refmodel_dataset
%ROBOTARM_DATASET Reference model dataset
%
% Input-output time series problems consist of predicting the next value
% of one time-series given another time-series. Past values of both series
% (for best accuracy), or only one of the series (for a simpler system)
% may be used to predict the target series.
%
% This dataset can be used to train a neural network to model a linear
% system.  It can also be used to train the control part of a
% model reference controller to behave like a linear system.  For instance,
% if a model network is trained to fit the behavior of a robot arm defined
% by the dataset <a href="matlab:doc robotarm_dataset">robotarm_dataset</a>, then this data can be used to
% train a controller for the robot arm model which transforms the nonlinear
% dynamics of the robot arm into the linear dynamics defined by this
% dataset.
%
% LOAD <a href="matlab:doc refmodel_dataset">refmodel_dataset</a>.MAT loads these two variables:
%
%   refmodelInputs - a 1x2000 cell array of scalar values representing
%   2000 timesteps of linear system control signals.
%
%   refmodelTargets - a 1x2000 cell array of scalar values representing
%   2000 timesteps of linear system responses.
%
% [X,T] = <a href="matlab:doc refmodel_dataset">refmodel_dataset</a> loads the inputs and targets into
% variables of your own choosing.
%
% For an intro to prediction with the <a href="matlab:ntstool">Neural Time Series app</a>
% click "Load Example Data Set" in the second panel and pick this dataset.
%
% Here is how to design a neural network that predicts the target series
% from past values of inputs and targets. See <a href="matlab:doc narxnet">narxnet</a> for more details.
%
%   [X,T] = <a href="matlab:doc refmodel_dataset">refmodel_dataset</a>;
%   net = <a href="matlab:doc narxnet">narxnet</a>(1:2,1:2,10);
%   [Xs,Xi,Ai,Ts] = preparets(net,X,{},T);
%   net = <a href="matlab:doc train">train</a>(net,Xs,Ts,Xi,Ai);
%   <a href="matlab:doc view">view</a>(net)
%   Y = net(Xs,Xi,Ai)
%   plotresponse(Ts,Y)
%
% Here is how to design a neural network that predicts the target series
% from only using past values of inputs. See <a href="matlab:doc timedelaynet">timedelaynet</a> for details.
%   
%   net = <a href="matlab:doc timedelaynet">timedelaynet</a>(1:2,10);
%   [Xs,Xi,Ai,Ts] = preparets(net,X,T);
%   net = <a href="matlab:doc train">train</a>(net,Xs,Ts,Xi,Ai);
%
% See also NTSTOOL, NARXNET, TIMEDELAYNET, NARNET, PREPARETS, NNDATASETS.
%
% ---------
%
% This data set was generated by the simulink model narmamaglev.mdl,
% which is part of Neural Network Toolbox software.  It is described
% in the NARMA-L2 section of the Control Systems chapter in the
% toolbox User's Guide.

% Copyright 2010-2011 The MathWorks, Inc.


load refmodel_dataset
inputs = refmodelInputs;
targets = refmodelTargets;
