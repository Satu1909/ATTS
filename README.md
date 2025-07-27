# ATTS
This project showcases a comprehensive Exploratory Data Analysis (EDA) conducted using Python, SQL, and Excel on a coal price dataset. It involved meticulous cleaning, transformation, and interpretation of time-series data for various coal grades—RB_4800, RB_5500, RB_5700, and RB_6000—based, etc. on their closing prices in USD.

🧹 Data Cleaning & Null Handling
To ensure analytical accuracy, missing and anomalous values were addressed using a range of strategies:

Mean Imputation: Replaced missing values with the column-wise mean for continuous variables.

dropna(): Eliminated records with significant null entries where retention wasn't justifiable.

Forward Fill (ffill) & Backward Fill (bfill): Propagated adjacent non-null values to fill gaps in price sequences.

Advanced Techniques:

Interpolation was used to estimate intermediate coal prices for smoother time-series curves.

Predictive Imputation: Applied machine learning models to predict missing entries using temporal and cross-grade patterns.

Domain-Specific Constants: In cases of persistent absence, missing values were filled with conservative price estimates reflecting market trends.

📈 Statistical Analysis
Post-cleaning, key statistical metrics were computed using SQL and Python:

Central Tendency: Mean, median, and mode helped understand the overall level of coal prices per grade.

Dispersion Measures: Variance and standard deviation revealed price volatility, especially in RB_6000.

Skewness & Kurtosis: Assessed data symmetry and peakedness—highlighting market anomalies and sudden shifts.

📌 Observed Trends
Prices dropped sharply across all grades around mid-April, signaling a possible market disturbance.

The RB_6000 grade showed greater variance and kurtosis, indicating higher volatility and extreme value presence.

📊 Interactive Visualization
The final insights were embedded into a Power BI dashboard with the following features:

Dynamic time-series plots for each coal grade.

Distribution histograms showing skewness and kurtosis effects.

Filters for date ranges and grade comparisons to enable user-driven data exploration.
