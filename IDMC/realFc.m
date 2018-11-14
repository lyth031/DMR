function output=realFc(gwl, gbl, nwl, nbl, gmin, gmax, Vread, w, input)
[Gp, Gn]=normalMapping(nwl, nbl, gmin, gmax, w);
[~, ~, G_size3, G_size4] = size(Gp);
d_w= size(w);
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
        output_temp(:,(j-1)*nbl+1:j*nbl) = output_temp(:,(j-1)*nbl+1:j*nbl) + response(gwl,gbl,nwl,nbl,Gp(:,:,i,j),vin(:,:,i)) - response(gwl,gbl,nwl,nbl,Gn(:,:,i,j),vin(:,:,i));
    end
end

output = output_temp(:,1:d_w(2));