function [iA, iB]=IDMCC(gwl,gbl,nwl,nbl,G, Vread)
a = ones(nwl, 1);
b = ones(1, nbl);
Gm_row=max(G,[],2);
Gm_col=max(G);
am=1;
for k = 1:nwl
    am=am+(nwl+1-k)*Gm_row(k,1)/gbl;
end
for i = 1:nwl
    a(i,1) =1;
    for k = 1:i
        a(i,1)=a(i,1)+(i-k)*Gm_row(k,1)/gbl;
    end
    a(i,1)=a(i,1)/am;
end

bm=1;
for k = 1:nbl
    bm=bm+k*Gm_col(1,k)/gwl;
end
for j = 1:nbl
    b(1,j) =1;
    for k = j:nbl
        b(1,j)=b(1,j)+(k-j)*Gm_col(1,k)/gwl;
    end
    b(1,j)=b(1,j)/bm;
end

iA = diag(1./a);
iB = diag(1./b);
