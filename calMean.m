function mean = calMean(data_set, rated_set)
    
sigma = sum(data_set);

num = length(find(rated_set==1));

mean = sigma/num;

end