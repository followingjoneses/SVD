function rate = predict(i, j, baseline, user_feature, item_feature)

rate = baseline(i, j) + user_feature(i, :) * item_feature(j, :)';

end