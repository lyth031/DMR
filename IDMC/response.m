function output=response(gwl,gbl,nwl,nbl,G,vin)
col = nwl*nbl*2;
A1 = zeros(col,7);
d1 = [-nwl*nbl, - nwl, -1, 0 ,1, nwl, nwl*nbl];
y = zeros(col,1);

for k=1:col
    m = ceil(k/(nwl*nbl));
    j = ceil((k-(m-1)*nwl*nbl)/nwl);
    i = k - (m-1)*nwl*nbl -(j-1)*nwl;
    if m == 1
        if j == 1
            A1(k,4) = G(i,j) + 2*gwl;
            A1(k+nwl,6) = -gwl;
            A1(k+nwl*nbl,7) = -G(i,j);
            y(k,1) = vin(1,k)*gwl;
        elseif j == nbl
            A1(k,4) = G(i,j) + gwl;
            A1(k-nwl,2) = -gwl;
            A1(k+nwl*nbl,7) = -G(i,j);
        else
            A1(k,4) = G(i,j) + 2*gwl;
            A1(k-nwl,2) = -gwl;
            A1(k+nwl,6) = -gwl;
            A1(k+nwl*nbl,7) = -G(i,j);
        end
        %s(k,1) = vin(1,i);
    else
        if i == 1
            A1(k,4) = G(i,j) + gbl;
            A1(k+1,5) = -gbl;
            A1(k-nwl*nbl,1) = -G(i,j); 
        elseif i == nwl
            A1(k,4) = G(i,j) + 2*gbl;
            A1(k-1,3) = -gbl;
            A1(k-nwl*nbl,1) = -G(i,j);
        else
            A1(k,4) = G(i,j) + 2*gbl;
            A1(k-1,3) = -gbl;
            A1(k+1,5) = -gbl;
            A1(k-nwl*nbl,1) = -G(i,j); 
        end
    end
end

K = spdiags(A1,d1,col,col);

x = K\y;
vnode = reshape(x,nwl,nbl,2);

vrram = vnode(:,:,1) - vnode(:,:,2);
point_out = vrram.*G;
output = sum(point_out);