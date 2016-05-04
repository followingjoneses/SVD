% test

tmp1 = load('100k-data/user_feature.mat', 'user_feature');
user_feature = tmp1.('user_feature');
tmp2 = load('100k-data/item_feature.mat', 'item_feature');
item_feature = tmp2.('item_feature');
tmp3 = load('100k-data/baseline.mat', 'baseline');
baseline = tmp3.('baseline');

user_number = 943;
item_number = 1682;

% u1.test
u1_m_set = ml_read('ml-100k/u1.test', 0, user_number, item_number);

u1_sigma = 0;

for i = 1 : 20000
   u = u1_m_set(1, i); 
   v = u1_m_set(2, i);
   r = u1_m_set(3, i);
   predict_rate = predict(u, v, baseline, user_feature, item_feature);
   u1_sigma = u1_sigma + (predict_rate - r)^2;
end

u1_rmse = sqrt(double(u1_sigma) / 20000);

fprintf('u1.test rmse = %f\n', u1_rmse);

% u2.test
u2_m_set = ml_read('ml-100k/u2.test', 0, user_number, item_number);

u2_sigma = 0;

for i = 1 : 20000
   u = u2_m_set(1, i); 
   v = u2_m_set(2, i);
   r = u2_m_set(3, i);
   predict_rate = predict(u, v, baseline, user_feature, item_feature);
   u2_sigma = u2_sigma + (predict_rate - r)^2;
end

u2_rmse = sqrt(double(u2_sigma) / 20000);

fprintf('u2.test rmse = %f\n', u2_rmse);

% u3.test
u3_m_set = ml_read('ml-100k/u3.test', 0, user_number, item_number);

u3_sigma = 0;

for i = 1 : 20000
   u = u3_m_set(1, i); 
   v = u3_m_set(2, i);
   r = u3_m_set(3, i);
   predict_rate = predict(u, v, baseline, user_feature, item_feature);
   u3_sigma = u3_sigma + (predict_rate - r)^2;
end

u3_rmse = sqrt(double(u3_sigma) / 20000);

fprintf('u3.test rmse = %f\n', u3_rmse);

% u4.test
u4_m_set = ml_read('ml-100k/u4.test', 0, user_number, item_number);

u4_sigma = 0;

for i = 1 : 20000
   u = u4_m_set(1, i); 
   v = u4_m_set(2, i);
   r = u4_m_set(3, i);
   predict_rate = predict(u, v, baseline, user_feature, item_feature);
   u4_sigma = u4_sigma + (predict_rate - r)^2;
end

u4_rmse = sqrt(double(u4_sigma) / 20000);

fprintf('u4.test rmse = %f\n', u4_rmse);

% u5.test
u5_m_set = ml_read('ml-100k/u5.test', 0, user_number, item_number);

u5_sigma = 0;

for i = 1 : 20000
   u = u5_m_set(1, i); 
   v = u5_m_set(2, i);
   r = u5_m_set(3, i);
   predict_rate = predict(u, v, baseline, user_feature, item_feature);
   u5_sigma = u5_sigma + (predict_rate - r)^2;
end

u5_rmse = sqrt(double(u5_sigma) / 20000);

fprintf('u5.test rmse = %f\n', u5_rmse);