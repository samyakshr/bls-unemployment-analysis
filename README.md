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
   git clone [repository-url]
   cd BLS
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

## 📊 Visualizations

All visualizations are high-resolution (300 DPI) JPG files with white backgrounds, ready for presentations or reports. Located in the `visualizations/` folder.

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
