function [Gp, Gn, d_w]=normalMapping(nwl, nbl, gmin, gmax, w)
gdelta = gmax - gmin;
d_w = size(w);
[row, col] = size(w);

a = ceil(row/nwl);
b = ceil(col/nbl);

Gp = zeros(nwl, nbl, a, b);
Gn = zeros(nwl, nbl, a, b);

positive_w = w;
positive_w(positive_w < 0) = 0;
negative_w = -w;
negative_w(negative_w < 0) = 0;

for j = 1:b-1
    for i = 1:a-1
       Gp(:,:,i,j) = positive_w((i-1)*nwl+1:i*nwl,(j-1)*nbl+1:j*nbl);
       Gn(:,:,i,j) = negative_w((i-1)*nwl+1:i*nwl,(j-1)*nbl+1:j*nbl);               
    end
end
temp_col = col - (b-1)*nbl;
for i = 1:a-1
    Gp(:,1:temp_col,i,b) = positive_w((i-1)*nwl+1:i*nwl,(b-1)*nbl+1:col);
    Gn(:,1:temp_col,i,b) = negative_w((i-1)*nwl+1:i*nwl,(b-1)*nbl+1:col);
end
temp_row = row - (a-1)*nwl;
for j = 1:b-1
    Gp(1:temp_row,:,a,j) = positive_w((a-1)*nwl+1:row,(j-1)*nbl+1:j*nbl);
    Gn(1:temp_row,:,a,j) = negative_w((a-1)*nwl+1:row,(j-1)*nbl+1:j*nbl); 
end

Gp(1:temp_row,1:temp_col,a,b) = positive_w((a-1)*nwl+1:row,(b-1)*nbl+1:col);
Gn(1:temp_row,1:temp_col,a,b) = negative_w((a-1)*nwl+1:row,(b-1)*nbl+1:col);

for j=1:b
    for i=1:a
        Gp(:,:,i,j) = gmin + gdelta*Gp(:,:,i,j);
        Gn(:,:,i,j) = gmin + gdelta*Gn(:,:,i,j);
    end
end

end