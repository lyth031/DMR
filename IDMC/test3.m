accuracy_RCE = zeros(9,3);
[fc1_w, fc1_b, fc2_w, fc2_b] = loadMlp('mlp');
[test_input, test_label]=loadMNSIT('database');
ri = [0.1,0.2,0.3,0.5,0.8,1,2,5,10];
nwl=[200, 400, 800];
nbl=[150, 300, 100];
for i = 1:3
    for j =1:9
        dnwl=nwl(1,i);
        dnbl=nbl(1,i);
        dri=ri(1,j);
        accuracy_RCE(j,i) = MLP_RCE(dri, dnwl,dnbl,fc1_w, fc1_b, fc2_w, fc2_b, test_input, test_label);
    end
end
save('accuracy_RCE.mat','accuracy_RCE');