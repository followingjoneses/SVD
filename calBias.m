function [user_bias, item_bias] = calBias(data_set, rated_set, mean)
    
user_bias = zeros(943, 1);
item_bias = zeros(1682, 1);

for i = 1 : 943
    sigma1 = 0;
    num1 = length(find(rated_set(i, :) == 1));
    for j = 1 : 1682
       if rated_set(i, j) == 1
           sigma1 = sigma1 + (data_set(i, j) - mean);
       end
    end
    user_bias(i) = sigma1/num1;
end

for i = 1 : 1682
    sigma2 = 0;
    num2 = length(find(rated_set(:, i) == 1));
    for j = 1 : 943
        if rated_set(j, i) == 1
            sigma2 = sigma2 + (data_set(j, i) - mean);
        end
    end
    item_bias(i) = sigma2/num2;
end