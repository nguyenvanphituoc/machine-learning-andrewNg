%% Initialization
clear ; close all; clc
%% Extract features

spamFeatures = featureFromFolder('spam_2');
nonspamFeatures = featureFromFolder('easy_ham_2');

spamy = ones(size(spamFeatures, 1), 1);
nonspamy = zeros(size(nonspamFeatures, 1), 1);
%% split to 60% training, 20% validation, 20% test
training = 0.6;
val = 0.2;
test = 0.2;

Xval = [spamFeatures(1:ceil(end*val),:); nonspamFeatures(1:ceil(end*val),:)];
Xtest = [spamFeatures(1:ceil(end*test),:); nonspamFeatures(1:ceil(end*test),:)];
X = [spamFeatures(1:ceil(end*training),:); nonspamFeatures(1:ceil(end*training),:)];

yval = [spamy(1:ceil(end*val),:); nonspamy(1:ceil(end*val),:)];
ytest = [spamy(1:ceil(end*test),:); nonspamy(1:ceil(end*test),:)];
y = [spamy(1:ceil(end*training),:); nonspamy(1:ceil(end*training),:)];

%% save to .mat file
save ('ownSpamEmailFeatures.mat', 'X', 'y', 'Xval', 'yval', 'Xtest', 'ytest', '-mat');