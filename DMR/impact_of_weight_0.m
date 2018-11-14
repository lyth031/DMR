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


input = eye(nwl);
real_output = zeros(2,nbl);
ideal_output = zeros(2,nbl);
fit_output = zeros(2,nbl);
vin = Vread*input(1,:);
w = zeros(nwl,nbl); 
w(1,:) = ones(1,nbl);
G=mappingArray(gmin, gmax, w);
[A, B]=MDRC(gwl,gbl,nwl,nbl,G, Vread);
%[A, B]=MDRE(gwl,gbl,nwl,nbl,G, Vread);
real_output(1,:)=response(gwl,gbl,nwl,nbl,G,vin);
fit_output(1,:)=regression(A, B, G,vin);
ideal_output(1,:) = vin*G;

w = ones(nwl,nbl);
G=mappingArray(gmin, gmax, w);
[A, B]=DMRC(gwl,gbl,nwl,nbl,G, Vread);
%[A, B]=DMRE(gwl,gbl,nwl,nbl,G, Vread);
real_output(2,:)=response(gwl,gbl,nwl,nbl,G,vin);
fit_output(2,:)=regression(A, B, G,vin);
ideal_output(2,:) = vin*G;

delta_output1= (real_output./ideal_output)';
delta_output2= (fit_output./ideal_output)';
