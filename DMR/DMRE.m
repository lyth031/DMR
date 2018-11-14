function [A, B]=DMRE(gwl,gbl,nwl,nbl,G, Vread)
a = ones(nwl, 1);
b = ones(1, nbl);
input = eye(nwl);
for k =1:nwl
    vin = Vread*input(k,:);
    output=response(gwl,gbl,nwl,nbl,G,vin);
    a(k,1) = output(1,1)/(Vread*G(k,1));
    if k==nwl
        b(1,:) = output./(Vread*G(k,:));

    end
end
A = diag(a);
B = diag(b);
