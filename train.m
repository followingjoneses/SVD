user_number = 943;
item_number = 1682;
FEATURE = 10;
ITERATIONS = 40;
lambda = 0.02;
gamma = 0.05;

m_set = ml_read('ml-100k/u.data', 0, user_number, item_number);

data_set = zeros(user_number, item_number);
rated_set = zeros(user_number, item_number);
baseline = zeros(user_number, item_number);
user_feature = 0.1 * rand(user_number, FEATURE) / sqrt(FEATURE);
item_feature = 0.1 * rand(item_number, FEATURE) / sqrt(FEATURE);

for i = 1 : 100000
   u = m_set(1, i); 
   v = m_set(2, i);
   r = m_set(3, i);
   data_set(u, v) = r;
   rated_set(u, v) = 1; %If user u has rated item v, the corresponding element is 1. Otherwise, it is 0.
end

mean = calMean(data_set, rated_set);

fprintf('mean = %.1f\n', mean);

[user_bias, item_bias] = calBias(data_set, rated_set, mean);

rated_number = length(find(rated_set==1));

% train
for iter = 1 : ITERATIONS
	sigma = 0;
    for u = 1 : user_number
        for i = 1 : item_number
            if rated_set(u, i) == 1
                baseline(u, i) = mean + user_bias(u) + item_bias(i);
                eui = data_set(u, i) - predict(u, i, baseline, user_feature, item_feature);
                temp_user_feature = user_feature(u, :);
                temp_item_feature = item_feature(i, :);
                
                user_bias(u) = user_bias(u) + gamma * (eui - lambda * user_bias(u));
                item_bias(i) = item_bias(i) + gamma * (eui - lambda * item_bias(i));
                user_feature(u, :) = temp_user_feature + gamma * (eui * temp_item_feature - lambda * temp_user_feature);
                item_feature(i, :) = temp_item_feature + gamma * (eui * temp_user_feature - lambda * temp_item_feature);

                %eui = data_set(u, i) - predict(u, i, baseline, user_feature, item_feature);
                sigma = sigma + eui^2;
            end
        end
    end
    % calRMSE
    rmse = sqrt(sigma / rated_number);
    fprintf('iteration = %d, rmse = %f\n', iter, rmse);
end

save('100k-data/user_feature.mat', 'user_feature');
save('100k-data/item_feature.mat', 'item_feature');
save('100k-data/baseline.mat', 'baseline');



