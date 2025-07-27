#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import numpy as np
from scipy.stats import skew, kurtosis


# In[2]:


df= pd.read_excel("Dataset.xlsx")


# In[3]:


df


# In[4]:


df.shape


# In[5]:


df.isnull()


# In[6]:


df.isnull().sum()


# In[7]:


df.isnull().sum().sum()


# In[8]:


df2=df.fillna(method='pad')
df2


# In[9]:


df2.isnull().sum()


# In[10]:


df3=df2.fillna(method='bfill')
df3


# In[11]:


df3.isnull().sum().sum()


# In[12]:


df3['Date'] = pd.to_datetime(df3['Date'], errors='coerce')
df3.dropna(subset=['Date'], inplace=True)
df3.reset_index(drop=True, inplace=True)
print("Cleaned Data Summary:")


# In[13]:


print(df3.info())


# In[14]:


print(df3.head())


# In[15]:


summary_stats = df3.describe()
print(summary_stats)


# In[16]:


mean_vals = df3.mean(numeric_only=True)
median_vals = df3.median(numeric_only=True)
mode_vals = df3.mode(numeric_only=True).iloc[0]


# In[17]:


variance_vals = df3.var(numeric_only=True)
std_dev_vals = df3.std(numeric_only=True)
range_vals = df3.max(numeric_only=True) - df3.min(numeric_only=True)


# In[18]:


skew_vals = df3.skew(numeric_only=True)
kurtosis_vals = df3.kurtosis(numeric_only=True)


# In[19]:


print("Mean:\n", mean_vals)


# In[20]:


print("\nMedian:\n", median_vals)


# In[21]:


print("\nMode:\n", mode_vals)


# In[22]:


print("\nVariance:\n", variance_vals)


# In[23]:


print("\nStandard Deviation:\n", std_dev_vals)


# In[24]:


print("\nRange:\n", range_vals)


# In[25]:


print("\nSkewness:\n", skew_vals)


# In[26]:


print("\nKurtosis:\n", kurtosis_vals)

