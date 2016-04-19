m_set = ml_read('ml-100k/u.data', 0, 943, 1682);

data_set = zeros(943, 1682);
rated_set = zeros(943, 1682);

for i = 1 : 100000
   u = m_set(1, i); 
   v = m_set(2, i);
   r = m_set(3, i);
   data_set(u, v) = r;
   rated_set(u, v) = 1;
end

mean = calMean(data_set, rated_set);



