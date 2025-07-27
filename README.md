# ATTS
import pandas as pd
import numpy as np
from scipy.stats import skew, kurtosis
df= pd.read_excel("Dataset.xlsx")
df
df.shape
df.isnull()
df.isnull().sum()
df.isnull().sum().sum()
df2=df.fillna(method='pad')
df2
df2.isnull().sum()
df3=df2.fillna(method='bfill')
df3
df3.isnull().sum().sum()
df3['Date'] = pd.to_datetime(df3['Date'], errors='coerce')
df3.dropna(subset=['Date'], inplace=True)
df3.reset_index(drop=True, inplace=True)
print("Cleaned Data Summary:")
print(df3.info())
print(df3.head())
summary_stats = df3.describe()
print(summary_stats)
mean_vals = df3.mean(numeric_only=True)
median_vals = df3.median(numeric_only=True)
mode_vals = df3.mode(numeric_only=True).iloc[0]
variance_vals = df3.var(numeric_only=True)
std_dev_vals = df3.std(numeric_only=True)
range_vals = df3.max(numeric_only=True) - df3.min(numeric_only=True)
skew_vals = df3.skew(numeric_only=True)
kurtosis_vals = df3.kurtosis(numeric_only=True)
print("Mean:\n", mean_vals)
print("\nMedian:\n", median_vals)
print("\nMode:\n", mode_vals)
print("\nVariance:\n", variance_vals)
print("\nStandard Deviation:\n", std_dev_vals)
print("\nRange:\n", range_vals)
print("\nSkewness:\n", skew_vals)
print("\nKurtosis:\n", kurtosis_vals)
