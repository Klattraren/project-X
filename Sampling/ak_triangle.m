function ak = ak_triangle(k)
    if  k == 0
        ak = 1/2;
    elseif mod(k,2) == 0
        ak = 0;
    elseif mod(k,2) == 1
        ak = -2/((pi^2) * (k^2));
    end
end