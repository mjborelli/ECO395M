library(tidyverse)
library(FNN)

loadhou = read.csv('../data/loadhou.csv')
summary(loadhou)

N = nrow(loadhou)

train.ex1 = sample.int(N, 150, replace = FALSE)
train.ex2 = sample.int(N, 150, replace = FALSE)
train.ex3 = sample.int(N, 150, replace = FALSE)
train.ex4 = sample.int(N, 150, replace = FALSE)
train.ex5 = sample.int(N, 150, replace = FALSE)

D_train_1 = loadhou[train.ex1,]
D_test_1 = loadhou[-train.ex1,]
D_train_2 = loadhou[train.ex2,]
D_test_2 = loadhou[-train.ex2,]
D_train_3 = loadhou[train.ex3,]
D_test_3 = loadhou[-train.ex3,]
D_train_4 = loadhou[train.ex4,]
D_test_4 = loadhou[-train.ex4,]
D_train_5 = loadhou[train.ex5,]
D_test_5 = loadhou[-train.ex5,]

D_test_1 = arrange(D_test_1, KHOU)
head(D_test_1)
D_test_2 = arrange(D_test_2, KHOU)
head(D_test_2)
D_test_3 = arrange(D_test_3, KHOU)
D_test_4 = arrange(D_test_4, KHOU)
D_test_5 = arrange(D_test_5, KHOU)

X_train_1 = select(D_train_1, KHOU)
y_train_1 = select(D_train_1, COAST)
X_test_1 = select(D_test_1, KHOU)
y_test_1 = select(D_test_1, COAST)

X_train_2 = select(D_train_2, KHOU)
y_train_2 = select(D_train_2, COAST)
X_test_2 = select(D_test_2, KHOU)
y_test_2 = select(D_test_2, COAST)

X_train_3 = select(D_train_3, KHOU)
y_train_3 = select(D_train_3, COAST)
X_test_3 = select(D_test_3, KHOU)
y_test_3 = select(D_test_3, COAST)

X_train_4 = select(D_train_4, KHOU)
y_train_4 = select(D_train_4, COAST)
X_test_4 = select(D_test_4, KHOU)
y_test_4 = select(D_test_4, COAST)

X_train_5 = select(D_train_5, KHOU)
y_train_5 = select(D_train_5, COAST)
X_test_5 = select(D_test_5, KHOU)
y_test_5 = select(D_test_5, COAST)


knn3.1 = knn.reg(train = X_train_1, test = X_test_1, y = y_train_1, k=3)
knn3.2 = knn.reg(train = X_train_2, test = X_test_2, y = y_train_2, k=3)
knn3.3 = knn.reg(train = X_train_3, test = X_test_3, y = y_train_3, k=3)
knn3.4 = knn.reg(train = X_train_4, test = X_test_4, y = y_train_4, k=3)
knn3.5 = knn.reg(train = X_train_5, test = X_test_5, y = y_train_5, k=3)

ypred_knn3.1 = knn3.1$pred
ypred_knn3.2 = knn3.2$pred
ypred_knn3.3 = knn3.3$pred
ypred_knn3.4 = knn3.4$pred
ypred_knn3.5 = knn3.5$pred

p_test = ggplot(data = D_test_1) + 
  geom_point(mapping = aes(x = KHOU, y = COAST), color='lightgrey') + 
  theme_bw(base_size=18) + 
  ylim(7000, 20000)
p_test

p_test + 
  geom_path(mapping = aes(x = KHOU, y = ypred_knn3.1, color='red')) +
  geom_path(mapping = aes(x = KHOU, y = ypred_knn3.2, color='blue')) +
  geom_path(mapping = aes(x = KHOU, y = ypred_knn3.3, color='green')) +
  geom_path(mapping = aes(x = KHOU, y = ypred_knn3.4, color='orange')) +
  geom_path(mapping = aes(x = KHOU, y = ypred_knn3.5, color='rainbow')) 
         