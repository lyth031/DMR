clear

Vread = 0.15;
nwl=256;
nbl=256;
rwl=1;
rbl=1;
rlrs=50e3;
rhrs=500e3;

gwl = 1/rwl;
gbl = 1/rbl;
gmin = 1/rhrs;
gmax = 1/rlrs;

w = ones(nwl,nbl);
input = eye(nwl);
G=mappingArray(gmin, gmax, w);
[A, B]=DMRC(gwl,gbl,nwl,nbl,G, Vread);
%[A, B]=DMRE(gwl,gbl,nwl,nbl,G, Vread);
real_output = zeros(nwl,nbl);
ideal_output = zeros(nwl,nbl);
fit_output = zeros(nwl,nbl);
for i = 1:nwl
    vin = Vread*input(i,:);
    real_output(i,:)=response(gwl,gbl,nwl,nbl,G,vin);
    ideal_output(i,:) = vin*G;
    fit_output(i,:)=regression(A, B, G,vin);
end
delta_output1= real_output./ideal_output;
delta_output2= fit_output./ideal_output;