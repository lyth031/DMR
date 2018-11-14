function accuracy=MLP_R(ri, nwl,nbl,fc1_w, fc1_b, fc2_w, fc2_b, test_input, test_label)
tic
rwl=ri;
rbl=ri;
rlrs=50e3;
rhrs=500e3;

gwl = 1/rwl;
gbl = 1/rbl;
gmin = 1/rhrs;
gmax = 1/rlrs;

Vread=0.15;
fprintf(' nwl: %.2f, nbl: %.2f, ri: %.2f\n', nwl, nbl, ri);
output_label = zeros(1000,1);
parfor i = 1:10000
    input = test_input(i,:);
    real_output=realFc(gwl, gbl, nwl, nbl, gmin, gmax, Vread, fc1_w, input);
    output = real_output/Vread/(gmax-gmin);
    output = output +fc1_b;
    output = tanh(output);
    real_output=realFc(gwl, gbl, nwl, nbl, gmin, gmax, Vread, fc2_w, output);
    output = real_output/Vread/(gmax-gmin);
    output = output +fc2_b;
    [~,label]= max(output);
    output_label(i) = label-1;    
end
correct = 0;
for i = 1:10000
    if test_label(i) == output_label(i)
        correct = correct +1;
    end
end
fprintf(' Test accuracy: %.2f;\n', correct/100);
accuracy = correct/100;
toc
