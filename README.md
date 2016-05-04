# SVD

## Directions

This is an example implmenting the singular value decomposition algorithm. The data sets are downloaded from [grouplens.org/datasets/movielens/](http://grouplens.org/datasets/movielens/).

The training algorithm uses batch gradient descent and iterates 40 times, with a data set of 100,000 rates. The testing algorithm is tested by u1.test ~ u5.test, each of which has 20,000 rates. The average RMSE is 0.98.