function [test_input, test_label]=loadMNSIT(folder)
load(strcat('./',folder,'/test_input.mat'), 'test_input');
load(strcat('./',folder,'/test_label.mat'), 'test_label');
