clear

Vread = 0.15;
nwl=256;
nbl=128;
rwl=1;
rbl=1;
rlrs=50e3;
rhrs=500e3;

gwl = 1/rwl;
gbl = 1/rbl;
gmin = 1/rhrs;
gmax = 1/rlrs;


input = eye(nwl);
real_output = zeros(nwl,nbl);
ideal_output = zeros(nwl,nbl);
fit_output = zeros(nwl,nbl);
vin = Vread*input(1,:);
w = zeros(nwl,nbl); 
w(1,:) = ones(1,nbl);
G=mappingArray(gmin, gmax, w);

for i = 2:nwl
    w = zeros(nwl,nbl); 
    w(1,:) = ones(1,nbl);
    w(i,:) = ones(1,nbl);
    G=mappingArray(gmin, gmax, w);
    [A, B]=DMRC(gwl,gbl,nwl,nbl,G, Vread);
    %[A, B]=DMRE(gwl,gbl,nwl,nbl,G, Vread);
    real_output(i,:)=response(gwl,gbl,nwl,nbl,G,vin);
    fit_output(i,:)=regression(A, B, G,vin);
    ideal_output(i,:) = vin*G;
end
delta_output1= real_output(2:nwl,:)./ideal_output(2:nwl,:);
delta_output2= fit_output(2:nwl,:)./ideal_output(2:nwl,:);
