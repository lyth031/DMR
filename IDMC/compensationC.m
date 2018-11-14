function [iAp, iAn, iBp, iBn]=compensationC(gwl,gbl,nwl,nbl,Gp, Gn, Vread)
[~, ~, G_size3, G_size4] = size(Gp);
iAp = zeros(nwl, nwl, G_size3, G_size4);
iBp = zeros(nbl, nbl, G_size3, G_size4);
iAn = zeros(nwl, nwl, G_size3, G_size4);
iBn = zeros(nbl, nbl, G_size3, G_size4);

for j = 1:G_size4
    for i = 1:G_size3
        G_p=Gp(:,:,i,j);
        G_n=Gn(:,:,i,j);
        [iAp(:,:,i,j), iBp(:,:,i,j)]=IDMCC(gwl,gbl,nwl,nbl,G_p, Vread);
        [iAn(:,:,i,j), iBn(:,:,i,j)]=IDMCC(gwl,gbl,nwl,nbl,G_n, Vread);
    end
end

iAp(iAp>10)=10;
iAn(iAn>10)=10;

