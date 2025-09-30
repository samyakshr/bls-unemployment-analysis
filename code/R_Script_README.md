# BLS Unemployment Analysis - Complete R Script

## 📋 Overview
This is the comprehensive R script for the BLS unemployment analysis project (2015-2024). It combines all functionality from the previous individual scripts into one well-organized, reusable script.

## 🚀 How to Use

### Prerequisites
Make sure you have the following R packages installed:
```r
install.packages(c("readr", "dplyr", "ggplot2", "scales", "viridis", 
                   "ggthemes", "gridExtra", "cowplot", "lubridate", 
                   "tidyr", "psych", "car", "nortest", "broom"))
```

### Running the Script
1. Open `BLS_Unemployment_Analysis_Complete.R` in RStudio
2. Set your working directory to the BLS folder
3. Run the entire script (Ctrl+A, then Ctrl+Enter)
4. The script will automatically process data and create all visualizations

## 📊 What the Script Does

### Section 1: Data Processing
- Loads and processes BLS Excel files
- Combines metro and national data
- Cleans and standardizes data format
- Filters to 2015-2024 time period
- Saves cleaned data as CSV

### Section 2: Color Schemes
- Defines consistent color schemes for all visualizations
- Ensures professional appearance across all charts

### Section 3: Exploratory Data Analysis (EDA)
- Creates summary statistics
- Generates boxplots with fixed scales
- Creates time series plots (all metros and key metros)
- Creates EDA dashboard
- Saves all EDA visualizations as JPG files

### Section 4: Industry Analysis
- Creates industry-focused visualizations
- Generates executive summary data
- Creates professional business charts
- Saves all industry visualizations as JPG files

### Section 5: Academic Analysis
- Performs ANOVA and Tukey HSD tests
- Creates academic-style visualizations
- Generates statistical test results
- Saves academic analysis files

### Section 6: Statistical Assumption Checking
- Checks ANOVA assumptions
- Runs alternative tests if needed
- Provides statistical validation

### Section 7: Summary and Output
- Lists all created files
- Provides key findings summary
- Confirms analysis completion

## 📁 Output Files

### Data Files (CSV)
- `bls_unemployment_clean.csv` - Clean, processed data
- `eda_summary_statistics.csv` - EDA summary statistics
- `industry_executive_summary.csv` - Industry analysis summary
- `college_anova_results.csv` - ANOVA test results
- `college_tukey_results.csv` - Tukey HSD test results
- `college_summary_stats.csv` - Academic summary statistics

### EDA Visualizations (JPG)
- `eda_boxplot_metro.jpg` - Boxplots by metro
- `eda_time_series_all.jpg` - Time series (all metros)
- `eda_time_series_key.jpg` - Time series (key metros)
- `eda_dashboard.jpg` - EDA dashboard

### Industry Visualizations (JPG)
- `industry_main_trends.jpg` - Main trends chart
- `industry_columbus_focus.jpg` - Columbus focus chart
- `industry_ranking.jpg` - Metro ranking chart
- `industry_covid_analysis.jpg` - COVID analysis chart
- `industry_dashboard.jpg` - Industry dashboard

### Academic Visualizations (PNG)
- `college_boxplot.png` - Academic boxplot
- `college_timeseries.png` - Academic time series
- `college_violin.png` - Academic violin plot

## �� Customization

### Changing Time Period
To analyze a different time period, modify the filter in Section 1:
```r
filter(Date >= as.Date("2015-01-01") & Date < as.Date("2025-01-01"))
```

### Adding More Metros
To include additional metros, add them to the `metro_files` and `metro_names` vectors in Section 1.

### Modifying Visualizations
All visualization code is clearly marked by section. You can modify colors, themes, or chart types as needed.

## 📈 Key Features

- **Automated Processing**: Handles data loading, cleaning, and processing automatically
- **Comprehensive Analysis**: Includes EDA, industry analysis, and academic analysis
- **Professional Output**: Creates publication-ready visualizations
- **Statistical Rigor**: Includes proper statistical testing and assumption checking
- **Well-Documented**: Clear comments and section organization
- **Reusable**: Can be run multiple times with updated data

## 🎯 Usage Tips

1. **First Run**: The script will process Excel files and create the clean CSV
2. **Subsequent Runs**: The script will use the existing clean CSV for faster execution
3. **Customization**: Modify the script to suit your specific analysis needs
4. **Output Management**: All output files are saved in the working directory
5. **Error Handling**: The script includes basic error checking and informative messages

This comprehensive script provides everything needed for the BLS unemployment analysis project in one convenient, well-organized file.
