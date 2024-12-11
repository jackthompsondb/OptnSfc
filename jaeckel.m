function [sigma_hat] = jaeckel(s0, K, r, T, theo,class)
    if class == "C"
        sigma_hat = blsimpv(s0,K,r,T,theo);
    end
    if class == "P"
        sigma_hat = blsimpv(s0,K,r,T,theo,"Class",{"Put"});
    end
end