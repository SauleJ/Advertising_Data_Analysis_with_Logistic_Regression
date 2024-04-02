# Advertising Data Analysis with Logistic Regression

This repository contains R code for analyzing advertising data using logistic regression.

## Description

The R script `Ads_Analysis.R` performs a comprehensive analysis of advertising data to evaluate the effectiveness of ad campaigns. It includes the following steps:

1. **Data Loading:** The script loads the advertising data from the file `Ads.csv` into R for analysis.

2. **Data Preprocessing:** It preprocesses the data by converting gender values to numeric format and removing unnecessary columns.

3. **Descriptive Statistics:** The script calculates and displays descriptive statistics, including variance and standard deviation, for key variables in the dataset.

4. **Counting 0s and 1s:** It counts the occurrences of 0s and 1s in the `Purchased` and `gender_numeric` columns.

5. **Correlation Analysis:** The script calculates the correlation coefficients between different variables in the dataset and constructs a correlation matrix.

6. **Data Splitting:** It splits the dataset into training and testing sets using a specified split ratio.

7. **Logistic Regression Modeling:** The script builds logistic regression models to predict the likelihood of a purchase based on predictor variables such as age, estimated salary, and gender.

8. **Model Evaluation:** It evaluates the logistic regression models by examining summary statistics, odds ratios, and model fit statistics such as AIC and Chi-square tests.

9. **Prediction:** The script makes predictions on the testing dataset using the trained logistic regression models and assesses the model performance.
