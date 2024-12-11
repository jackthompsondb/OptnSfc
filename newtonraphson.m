function [sigma_hat, iter] = newtonraphson(s0, K, r, T, theo, sigma_hat, max_iter, tolerance,class)
    if class == "C"
        for iter = 1:max_iter
            d1 = (log(s0/K)+(r+0.5*sigma_hat^2)*T) / (sigma_hat*sqrt(T));
            d2 = d1 - sigma_hat*sqrt(T);
            vega = s0*sqrt(T)*normpdf(d1, 0, 1);
            BS_price_call = s0*normcdf(d1, 0, 1)-K*exp(-r*T)*normcdf(d2, 0, 1);
            error = abs(BS_price_call-theo);
            if error < tolerance
                break;
            end
            sigma_hat = sigma_hat - (error/vega);
        end
    end
    if class == "P"
        for iter = 1:max_iter
            d1 = (log(s0/K)+(r+0.5*sigma_hat^2)*T) / (sigma_hat*sqrt(T));
            d2 = d1 - sigma_hat*sqrt(T);
            vega = s0*sqrt(T)*normpdf(d1, 0, 1);
            BS_price_put = K*exp(-r*T)*normcdf(-d2, 0, 1)-s0*normcdf(-d1, 0, 1);
            error = abs(theo-BS_price_put);
            if error < tolerance
                break;
            end
            sigma_hat = sigma_hat - (error/vega);
        end
    end
