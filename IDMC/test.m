[fc1_w, fc1_b, fc2_w, fc2_b] = loadMlp('mlp');
[test_input, test_label]=loadMNSIT('database');
ri = 10;
nwl=400;
nbl=300;
% accuracy = MLP(ri, nwl,nbl,fc1_w, fc1_b, fc2_w, fc2_b, test_input, test_label);
% accuracy_R = MLP_R(ri, nwl,nbl,fc1_w, fc1_b, fc2_w, fc2_b, test_input, test_label);
% accuracy_RCC = MLP_RCC(ri,nwl,nbl,fc1_w, fc1_b, fc2_w, fc2_b, test_input, test_label);
accuracy_RCE = MLP_RCE(ri,nwl,nbl,fc1_w, fc1_b, fc2_w, fc2_b, test_input, test_label);

