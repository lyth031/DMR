clear

Vread = 0.15;
nwl=128;
nbl=256;
rwl=1;
rbl=1;
rlrs=50e3;
rhrs=500e3;

gwl = 1/rwl;
gbl = 1/rbl;
gmin = 1/rhrs;
gmax = 1/rlrs;

input = ones(1,nwl);
real_output = zeros(nwl,nbl);
ideal_output = zeros(nwl,nbl);
fit_output = zeros(nwl,nbl);
vin = Vread*input(1,:);
w = zeros(nwl,nbl); 
w(:,nbl) = ones(nwl,1);
G=mappingArray(gmin, gmax, w);

for i = 1:nbl-1
    w = zeros(nwl,nbl); 
    w(:,nbl) = ones(nwl,1);
    w(:,i) = ones(nwl,1);
    G=mappingArray(gmin, gmax, w);
    [A, B]=DMRC(gwl,gbl,nwl,nbl,G, Vread);
    %[A, B]=DMRE(gwl,gbl,nwl,nbl,G, Vread);
    real_output(i,:)=response(gwl,gbl,nwl,nbl,G,vin);
    fit_output(i,:)=regression(A, B, G,vin);
    ideal_output(i,:) = vin*G;
end
delta_output1= real_output(1:nbl-1,:)./ideal_output(1:nbl-1,:);
delta_output2= fit_output(1:nbl-1,:)./ideal_output(1:nbl-1,:);
