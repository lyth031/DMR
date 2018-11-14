function [iAp, iAn, iBp, iBn]=compensationE(gwl,gbl,nwl,nbl,Gp, Gn, Vread)
[~, ~, G_size3, G_size4] = size(Gp);
iAp = zeros(nwl, nwl, G_size3, G_size4);
iBp = zeros(nbl, nbl, G_size3, G_size4);
iAn = zeros(nwl, nwl, G_size3, G_size4);
iBn = zeros(nbl, nbl, G_size3, G_size4);
input = eye(nwl);

for j = 1:G_size4
    for i = 1:G_size3
        G_p=Gp(:,:,i,j);
        G_n=Gn(:,:,i,j);
        for k =1:nwl
            vin = Vread*input(k,:);
            output_p=response(gwl,gbl,nwl,nbl,G_p,vin);
            output_n=response(gwl,gbl,nwl,nbl,G_n,vin);
            iAp(k,k,i,j) = Vread*G_p(k,1)/output_p(1,1);
            iAn(k,k,i,j) = Vread*G_n(k,1)/output_n(1,1);
        end
        for k =1:nbl
            iBp(k,k,i,j) = Vread*G_p(nbl,k)/output_p(1,k);
            iBn(k,k,i,j) = Vread*G_n(nbl,k)/output_n(1,k);
        end
    end
end
iAp(iAp>10)=10;
iAn(iAn>10)=10;
