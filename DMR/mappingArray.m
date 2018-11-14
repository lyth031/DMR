function G=mappingArray(gmin, gmax, w)
gdelta = gmax - gmin;
G = gmin + gdelta*w;
end