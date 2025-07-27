USE [Satyajeet]
GO

/****** Object:  Table [dbo].[CommodityPrices]    Script Date: 20-07-2025 13:22:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CommodityPrices](
	[Date] [date] NOT NULL,
	[Coal_RB_4800_FOB_London_Close_USD] [float] NULL,
	[Coal_RB_5500_FOB_London_Close_USD] [float] NULL,
	[Coal_RB_5700_FOB_London_Close_USD] [float] NULL,
	[Coal_RB_6000_FOB_CurrentWeek_Avg_USD] [float] NULL,
	[Coal_India_5500_CFR_London_Close_USD] [float] NULL,
	[Price_WTI] [float] NULL,
	[Price_Brent_Oil] [float] NULL,
	[Price_Dubai_Brent_Oil] [float] NULL,
	[Price_ExxonMobil] [float] NULL,
	[Price_Shenhua] [float] NULL,
	[Price_All_Share] [float] NULL,
	[Price_Mining] [float] NULL,
	[Price_LNG_Japan_Korea_Marker_PLATTS] [float] NULL,
	[Price_ZAR_USD] [float] NOT NULL,
	[Price_Natural_Gas] [float] NULL,
	[Price_ICE] [float] NULL,
	[Price_Dutch_TTF] [float] NULL,
	[Price_Indian_en_exg_rate] [float] NULL
) ON [PRIMARY]
GO

--VIEW ALL DATA--
SELECT * From CommodityPrices;
--FILL NULL VALUE USING AVERAGE--
SELECT 
    cp.date,
    COALESCE(cp.Coal_RB_4800_FOB_London_Close_USD, avg_vals.Coal_RB_4800_FOB_London_Close_USD) AS Coal_RB_4800_FOB_London_Close_USD,
    COALESCE(cp.Coal_RB_5500_FOB_London_Close_USD, avg_vals.Coal_RB_5500_FOB_London_Close_USD) AS Coal_RB_5500_FOB_London_Close_USD,
    COALESCE(cp.Coal_RB_5700_FOB_London_Close_USD, avg_vals.Coal_RB_5700_FOB_London_Close_USD) AS Coal_RB_5700_FOB_London_Close_USD,
    COALESCE(cp.Coal_RB_6000_FOB_CurrentWeek_Avg_USD, avg_vals.Coal_RB_6000_FOB_CurrentWeek_Avg_USD) AS Coal_RB_6000_FOB_CurrentWeek_Avg_USD,
    COALESCE(cp.Coal_India_5500_CFR_London_Close_USD, avg_vals.Coal_India_5500_CFR_London_Close_USD) AS Coal_India_5500_CFR_London_Close_USD,
    COALESCE(cp.Price_WTI, avg_vals.Price_WTI) AS Price_WTI,
    COALESCE(cp.Price_Brent_Oil, avg_vals.Price_Brent_Oil) AS Price_Brent_Oil,
    COALESCE(cp.Price_Dubai_Brent_Oil, avg_vals.Price_Dubai_Brent_Oil) AS Price_Dubai_Brent_Oil,
    COALESCE(cp.Price_ExxonMobil, avg_vals.Price_ExxonMobil) AS Price_ExxonMobil,
    COALESCE(cp.Price_Shenhua, avg_vals.Price_Shenhua) AS Price_Shenhua,
    COALESCE(cp.Price_All_Share, avg_vals.Price_All_Share) AS Price_All_Share,
    COALESCE(cp.Price_Mining, avg_vals.Price_Mining) AS Price_Mining,
    COALESCE(cp.Price_LNG_Japan_Korea_Marker_PLATTS, avg_vals.Price_LNG_Japan_Korea_Marker_PLATTS) AS Price_LNG_Japan_Korea_Marker_PLATTS,
    COALESCE(cp.Price_ZAR_USD, avg_vals.Price_ZAR_USD) AS Price_ZAR_USD,
    COALESCE(cp.Price_Natural_Gas, avg_vals.Price_Natural_Gas) AS Price_Natural_Gas,
    COALESCE(cp.Price_ICE, avg_vals.Price_ICE) AS Price_ICE,
    COALESCE(cp.Price_Dutch_TTF, avg_vals.Price_Dutch_TTF) AS Price_Dutch_TTF,
    COALESCE(cp.Price_Indian_en_exg_rate, avg_vals.Price_Indian_en_exg_rate) AS Price_Indian_en_exg_rate
FROM 
    CommodityPrices cp
JOIN (
    SELECT 
        AVG(Coal_RB_4800_FOB_London_Close_USD) AS Coal_RB_4800_FOB_London_Close_USD,
        AVG(Coal_RB_5500_FOB_London_Close_USD) AS Coal_RB_5500_FOB_London_Close_USD,
        AVG(Coal_RB_5700_FOB_London_Close_USD) AS Coal_RB_5700_FOB_London_Close_USD,
        AVG(Coal_RB_6000_FOB_CurrentWeek_Avg_USD) AS Coal_RB_6000_FOB_CurrentWeek_Avg_USD,
        AVG(Coal_India_5500_CFR_London_Close_USD) AS Coal_India_5500_CFR_London_Close_USD,
        AVG(Price_WTI) AS Price_WTI,
        AVG(Price_Brent_Oil) AS Price_Brent_Oil,
        AVG(Price_Dubai_Brent_Oil) AS Price_Dubai_Brent_Oil,
        AVG(Price_ExxonMobil) AS Price_ExxonMobil,
        AVG(Price_Shenhua) AS Price_Shenhua,
        AVG(Price_All_Share) AS Price_All_Share,
        AVG(Price_Mining) AS Price_Mining,
        AVG(Price_LNG_Japan_Korea_Marker_PLATTS) AS Price_LNG_Japan_Korea_Marker_PLATTS,
        AVG(Price_ZAR_USD) AS Price_ZAR_USD,
        AVG(Price_Natural_Gas) AS Price_Natural_Gas,
        AVG(Price_ICE) AS Price_ICE,
        AVG(Price_Dutch_TTF) AS Price_Dutch_TTF,
        AVG(Price_Indian_en_exg_rate) AS Price_Indian_en_exg_rate
    FROM 
        CommodityPrices
    WHERE 
        Coal_RB_4800_FOB_London_Close_USD IS NOT NULL 
) AS avg_vals ON 1=1;


    ---TO FIND MEAN---
  SELECT 
    AVG(Coal_RB_4800_FOB_London_Close_USD) AS Mean_Coal_RB_4800_FOB_London_Close_USD,
    AVG(Coal_RB_5500_FOB_London_Close_USD) AS Mean_Coal_RB_5500_FOB_London_Close_USD,
    AVG(Coal_RB_5700_FOB_London_Close_USD) AS Mean_Coal_RB_5700_FOB_London_Close_USD,
    AVG(Coal_RB_6000_FOB_CurrentWeek_Avg_USD) AS Mean_Coal_RB_6000_FOB_CurrentWeek_Avg_USD,
    AVG(Coal_India_5500_CFR_London_Close_USD) AS Mean_Coal_India_5500_CFR_London_Close_USD,
    AVG(Price_WTI) AS Mean_Price_WTI,
    AVG(Price_Brent_Oil) AS Mean_Price_Brent_Oil,
    AVG(Price_Dubai_Brent_Oil) AS Mean_Price_Dubai_Brent_Oil,
    AVG(Price_ExxonMobil) AS Mean_Price_ExxonMobil,
    AVG(Price_Shenhua) AS Mean_Price_Shenhua,
    AVG(Price_All_Share) AS Mean_Price_All_Share,
    AVG(Price_Mining) AS Mean_Price_Mining,
    AVG(Price_LNG_Japan_Korea_Marker_PLATTS) AS Mean_Price_LNG_Japan_Korea_Marker_PLATTS,
    AVG(Price_ZAR_USD) AS Mean_Price_ZAR_USD,
    AVG(Price_Natural_Gas) AS Mean_Price_Natural_Gas,
    AVG(Price_ICE) AS Mean_Price_ICE,
    AVG(Price_Dutch_TTF) AS Mean_Price_Dutch_TTF,
    AVG(Price_Indian_en_exg_rate) AS Mean_Price_Indian_en_exg_rate
FROM 
    CommodityPrices cp;  
 

 ---TO FIND MEDIAN---
SELECT TOP 1 Median_Coal_RB_4800
FROM (
  SELECT 
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Coal_RB_4800_FOB_London_Close_USD)
    OVER () AS Median_Coal_RB_4800
  FROM CommodityPrices cp
) AS sub;

SELECT TOP 1 Median_Coal_RB_4800 FROM (
  SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Coal_RB_4800_FOB_London_Close_USD) OVER () AS Median_Coal_RB_4800 FROM CommodityPrices cp
) sub;

SELECT TOP 1 Median_Coal_RB_5500 FROM (
  SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Coal_RB_5500_FOB_London_Close_USD) OVER () AS Median_Coal_RB_5500 FROM CommodityPrices cp
) sub;

SELECT TOP 1 Median_Coal_RB_5700 FROM (
  SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Coal_RB_5700_FOB_London_Close_USD) OVER () AS Median_Coal_RB_5700 FROM CommodityPrices cp
) sub;

SELECT TOP 1 Median_Coal_RB_6000 FROM (
  SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Coal_RB_6000_FOB_CurrentWeek_Avg_USD) OVER () AS Median_Coal_RB_6000 FROM CommodityPrices cp
) sub;

SELECT TOP 1 Median_Coal_India_5500 FROM (
  SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Coal_India_5500_CFR_London_Close_USD) OVER () AS Median_Coal_India_5500 FROM CommodityPrices cp
) sub;


SELECT TOP 1 Median_Price_WTI FROM (
  SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Price_WTI) OVER () AS Median_Price_WTI FROM CommodityPrices cp
) sub;

SELECT TOP 1 Median_Price_Brent_Oil FROM (
  SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Price_Brent_Oil) OVER () AS Median_Price_Brent_Oil FROM CommodityPrices cp
) sub;

SELECT TOP 1 Median_Price_Dubai_Brent_Oil FROM (
  SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Price_Dubai_Brent_Oil) OVER () AS Median_Price_Dubai_Brent_Oil FROM CommodityPrices cp
) sub;

SELECT TOP 1 Median_Price_ExxonMobil FROM (
  SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Price_ExxonMobil) OVER () AS Median_Price_ExxonMobil FROM CommodityPrices cp
) sub;

SELECT TOP 1 Median_Price_Shenhua FROM (
  SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Price_Shenhua) OVER () AS Median_Price_Shenhua FROM CommodityPrices cp
) sub;


SELECT TOP 1 Median_Price_All_Share FROM (
  SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Price_All_Share) OVER () AS Median_Price_All_Share FROM CommodityPrices cp
) sub;

SELECT TOP 1 Median_Price_Mining FROM (
  SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Price_Mining) OVER () AS Median_Price_Mining FROM CommodityPrices cp
) sub;

SELECT TOP 1 Median_Price_LNG_Japan_Korea FROM (
  SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Price_LNG_Japan_Korea_Marker_PLATTS) OVER () AS Median_Price_LNG_Japan_Korea FROM CommodityPrices cp
) sub;

SELECT TOP 1 Median_Price_ZAR_USD FROM (
  SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Price_ZAR_USD) OVER () AS Median_Price_ZAR_USD FROM CommodityPrices cp
) sub;

SELECT TOP 1 Median_Price_Natural_Gas FROM (
  SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Price_Natural_Gas) OVER () AS Median_Price_Natural_Gas FROM CommodityPrices cp
) sub;

SELECT TOP 1 Median_Price_ICE FROM (
  SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Price_ICE) OVER () AS Median_Price_ICE FROM CommodityPrices cp
) sub;

SELECT TOP 1 Median_Price_Dutch_TTF FROM (
  SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Price_Dutch_TTF) OVER () AS Median_Price_Dutch_TTF FROM CommodityPrices cp
) sub;

SELECT TOP 1 Median_Price_Indian_Exchange FROM (
  SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Price_Indian_en_exg_rate) OVER () AS Median_Price_Indian_Exchange FROM CommodityPrices cp
) sub;

---TO FIND MODE---

SELECT TOP 1 Coal_RB_4800_FOB_London_Close_USD AS Mode_Coal_RB_4800 FROM CommodityPrices cp WHERE Coal_RB_4800_FOB_London_Close_USD IS NOT NULL GROUP BY Coal_RB_4800_FOB_London_Close_USD ORDER BY COUNT(*) DESC;
SELECT TOP 1 Coal_RB_5500_FOB_London_Close_USD AS Mode_Coal_RB_5500 FROM CommodityPrices cp WHERE Coal_RB_5500_FOB_London_Close_USD IS NOT NULL GROUP BY Coal_RB_5500_FOB_London_Close_USD ORDER BY COUNT(*) DESC;
SELECT TOP 1 Coal_RB_5700_FOB_London_Close_USD AS Mode_Coal_RB_5700 FROM CommodityPrices cp WHERE Coal_RB_5700_FOB_London_Close_USD IS NOT NULL GROUP BY Coal_RB_5700_FOB_London_Close_USD ORDER BY COUNT(*) DESC;
SELECT TOP 1 Coal_RB_6000_FOB_CurrentWeek_Avg_USD AS Mode_Coal_RB_6000 FROM CommodityPrices cp WHERE Coal_RB_6000_FOB_CurrentWeek_Avg_USD IS NOT NULL GROUP BY Coal_RB_6000_FOB_CurrentWeek_Avg_USD ORDER BY COUNT(*) DESC;
SELECT TOP 1 Coal_India_5500_CFR_London_Close_USD AS Mode_Coal_India_5500 FROM CommodityPrices cp WHERE Coal_India_5500_CFR_London_Close_USD IS NOT NULL GROUP BY Coal_India_5500_CFR_London_Close_USD ORDER BY COUNT(*) DESC;
SELECT TOP 1 Price_WTI AS Mode_Price_WTI FROM CommodityPrices cp WHERE Price_WTI IS NOT NULL GROUP BY Price_WTI ORDER BY COUNT(*) DESC;
SELECT TOP 1 Price_Brent_Oil AS Mode_Price_Brent_Oil FROM CommodityPrices cp WHERE Price_Brent_Oil IS NOT NULL GROUP BY Price_Brent_Oil ORDER BY COUNT(*) DESC;
SELECT TOP 1 Price_Dubai_Brent_Oil AS Mode_Price_Dubai_Brent_Oil FROM CommodityPrices cp WHERE Price_Dubai_Brent_Oil IS NOT NULL GROUP BY Price_Dubai_Brent_Oil ORDER BY COUNT(*) DESC;
SELECT TOP 1 Price_ExxonMobil AS Mode_Price_ExxonMobil FROM CommodityPrices cp WHERE Price_ExxonMobil IS NOT NULL GROUP BY Price_ExxonMobil ORDER BY COUNT(*) DESC;
SELECT TOP 1 Price_Shenhua AS Mode_Price_Shenhua FROM CommodityPrices cp WHERE Price_Shenhua IS NOT NULL GROUP BY Price_Shenhua ORDER BY COUNT(*) DESC;
SELECT TOP 1 Price_All_Share AS Mode_Price_All_Share FROM CommodityPrices cp WHERE Price_All_Share IS NOT NULL GROUP BY Price_All_Share ORDER BY COUNT(*) DESC;
SELECT TOP 1 Price_Mining AS Mode_Price_Mining FROM CommodityPrices cp WHERE Price_Mining IS NOT NULL GROUP BY Price_Mining ORDER BY COUNT(*) DESC;
SELECT TOP 1 Price_LNG_Japan_Korea_Marker_PLATTS AS Mode_Price_LNG_Japan_Korea FROM CommodityPrices cp WHERE Price_LNG_Japan_Korea_Marker_PLATTS IS NOT NULL GROUP BY Price_LNG_Japan_Korea_Marker_PLATTS ORDER BY COUNT(*) DESC;
SELECT TOP 1 Price_ZAR_USD AS Mode_Price_ZAR_USD FROM CommodityPrices cp WHERE Price_ZAR_USD IS NOT NULL GROUP BY Price_ZAR_USD ORDER BY COUNT(*) DESC;
SELECT TOP 1 Price_Natural_Gas AS Mode_Price_Natural_Gas FROM CommodityPrices cp WHERE Price_Natural_Gas IS NOT NULL GROUP BY Price_Natural_Gas ORDER BY COUNT(*) DESC;
SELECT TOP 1 Price_ICE AS Mode_Price_ICE FROM CommodityPrices cp WHERE Price_ICE IS NOT NULL GROUP BY Price_ICE ORDER BY COUNT(*) DESC;
SELECT TOP 1 Price_Dutch_TTF AS Mode_Price_Dutch_TTF FROM CommodityPrices cp WHERE Price_Dutch_TTF IS NOT NULL GROUP BY Price_Dutch_TTF ORDER BY COUNT(*) DESC;
SELECT TOP 1 Price_Indian_en_exg_rate AS Mode_Price_Indian_Exchange FROM CommodityPrices cp WHERE Price_Indian_en_exg_rate IS NOT NULL GROUP BY Price_Indian_en_exg_rate ORDER BY COUNT(*) DESC;


---VARIANCE--- 
 SELECT
VAR(Coal_RB_4800_FOB_London_Close_USD) AS Variance_Coal_RB_4800_FOB_London_Close_USD,
VAR(Coal_RB_5500_FOB_London_Close_USD) AS Variance_Coal_RB_5500_FOB_London_Close_USD,
VAR(Coal_RB_5700_FOB_London_Close_USD) AS Variance_Coal_RB_5700_FOB_London_Close_USD,
VAR(Coal_RB_6000_FOB_CurrentWeek_Avg_USD) AS Variance_Coal_RB_6000_FOB_CurrentWeek_Avg_USD,
VAR(Coal_India_5500_CFR_London_Close_USD) AS Variance_Coal_India_5500_CFR_London_Close_USD,
VAR(Price_WTI) AS Variance_Price_WTI,
VAR(Price_Brent_Oil) AS Variance_Price_Brent_Oil,
VAR(Price_Dubai_Brent_Oil) AS Variance_Price_Dubai_Brent_Oil,
VAR(Price_ExxonMobil) AS Variance_Price_ExxonMobil,
VAR(Price_Shenhua) AS Variance_Price_Shenhua,
VAR(Price_All_Share) AS Variance_Price_All_Share,
VAR(Price_Mining) AS Variance_Price_Mining,
VAR(Price_LNG_Japan_Korea_Marker_PLATTS) AS Variance_Price_LNG_Japan_Korea_Marker_PLATTS,
VAR(Price_ZAR_USD) AS Variance_Price_ZAR_USD,
VAR(Price_Natural_Gas) AS Variance_Price_Natural_Gas,
VAR(Price_ICE) AS Variance_Price_ICE,
VAR(Price_Dutch_TTF) AS Variance_Price_Dutch_TTF,
VAR(Price_Indian_en_exg_rate) AS Variance_Price_Indian_en_exg_rate 
FROM CommodityPrices cp;


--Standard Deviation--
SELECT
STDEV(Coal_RB_4800_FOB_London_Close_USD) AS std_deviation_Coal_RB_4800_FOB_London_Close_USD,
STDEV(Coal_RB_5500_FOB_London_Close_USD) AS std_deviation_Coal_RB_5500_FOB_London_Close_USD,
STDEV(Coal_RB_5700_FOB_London_Close_USD) AS std_deviation_Coal_RB_5700_FOB_London_Close_USD,
STDEV(Coal_RB_6000_FOB_CurrentWeek_Avg_USD) AS std_deviation_Coal_RB_6000_FOB_CurrentWeek_Avg_USD,
STDEV(Coal_India_5500_CFR_London_Close_USD) AS std_deviation_Coal_India_5500_CFR_London_Close_USD,
STDEV(Price_WTI) AS std_deviation_Price_WTI,
STDEV(Price_Brent_Oil) AS std_deviation_Price_Brent_Oil,
STDEV(Price_Dubai_Brent_Oil) AS std_deviation_Price_Dubai_Brent_Oil,
STDEV(Price_ExxonMobil) AS std_deviation_Price_ExxonMobil,
STDEV(Price_Shenhua) AS std_deviation_Price_Shenhua,
STDEV(Price_All_Share) AS std_deviation_Price_All_Share,
STDEV(Price_Mining) AS std_deviation_Price_Mining,
STDEV(Price_LNG_Japan_Korea_Marker_PLATTS) AS std_deviation_Price_LNG_Japan_Korea_Marker_PLATTS,
STDEV(Price_ZAR_USD) AS std_deviation_Price_ZAR_USD,
STDEV(Price_Natural_Gas) AS std_deviation_Price_Natural_Gas,
STDEV(Price_ICE) AS std_deviation_Price_ICE,
STDEV(Price_Dutch_TTF) AS std_deviation_Price_Dutch_TTF,
STDEV(Price_Indian_en_exg_rate) AS std_deviation_Price_Indian_en_exg_rate 
FROM CommodityPrices cp;

--SKEWNESS--

WITH Stats AS (
    SELECT
        AVG(Coal_RB_4800_FOB_London_Close_USD) AS mean_Coal_RB_4800,
        STDEVP(Coal_RB_4800_FOB_London_Close_USD) AS stddev_Coal_RB_4800,
        
        AVG(Coal_RB_5500_FOB_London_Close_USD) AS mean_Coal_RB_5500,
        STDEVP(Coal_RB_5500_FOB_London_Close_USD) AS stddev_Coal_RB_5500,
        
        AVG(Coal_RB_5700_FOB_London_Close_USD) AS mean_Coal_RB_5700,
        STDEVP(Coal_RB_5700_FOB_London_Close_USD) AS stddev_Coal_RB_5700,
        
        AVG(Coal_RB_6000_FOB_CurrentWeek_Avg_USD) AS mean_Coal_RB_6000,
        STDEVP(Coal_RB_6000_FOB_CurrentWeek_Avg_USD) AS stddev_Coal_RB_6000,
        
        AVG(Coal_India_5500_CFR_London_Close_USD) AS mean_Coal_India,
        STDEVP(Coal_India_5500_CFR_London_Close_USD) AS stddev_Coal_India,
        
        AVG(Price_WTI) AS mean_WTI,
        STDEVP(Price_WTI) AS stddev_WTI,
        
        AVG(Price_Brent_Oil) AS mean_Brent,
        STDEVP(Price_Brent_Oil) AS stddev_Brent,
        
        AVG(Price_Dubai_Brent_Oil) AS mean_Dubai,
        STDEVP(Price_Dubai_Brent_Oil) AS stddev_Dubai,
        
        AVG(Price_ExxonMobil) AS mean_ExxonMobil,
        STDEVP(Price_ExxonMobil) AS stddev_ExxonMobil,
        
        AVG(Price_Shenhua) AS mean_Shenhua,
        STDEVP(Price_Shenhua) AS stddev_Shenhua,
        
        AVG(Price_All_Share) AS mean_All_Share,
        STDEVP(Price_All_Share) AS stddev_All_Share,
        
        AVG(Price_Mining) AS mean_Mining,
        STDEVP(Price_Mining) AS stddev_Mining,
        
        AVG(Price_LNG_Japan_Korea_Marker_PLATTS) AS mean_LNG,
        STDEVP(Price_LNG_Japan_Korea_Marker_PLATTS) AS stddev_LNG,
        
        AVG(Price_ZAR_USD) AS mean_ZAR,
        STDEVP(Price_ZAR_USD) AS stddev_ZAR,
        
        AVG(Price_Natural_Gas) AS mean_Gas,
        STDEVP(Price_Natural_Gas) AS stddev_Gas,
        
        AVG(Price_ICE) AS mean_ICE,
        STDEVP(Price_ICE) AS stddev_ICE,
        
        AVG(Price_Dutch_TTF) AS mean_TTF,
        STDEVP(Price_Dutch_TTF) AS stddev_TTF,
        
        AVG(Price_Indian_en_exg_rate) AS mean_INR,
        STDEVP(Price_Indian_en_exg_rate) AS stddev_INR
    FROM CommodityPrices cp
),
Moments AS (
    SELECT
        POWER(Coal_RB_4800_FOB_London_Close_USD - Stats.mean_Coal_RB_4800, 3) AS skew_Coal_RB_4800,
        POWER(Coal_RB_5500_FOB_London_Close_USD - Stats.mean_Coal_RB_5500, 3) AS skew_Coal_RB_5500,
        POWER(Coal_RB_5700_FOB_London_Close_USD - Stats.mean_Coal_RB_5700, 3) AS skew_Coal_RB_5700,
        POWER(Coal_RB_6000_FOB_CurrentWeek_Avg_USD - Stats.mean_Coal_RB_6000, 3) AS skew_Coal_RB_6000,
        POWER(Coal_India_5500_CFR_London_Close_USD - Stats.mean_Coal_India, 3) AS skew_Coal_India,
        POWER(Price_WTI - Stats.mean_WTI, 3) AS skew_Price_WTI,
        POWER(Price_Brent_Oil - Stats.mean_Brent, 3) AS skew_Price_Brent_Oil,
        POWER(Price_Dubai_Brent_Oil - Stats.mean_Dubai, 3) AS skew_Price_Dubai_Brent_Oil,
        POWER(Price_ExxonMobil - Stats.mean_ExxonMobil, 3) AS skew_Price_ExxonMobil,
        POWER(Price_Shenhua - Stats.mean_Shenhua, 3) AS skew_Price_Shenhua,
        POWER(Price_All_Share - Stats.mean_All_Share, 3) AS skew_Price_All_Share,
        POWER(Price_Mining - Stats.mean_Mining, 3) AS skew_Price_Mining,
        POWER(Price_LNG_Japan_Korea_Marker_PLATTS - Stats.mean_LNG, 3) AS skew_Price_LNG,
        POWER(Price_ZAR_USD - Stats.mean_ZAR, 3) AS skew_Price_ZAR_USD,
        POWER(Price_Natural_Gas - Stats.mean_Gas, 3) AS skew_Price_Natural_Gas,
        POWER(Price_ICE - Stats.mean_ICE, 3) AS skew_Price_ICE,
        POWER(Price_Dutch_TTF - Stats.mean_TTF, 3) AS skew_Price_TTF,
        POWER(Price_Indian_en_exg_rate - Stats.mean_INR, 3) AS skew_Price_INR
    FROM CommodityPrices cp, Stats
    )
SELECT
    SUM(skew_Coal_RB_4800) / (COUNT(*) * POWER((SELECT stddev_Coal_RB_4800 FROM Stats), 3)) AS skew_Coal_RB_4800,
    SUM(skew_Coal_RB_5500) / (COUNT(*) * POWER((SELECT stddev_Coal_RB_5500 FROM Stats), 3)) AS skew_Coal_RB_5500,
    SUM(skew_Coal_RB_5700) / (COUNT(*) * POWER((SELECT stddev_Coal_RB_5700 FROM Stats), 3)) AS skew_Coal_RB_5700,
    SUM(skew_Coal_RB_6000) / (COUNT(*) * POWER((SELECT stddev_Coal_RB_6000 FROM Stats), 3)) AS skew_Coal_RB_6000,
    SUM(skew_Coal_India) / (COUNT(*) * POWER((SELECT stddev_Coal_India FROM Stats), 3)) AS skew_Coal_India,
    SUM(skew_Price_WTI) / (COUNT(*) * POWER((SELECT stddev_WTI FROM Stats), 3)) AS skew_Price_WTI,
    SUM(skew_Price_Brent_Oil) / (COUNT(*) * POWER((SELECT stddev_Brent FROM Stats), 3)) AS skew_Price_Brent_Oil,
    SUM(skew_Price_Dubai_Brent_Oil) / (COUNT(*) * POWER((SELECT stddev_Dubai FROM Stats), 3)) AS skew_Price_Dubai_Brent_Oil,
    SUM(skew_Price_ExxonMobil) / (COUNT(*) * POWER((SELECT stddev_ExxonMobil FROM Stats), 3)) AS skew_Price_ExxonMobil,
    SUM(skew_Price_Shenhua) / (COUNT(*) * POWER((SELECT stddev_Shenhua FROM Stats), 3)) AS skew_Price_Shenhua,
    SUM(skew_Price_All_Share) / (COUNT(*) * POWER((SELECT stddev_All_Share FROM Stats), 3)) AS skew_Price_All_Share,
    SUM(skew_Price_Mining) / (COUNT(*) * POWER((SELECT stddev_Mining FROM Stats), 3)) AS skew_Price_Mining,
    SUM(skew_Price_LNG) / (COUNT(*) * POWER((SELECT stddev_LNG FROM Stats), 3)) AS skew_Price_LNG,
    SUM(skew_Price_ZAR_USD) / (COUNT(*) * POWER((SELECT stddev_ZAR FROM Stats), 3)) AS skew_Price_ZAR_USD,
    SUM(skew_Price_Natural_Gas) / (COUNT(*) * POWER((SELECT stddev_Gas FROM Stats), 3)) AS skew_Price_Natural_Gas,
    SUM(skew_Price_ICE) / (COUNT(*) * POWER((SELECT stddev_ICE FROM Stats), 3)) AS skew_Price_ICE,
    SUM(skew_Price_TTF) / (COUNT(*) * POWER((SELECT stddev_TTF FROM Stats), 3)) AS skew_Price_TTF,
    SUM(skew_Price_INR) / (COUNT(*) * POWER((SELECT stddev_INR FROM Stats), 3)) AS skew_Price_INR
    from Moments;

    --KURTOSIS--

 WITH stats AS (
    SELECT 
        AVG(Coal_RB_4800_FOB_London_Close_USD) AS mean_4800,
        STDEV(Coal_RB_4800_FOB_London_Close_USD) AS stdev_4800,

        AVG(Coal_RB_5500_FOB_London_Close_USD) AS mean_5500,
        STDEV(Coal_RB_5500_FOB_London_Close_USD) AS stdev_5500,

        AVG(Coal_RB_5700_FOB_London_Close_USD) AS mean_5700,
        STDEV(Coal_RB_5700_FOB_London_Close_USD) AS stdev_5700,

        AVG(Coal_RB_6000_FOB_CurrentWeek_Avg_USD) AS mean_6000,
        STDEV(Coal_RB_6000_FOB_CurrentWeek_Avg_USD) AS stdev_6000,

        AVG(Coal_India_5500_CFR_London_Close_USD) AS mean_Coal_India,
        STDEV(Coal_India_5500_CFR_London_Close_USD) AS stdev_Coal_India,

        AVG(Price_WTI) AS mean_WTI, STDEV(Price_WTI) AS stdev_WTI,
        AVG(Price_Brent_Oil) AS mean_Brent, STDEV(Price_Brent_Oil) AS stdev_Brent,
        AVG(Price_Dubai_Brent_Oil) AS mean_Dubai, STDEV(Price_Dubai_Brent_Oil) AS stdev_Dubai,
        AVG(Price_ExxonMobil) AS mean_Exxon, STDEV(Price_ExxonMobil) AS stdev_Exxon,
        AVG(Price_Shenhua) AS mean_Shenhua, STDEV(Price_Shenhua) AS stdev_Shenhua,
        AVG(Price_All_Share) AS mean_All_Share, STDEV(Price_All_Share) AS stdev_All_Share,
        AVG(Price_Mining) AS mean_Mining, STDEV(Price_Mining) AS stdev_Mining,
        AVG(Price_LNG_Japan_Korea_Marker_PLATTS) AS mean_LNG, STDEV(Price_LNG_Japan_Korea_Marker_PLATTS) AS stdev_LNG,
        AVG(Price_ZAR_USD) AS mean_ZAR, STDEV(Price_ZAR_USD) AS stdev_ZAR,
        AVG(Price_Natural_Gas) AS mean_NG, STDEV(Price_Natural_Gas) AS stdev_NG,
        AVG(Price_ICE) AS mean_ICE, STDEV(Price_ICE) AS stdev_ICE,
        AVG(Price_Dutch_TTF) AS mean_TTF, STDEV(Price_Dutch_TTF) AS stdev_TTF,
        AVG(Price_Indian_en_exg_rate) AS mean_INR, STDEV(Price_Indian_en_exg_rate) AS stdev_INR
    FROM CommodityPrices
),
calc AS (
    SELECT *,
        POWER(Coal_RB_4800_FOB_London_Close_USD - s.mean_4800, 4) AS pow4_4800,
        POWER(Coal_RB_5500_FOB_London_Close_USD - s.mean_5500, 4) AS pow4_5500,
        POWER(Coal_RB_5700_FOB_London_Close_USD - s.mean_5700, 4) AS pow4_5700,
        POWER(Coal_RB_6000_FOB_CurrentWeek_Avg_USD - s.mean_6000, 4) AS pow4_6000,
        POWER(Coal_India_5500_CFR_London_Close_USD - s.mean_Coal_India, 4) AS pow4_Coal_India,
        POWER(Price_WTI - s.mean_WTI, 4) AS pow4_WTI,
        POWER(Price_Brent_Oil - s.mean_Brent, 4) AS pow4_Brent,
        POWER(Price_Dubai_Brent_Oil - s.mean_Dubai, 4) AS pow4_Dubai,
        POWER(Price_ExxonMobil - s.mean_Exxon, 4) AS pow4_Exxon,
        POWER(Price_Shenhua - s.mean_Shenhua, 4) AS pow4_Shenhua,
        POWER(Price_All_Share - s.mean_All_Share, 4) AS pow4_All_Share,
        POWER(Price_Mining - s.mean_Mining, 4) AS pow4_Mining,
        POWER(Price_LNG_Japan_Korea_Marker_PLATTS - s.mean_LNG, 4) AS pow4_LNG,
        POWER(Price_ZAR_USD - s.mean_ZAR, 4) AS pow4_ZAR,
        POWER(Price_Natural_Gas - s.mean_NG, 4) AS pow4_NG,
        POWER(Price_ICE - s.mean_ICE, 4) AS pow4_ICE,
        POWER(Price_Dutch_TTF - s.mean_TTF, 4) AS pow4_TTF,
        POWER(Price_Indian_en_exg_rate - s.mean_INR, 4) AS pow4_INR
    FROM CommodityPrices cp CROSS JOIN stats s
)
SELECT
    SUM(pow4_4800) / (COUNT(*) * POWER((SELECT stdev_4800 FROM stats), 4)) AS kurt_Coal_RB_4800,
    SUM(pow4_5500) / (COUNT(*) * POWER((SELECT stdev_5500 FROM stats), 4)) AS kurt_Coal_RB_5500,
    SUM(pow4_5700) / (COUNT(*) * POWER((SELECT stdev_5700 FROM stats), 4)) AS kurt_Coal_RB_5700,
    SUM(pow4_6000) / (COUNT(*) * POWER((SELECT stdev_6000 FROM stats), 4)) AS kurt_Coal_RB_6000,
    SUM(pow4_Coal_India) / (COUNT(*) * POWER((SELECT stdev_Coal_India FROM stats), 4)) AS kurt_Coal_India,
    SUM(pow4_WTI) / (COUNT(*) * POWER((SELECT stdev_WTI FROM stats), 4)) AS kurt_Price_WTI,
    SUM(pow4_Brent) / (COUNT(*) * POWER((SELECT stdev_Brent FROM stats), 4)) AS kurt_Price_Brent_Oil,
    SUM(pow4_Dubai) / (COUNT(*) * POWER((SELECT stdev_Dubai FROM stats), 4)) AS kurt_Price_Dubai_Brent_Oil,
    SUM(pow4_Exxon) / (COUNT(*) * POWER((SELECT stdev_Exxon FROM stats), 4)) AS kurt_Price_ExxonMobil,
    SUM(pow4_Shenhua) / (COUNT(*) * POWER((SELECT stdev_Shenhua FROM stats), 4)) AS kurt_Price_Shenhua,
    SUM(pow4_All_Share) / (COUNT(*) * POWER((SELECT stdev_All_Share FROM stats), 4)) AS kurt_Price_All_Share,
    SUM(pow4_Mining) / (COUNT(*) * POWER((SELECT stdev_Mining FROM stats), 4)) AS kurt_Price_Mining,
    SUM(pow4_LNG) / (COUNT(*) * POWER((SELECT stdev_LNG FROM stats), 4)) AS kurt_Price_LNG,
    SUM(pow4_ZAR) / (COUNT(*) * POWER((SELECT stdev_ZAR FROM stats), 4)) AS kurt_Price_ZAR_USD,
    SUM(pow4_NG) / (COUNT(*) * POWER((SELECT stdev_NG FROM stats), 4)) AS kurt_Price_Natural_Gas,
    SUM(pow4_ICE) / (COUNT(*) * POWER((SELECT stdev_ICE FROM stats), 4)) AS kurt_Price_ICE,
    SUM(pow4_TTF) / (COUNT(*) * POWER((SELECT stdev_TTF FROM stats), 4)) AS kurt_Price_TTF,
    SUM(pow4_INR) / (COUNT(*) * POWER((SELECT stdev_INR FROM stats), 4)) AS kurt_Price_INR
FROM calc;

  
  
