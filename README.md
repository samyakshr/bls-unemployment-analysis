# BLS Unemployment Analysis: Columbus vs. Ohio Metros

A comprehensive analysis of unemployment trends in Columbus, Ohio compared to other major Ohio metropolitan areas and the United States using seasonally adjusted data from FRED (Federal Reserve Economic Data).

## 📊 Analysis Overview

This project analyzes unemployment data from 2015-2024 for:
- **Columbus, OH** (COLU139UR)
- **Cincinnati, OH** (CINC139UR) 
- **Cleveland, OH** (CLEV439UR)
- **Ohio State** (OHUR)
- **United States** (National Average)

## 🎯 Key Findings

- **Columbus leads all metros** with the lowest average unemployment rate (4.24%)
- **Columbus outperforms** Ohio state by 0.65 percentage points and US by 0.44 percentage points
- **Consistent advantage** maintained throughout the entire 2015-2024 period
- **Strong COVID recovery** with Columbus showing the most resilience

## 📈 Results Story

### Columbus's Consistent Leadership

![Main Trends](visualizations/sa_main_trends.jpg)

The main trends chart reveals Columbus's sustained advantage over the entire decade. While all metros experienced similar economic cycles, Columbus consistently maintained the lowest unemployment rates, demonstrating remarkable economic stability.

### Columbus vs. Regional Peers

![Ranking Analysis](visualizations/sa_ranking.jpg)

Columbus clearly leads the pack with a 4.24% average unemployment rate, followed by Cincinnati (4.35%), United States (4.68%), Ohio state (4.89%), and Cleveland (5.24%). This ranking shows Columbus not only outperforms its Ohio peers but also beats the national average.

### COVID-19 Impact and Recovery

![COVID Analysis](visualizations/sa_covid_analysis.jpg)

The COVID-19 crisis tested all metros, but Columbus showed exceptional resilience. While all areas experienced sharp spikes in 2020, Columbus maintained the lowest peak unemployment and demonstrated the strongest recovery trajectory, reinforcing its economic leadership.

### Columbus vs. Ohio vs. United States

![Columbus Focus](visualizations/sa_columbus_focus.jpg)

This focused comparison highlights Columbus's consistent outperformance against both Ohio state and national benchmarks. The blue line representing Columbus runs consistently below both the dashed Ohio line and the dotted US line, showcasing sustained regional economic leadership.

### Distribution Analysis

![Boxplot Analysis](visualizations/sa_boxplot.jpg)

The distribution analysis reveals Columbus's superior performance across all statistical measures. Columbus shows the lowest median unemployment rate (4.0%) with the tightest distribution, indicating both lower unemployment and greater stability compared to other metros.

### Comprehensive Dashboard

![Dashboard View](visualizations/sa_dashboard.jpg)

The comprehensive dashboard synthesizes all key findings, providing a complete picture of Columbus's economic performance relative to regional and national benchmarks.

## 📁 Repository Structure

```
BLS/
├── README.md                           # This file
├── .gitignore                          # Git ignore rules
├── data/                               # Raw and processed data
│   ├── COLU139UR.csv                   # Columbus unemployment data (FRED)
│   ├── CINC139UR.csv                   # Cincinnati unemployment data (FRED)
│   ├── CLEV439UR.csv                   # Cleveland unemployment data (FRED)
│   ├── OHUR.csv                        # Ohio state unemployment data (FRED)
│   ├── seasonally_adjusted_unemployment.csv  # Combined clean dataset
│   └── sa_summary_statistics.csv       # Summary statistics
├── visualizations/                     # All generated charts and graphs
│   ├── sa_main_trends.jpg              # Main trends comparison
│   ├── sa_columbus_focus.jpg           # Columbus highlighted analysis
│   ├── sa_ranking.jpg                  # Metro ranking bar chart
│   ├── sa_covid_analysis.jpg           # COVID impact and recovery
│   ├── sa_columbus_ohio_us.jpg         # Columbus vs Ohio vs US
│   ├── sa_boxplot.jpg                  # Distribution analysis
│   └── sa_dashboard.jpg                # Combined dashboard view
└── code/                               # R analysis scripts
    ├── seasonally_adjusted_analysis.R  # Main analysis script
    └── R_Script_README.md              # Documentation for R scripts
```

## 🚀 Quick Start

1. **Clone the repository**
   ```bash
   git clone https://github.com/samyakshr/bls-unemployment-analysis.git
   cd bls-unemployment-analysis
   ```

2. **Install R dependencies**
   ```r
   install.packages(c("readr", "dplyr", "ggplot2", "scales", "lubridate", "tidyr", "gridExtra", "cowplot"))
   ```

3. **Run the analysis**
   ```r
   source("code/seasonally_adjusted_analysis.R")
   ```

## 📈 Results Summary

| Metro | Average Rate | Rank |
|-------|-------------|------|
| Columbus | 4.24% | 1st |
| Cincinnati | 4.35% | 2nd |
| United States | 4.68% | 3rd |
| Ohio | 4.89% | 4th |
| Cleveland | 5.24% | 5th |

## 🔍 Methodology

- **Data Source**: FRED (Federal Reserve Economic Data)
- **Seasonal Adjustment**: All data is seasonally adjusted for valid comparisons
- **Time Period**: January 2015 - December 2024
- **Analysis**: Time series analysis, statistical comparisons, and visualizations

## 📊 Data Sources

Bureau of Labor Statistics. "Unemployment Rate for Columbus, OH (MSA)." *Federal Reserve Economic Data*, Federal Reserve Bank of St. Louis, 2024, fred.stlouisfed.org/series/COLU139UR.

Bureau of Labor Statistics. "Unemployment Rate for Cincinnati, OH (MSA)." *Federal Reserve Economic Data*, Federal Reserve Bank of St. Louis, 2024, fred.stlouisfed.org/series/CINC139UR.

Bureau of Labor Statistics. "Unemployment Rate for Cleveland, OH (MSA)." *Federal Reserve Economic Data*, Federal Reserve Bank of St. Louis, 2024, fred.stlouisfed.org/series/CLEV439UR.

Bureau of Labor Statistics. "Unemployment Rate for Ohio." *Federal Reserve Economic Data*, Federal Reserve Bank of St. Louis, 2024, fred.stlouisfed.org/series/OHUR.

Bureau of Labor Statistics. "Unemployment Rate." *Federal Reserve Economic Data*, Federal Reserve Bank of St. Louis, 2024, fred.stlouisfed.org/series/UNRATE.

## 🛠️ Technical Details

- **Language**: R
- **Key Packages**: ggplot2, dplyr, scales, lubridate
- **Data Format**: CSV
- **Output Format**: JPG (300 DPI)

## 📝 License

This project is open source and available under the MIT License.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📞 Contact

For questions or suggestions, please open an issue in this repository.
