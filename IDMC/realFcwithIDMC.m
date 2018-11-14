function output=realFcwithIDMC(gwl, gbl, nwl, nbl, Vread, Gp, Gn, d_w, Ap, An, Bp, Bn, input)
[~, ~, G_size3, G_size4] = size(Gp);
%d_w= size(w);
a = ceil(d_w(1)/nwl);
output_temp = zeros(1,nbl*G_size4);
vin = zeros(1, nwl, a);
for i = 1:a-1
    vin(:,:,i) = Vread*input(:,(i-1)*nwl+1:i*nwl);
end
temp_col = d_w(1) - (a-1)*nwl;
vin(:,1:temp_col,a) = Vread*input(:,(a-1)*nwl+1:d_w(1));
for j = 1:G_size4
    for i = 1:G_size3
        G_p=Gp(:,:,i,j);
        G_n=Gn(:,:,i,j);
        A_p=Ap(:,:,i,j);
        A_n=An(:,:,i,j);
        B_p=Bp(:,:,i,j);
        B_n=Bn(:,:,i,j);
        vin_p = vin(:,:,i)*A_p;
        vin_n = vin(:,:,i)*A_n;
        output_temp(:,(j-1)*nbl+1:j*nbl) = output_temp(:,(j-1)*nbl+1:j*nbl) + response(gwl,gbl,nwl,nbl,G_p,vin_p)*B_p - response(gwl,gbl,nwl,nbl,G_n,vin_n)*B_n;
    end
end

output = output_temp(:,1:d_w(2));