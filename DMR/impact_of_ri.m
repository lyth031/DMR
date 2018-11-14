clear

Vread = 0.15;
nwl=128;
nbl=128;
ri=1;
rwl=ri;
rbl=ri;
rlrs=50e3;
rhrs=500e3;

gwl = 1/rwl;
gbl = 1/rbl;
gmin = 1/rhrs;
gmax = 1/rlrs;

w = ones(nwl,nbl);
input = ones(1,nwl);

G=mappingArray(gmin, gmax, w);
vin = Vread*input;
real_output=(response(gwl,gbl,nwl,nbl,G,vin))';
[A, B]=DMRC(gwl,gbl,nwl,nbl,G, Vread);
%[A, B]=MDRE(gwl,gbl,nwl,nbl,G, Vread);
ideal_output = (vin*G)';
fit_output=(regression(A, B, G,vin))';
delta_output1= real_output./ideal_output;
delta_output2= fit_output./ideal_output;
