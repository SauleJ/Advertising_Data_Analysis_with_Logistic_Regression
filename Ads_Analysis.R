Ads <- read.csv("Ads.csv")

# Adding a column that converts gender values of male and female to 0 and 1
Ads$gender_numeric <- ifelse(Ads$Gender == "Female", 1, 0)

# Creating new data by removing the Gender column:
Ads_new <- subset(Ads, select = -Gender)

# Descriptive statistics: Variance and Standard Deviation
var_sd_stats <- sapply(Ads_new[, c("User.ID", "gender_numeric", "Age", "EstimatedSalary", "Purchased")], function(x) c(variance = var(x), standard_deviation = sd(x)))

# Print the results
print(var_sd_stats)

# Summary statistics of Ads_new
summary(Ads_new)

# Counting 0s and 1s
print(count_of_one <- table(Ads_new$Purchased)[1])
print(count_of_one <- table(Ads_new$Purchased)[2])
print(count_of_one <- table(Ads_new$gender_numeric)[1])
print(count_of_one <- table(Ads_new$gender_numeric)[2])

# Correlation
columns <- c("User.ID", "gender_numeric", "Age", "EstimatedSalary", "Purchased")

# empty matrix to store correlation results
correlation_matrix <- matrix(nrow = length(columns), ncol = length(columns), dimnames = list(columns, columns))

for (i in 1:length(columns)) {
  for (j in 1:length(columns)) {
    correlation_matrix[i, j] <- cor.test(Ads_new[[columns[i]]], Ads_new[[columns[j]]])$estimate
  }
}

print(correlation_matrix)

# Splitting the dataset
#install.packages("caTools")
library(caTools)
set.seed(99)
split = sample.split(Ads_new$Purchased, SplitRatio = 0.8)
split

AdsTrain = subset(Ads_new, split == TRUE)
AdsTest = subset(Ads_new, split == FALSE)

# Regression model:
LogM_1 = glm(Purchased ~ User.ID + gender_numeric + Age + EstimatedSalary , data = AdsTrain, family=binomial)
summary(LogM_1)

# Model adjustment with fewer predictors
LogM_2 = glm(Purchased ~ Age + EstimatedSalary, data = AdsTrain, family=binomial)
summary(LogM_2)

# Odds ratios of model predictors
exp(LogM_2$coefficients)

exp(confint.default(LogM_2))

# Checking
# Akaike's criterion
Tuscias <-glm(Purchased ~ 1, data = AdsTrain, family = binomial)
summary(Tuscias)

# Compatibility criterion
LogM.tuscias <-glm(Purchased ~ 1, data=AdsTrain, family = binomial)
anova(LogM.tuscias, LogM_2, test = "Chisq")

# Determination coefficient
Rkv <- 1 - LogM_2$deviance / LogM_2$null.deviance
Rkv

# Prediction
predict(LogM_2, data.frame(Age = c(1), EstimatedSalary = c(1)), type = "response")

progTrain = predict(LogM_2, type="response")
table(AdsTrain$Purchased, progTrain > 0.5)

progTest = predict(LogM_2, type="response", newdata = AdsTest)
table(AdsTest$Purchased, progTest >= 0.5)


