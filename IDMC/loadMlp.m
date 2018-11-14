function [fc1_w, fc1_b, fc2_w, fc2_b]=loadMlp(folder)
load(strcat('./',folder,'/fc1_w.mat'), 'fc1_w');
load(strcat('./',folder,'/fc1_b.mat'), 'fc1_b');
load(strcat('./',folder,'/fc2_w.mat'), 'fc2_w');
load(strcat('./',folder,'/fc2_b.mat'), 'fc2_b');