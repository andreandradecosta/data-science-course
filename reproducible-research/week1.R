library(kernlab)
library(boot)
data(spam)

#sampling
set.seed(3435)
trainIndicator = rbinom(4601, size = 1, prob = 0.5)
table(trainIndicator)
trainSpam = spam[trainIndicator == 1,]
testSpam = spam[trainIndicator == 0,]

table(trainSpam$type)
plot(trainSpam$capitalAve ~ trainSpam$type)
plot(log10(trainSpam$capitalAve + 1) ~ trainSpam$type)
plot(log10(trainSpam[, 1:4] + 1))
hCluster = hclust(dist(t(trainSpam[, 1:57])))
plot(hCluster)
hClusterUpdated = hclust(dist(t(log10(trainSpam[, 1:55] + 1))))
plot(hClusterUpdated)

trainSpam$numType = as.numeric(trainSpam$type) - 1
costFunction = function(x, y) sum(x != (y > 0.5))
cvError = rep(NA, 55)
for (i in 1:55) {
    lmFormula = reformulate(names(trainSpam)[i], response = "numType")
    glmFit = glm(lmFormula, family = "binomial", data = trainSpam)
    cvError[i] = cv.glm(trainSpam, glmFit, costFunction, 2)$delta[2]
}
#Which predictor has minimum cross-validated error?
names(trainSpam)[which.min(cvError)]

#Use the best model from the group
predictionModel = glm(numType ~ charDollar, family = "binomial", data = trainSpam)
predictionTest = predict(predictionModel, testSpam)
predictedSpam = rep("nospam", dim(testSpam)[1])
predictedSpam[predictionModel$fitted > 0.5] = "spam"

#Classification table
table(predictedSpam, testSpam$type)
#Error rate
(61 + 458)/(1346 + 458 + 61 + 449)
