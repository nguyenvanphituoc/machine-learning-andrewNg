function [ features ] = featureFromFolder(folderPath)
%BUILDMYDATASET Summary of this function goes here
%   async dir('folderPath')
%   readFile content from element of directory
%   
folder = dir(folderPath);
features = [];
parfor idx = 3 : length(folder)
    filePath = folder(idx).folder + "/" + folder(idx).name;
    file_contents = readFile(filePath);
    word_indices  = processEmail(file_contents);
    featureX      = emailFeatures(word_indices);
    features      = [features; featureX'];
end

end