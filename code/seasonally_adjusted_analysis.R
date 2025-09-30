# Fixed Seasonally Adjusted Unemployment Analysis
# Using FRED data for Columbus, Cincinnati, Cleveland, Ohio, and US
# Author: [Your Name]
# Date: [Current Date]

# Load required libraries
library(readr)
library(dplyr)
library(ggplot2)
library(scales)
library(lubridate)
library(tidyr)
library(gridExtra)
library(cowplot)

# Set working directory
setwd("/Users/samyakshrestha/Downloads/BLS")

cat("=== FIXED SEASONALLY ADJUSTED UNEMPLOYMENT ANALYSIS ===\n")

# Load all seasonally adjusted data
columbus_sa <- read_csv("COLU139UR.csv") %>%
  mutate(observation_date = as.Date(observation_date)) %>%
  rename(UnemploymentRate = COLU139UR) %>%
  mutate(Metro = "Columbus")

cincinnati_sa <- read_csv("CINC139UR.csv") %>%
  mutate(observation_date = as.Date(observation_date)) %>%
  rename(UnemploymentRate = CINC139UR) %>%
  mutate(Metro = "Cincinnati")

cleveland_sa <- read_csv("CLEV439UR.csv") %>%
  mutate(observation_date = as.Date(observation_date)) %>%
  rename(UnemploymentRate = CLEV439UR) %>%
  mutate(Metro = "Cleveland")

ohio_sa <- read_csv("OHUR.csv") %>%
  mutate(observation_date = as.Date(observation_date)) %>%
  rename(UnemploymentRate = OHUR) %>%
  mutate(Metro = "Ohio")

# Load US data from our existing clean dataset (already seasonally adjusted)
us_sa <- read_csv("bls_unemployment_clean.csv") %>%
  filter(Metro == "United States") %>%
  select(Date, UnemploymentRate) %>%
  rename(observation_date = Date) %>%
  mutate(observation_date = as.Date(observation_date)) %>%
  mutate(Metro = "United States")

# Combine all seasonally adjusted data
sa_data <- bind_rows(columbus_sa, cincinnati_sa, cleveland_sa, ohio_sa, us_sa) %>%
  filter(observation_date >= as.Date("2015-01-01") & observation_date < as.Date("2025-01-01")) %>%
  arrange(observation_date, Metro)

cat("Data loaded:", nrow(sa_data), "observations\n")
cat("Metros:", paste(unique(sa_data$Metro), collapse = ", "), "\n")
cat("Date range:", min(sa_data$observation_date), "to", max(sa_data$observation_date), "\n\n")

# Calculate summary statistics
sa_summary <- sa_data %>%
  group_by(Metro) %>%
  summarise(
    n = n(),
    mean_rate = round(mean(UnemploymentRate, na.rm = TRUE), 3),
    median_rate = round(median(UnemploymentRate, na.rm = TRUE), 3),
    min_rate = round(min(UnemploymentRate, na.rm = TRUE), 3),
    max_rate = round(max(UnemploymentRate, na.rm = TRUE), 3),
    sd_rate = round(sd(UnemploymentRate, na.rm = TRUE), 3)
  ) %>%
  arrange(mean_rate)

cat("Seasonally Adjusted Summary Statistics:\n")
print(sa_summary)

# Create color scheme
metro_colors <- c(
  "Columbus" = "#1f77b4",
  "Cincinnati" = "#ff7f0e",
  "Cleveland" = "#2ca02c",
  "Ohio" = "#2E8B57",
  "United States" = "#e377c2"
)

# =============================================================================
# 1. MAIN TRENDS CHART (Seasonally Adjusted)
# =============================================================================

cat("Creating main trends chart...\n")

main_trends_sa <- ggplot(sa_data, aes(x = observation_date, y = UnemploymentRate, color = Metro)) +
  geom_line(aes(linetype = Metro, linewidth = Metro)) +
  scale_color_manual(values = metro_colors) +
  scale_linetype_manual(values = c(
    "Columbus" = "solid", "Cincinnati" = "solid", "Cleveland" = "solid",
    "Ohio" = "dashed", "United States" = "dotted"
  )) +
  scale_linewidth_manual(values = c(
    "Columbus" = 2, "Cincinnati" = 1.5, "Cleveland" = 1.5,
    "Ohio" = 1.5, "United States" = 1.2
  )) +
  scale_x_date(date_labels = "%Y", date_breaks = "2 years") +
  scale_y_continuous(labels = scales::percent_format(scale = 1)) +
  labs(
    title = "Seasonally Adjusted Unemployment Rate Trends (2015-2024)",
    subtitle = "Columbus consistently outperforms regional and national benchmarks",
    x = "Date",
    y = "Unemployment Rate (%)",
    color = "Metro Area"
  ) +
  theme_minimal() +
  theme(
    legend.position = "bottom",
    panel.grid.minor = element_blank(),
    plot.background = element_rect(fill = "white", color = NA),
    panel.background = element_rect(fill = "white", color = NA)
  ) +
  guides(linetype = "none", linewidth = "none")

ggsave("sa_main_trends.jpg", main_trends_sa, width = 14, height = 8, dpi = 300, bg = "white")

# =============================================================================
# 2. COLUMBUS FOCUS CHART
# =============================================================================

cat("Creating Columbus focus chart...\n")

columbus_focus_sa <- ggplot(sa_data, aes(x = observation_date, y = UnemploymentRate)) +
  geom_line(data = sa_data %>% filter(Metro != "Columbus"), 
            aes(color = Metro), alpha = 0.6, linewidth = 1) +
  geom_line(data = sa_data %>% filter(Metro == "Columbus"), 
            aes(color = Metro), linewidth = 2.5) +
  scale_color_manual(values = metro_colors) +
  scale_x_date(date_labels = "%Y", date_breaks = "2 years") +
  scale_y_continuous(labels = scales::percent_format(scale = 1)) +
  labs(
    title = "Columbus Unemployment Performance vs. Regional & National Benchmarks (2015-2024)",
    subtitle = "Seasonally adjusted data showing Columbus's sustained advantage",
    x = "Date",
    y = "Unemployment Rate (%)",
    color = "Metro Area"
  ) +
  theme_minimal() +
  theme(
    legend.position = "bottom",
    panel.grid.minor = element_blank(),
    plot.background = element_rect(fill = "white", color = NA),
    panel.background = element_rect(fill = "white", color = NA)
  )

ggsave("sa_columbus_focus.jpg", columbus_focus_sa, width = 14, height = 8, dpi = 300, bg = "white")

# =============================================================================
# 3. RANKING CHART
# =============================================================================

cat("Creating ranking chart...\n")

ranking_data_sa <- sa_data %>%
  group_by(Metro) %>%
  summarise(avg_rate = mean(UnemploymentRate, na.rm = TRUE)) %>%
  ungroup() %>%
  mutate(
    Metro = factor(Metro, levels = Metro[order(avg_rate)]),
    is_columbus = Metro == "Columbus"
  )

ranking_sa <- ggplot(ranking_data_sa, aes(x = Metro, y = avg_rate, fill = is_columbus)) +
  geom_col(alpha = 0.8) +
  geom_text(aes(label = paste0(round(avg_rate, 1), "%")), 
            vjust = -0.5, size = 4, fontface = "bold") +
  scale_fill_manual(values = c("FALSE" = "lightgray", "TRUE" = metro_colors["Columbus"])) +
  scale_y_continuous(labels = scales::percent_format(scale = 1)) +
  labs(
    title = "Average Unemployment Rates: Columbus Leads Regional Performance (2015-2024)",
    subtitle = "Seasonally adjusted data - Columbus ranks #1 among all metros",
    x = "Metro Area",
    y = "Average Unemployment Rate (%)"
  ) +
  theme_minimal() +
  theme(
    legend.position = "none",
    axis.text.x = element_text(angle = 45, hjust = 1),
    plot.background = element_rect(fill = "white", color = NA),
    panel.background = element_rect(fill = "white", color = NA)
  )

ggsave("sa_ranking.jpg", ranking_sa, width = 12, height = 8, dpi = 300, bg = "white")

# =============================================================================
# 4. COVID ANALYSIS
# =============================================================================

cat("Creating COVID analysis chart...\n")

covid_analysis_sa <- ggplot(sa_data, aes(x = observation_date, y = UnemploymentRate, color = Metro)) +
  geom_line(linewidth = 1.2) +
  geom_vline(xintercept = as.Date("2020-03-01"), linetype = "dashed", color = "red", linewidth = 1) +
  geom_vline(xintercept = as.Date("2021-01-01"), linetype = "dashed", color = "blue", linewidth = 1) +
  annotate("text", x = as.Date("2020-03-01"), y = max(sa_data$UnemploymentRate) * 0.9, 
           label = "COVID-19\nImpact", hjust = 1, vjust = 1, color = "red", size = 3) +
  annotate("text", x = as.Date("2021-01-01"), y = max(sa_data$UnemploymentRate) * 0.8, 
           label = "Recovery\nPhase", hjust = 0, vjust = 1, color = "blue", size = 3) +
  scale_color_manual(values = metro_colors) +
  scale_x_date(date_labels = "%Y", date_breaks = "1 year") +
  scale_y_continuous(labels = scales::percent_format(scale = 1)) +
  labs(
    title = "COVID-19 Impact & Recovery: Columbus Shows Strong Resilience (2015-2024)",
    subtitle = "Seasonally adjusted data showing crisis performance and recovery",
    x = "Date",
    y = "Unemployment Rate (%)",
    color = "Metro Area"
  ) +
  theme_minimal() +
  theme(
    legend.position = "bottom",
    panel.grid.minor = element_blank(),
    plot.background = element_rect(fill = "white", color = NA),
    panel.background = element_rect(fill = "white", color = NA)
  )

ggsave("sa_covid_analysis.jpg", covid_analysis_sa, width = 14, height = 8, dpi = 300, bg = "white")

# =============================================================================
# 5. COLUMBUS VS OHIO VS US COMPARISON
# =============================================================================

cat("Creating Columbus vs Ohio vs US comparison...\n")

columbus_ohio_us <- sa_data %>%
  filter(Metro %in% c("Columbus", "Ohio", "United States"))

columbus_ohio_us_chart <- ggplot(columbus_ohio_us, aes(x = observation_date, y = UnemploymentRate, color = Metro)) +
  geom_line(aes(linetype = Metro, linewidth = Metro)) +
  scale_color_manual(values = metro_colors) +
  scale_linetype_manual(values = c(
    "Columbus" = "solid", "Ohio" = "dashed", "United States" = "dotted"
  )) +
  scale_linewidth_manual(values = c(
    "Columbus" = 2, "Ohio" = 1.5, "United States" = 1.2
  )) +
  scale_x_date(date_labels = "%Y", date_breaks = "2 years") +
  scale_y_continuous(labels = scales::percent_format(scale = 1)) +
  labs(
    title = "Columbus vs. Ohio vs. United States Unemployment Rate Comparison (2015-2024)",
    x = "Date",
    y = "Unemployment Rate (%)",
    color = "Region",
    caption = "Source: FRED (Seasonally Adjusted Data)"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold"),
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 10),
    panel.grid.minor = element_blank(),
    plot.background = element_rect(fill = "white", color = NA),
    panel.background = element_rect(fill = "white", color = NA),
    legend.position = "bottom"
  ) +
  guides(linetype = "none", linewidth = "none")

# Add annotation
columbus_ohio_us_chart <- columbus_ohio_us_chart +
  annotate("text", x = as.Date("2017-01-01"), y = max(columbus_ohio_us$UnemploymentRate) * 0.85, 
           label = "Columbus consistently\nbelow Ohio and US", 
           hjust = 0, vjust = 1, color = "#1f77b4", size = 4)

ggsave("sa_columbus_ohio_us.jpg", columbus_ohio_us_chart, width = 14, height = 8, dpi = 300, bg = "white")

# =============================================================================
# 6. EDA BOXPLOT
# =============================================================================

cat("Creating EDA boxplot...\n")

boxplot_sa <- ggplot(sa_data, aes(x = Metro, y = UnemploymentRate, fill = Metro)) +
  geom_boxplot(alpha = 0.7, outlier.alpha = 0.5) +
  scale_fill_manual(values = metro_colors) +
  scale_y_continuous(labels = scales::percent_format(scale = 1)) +
  labs(
    title = "Unemployment Rate Distributions by Metro (2015-2024)",
    subtitle = "Seasonally adjusted data showing Columbus's consistent advantage",
    x = "Metro Area",
    y = "Unemployment Rate (%)"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    legend.position = "none",
    plot.background = element_rect(fill = "white", color = NA),
    panel.background = element_rect(fill = "white", color = NA)
  ) +
  stat_summary(fun = mean, geom = "point", shape = 23, size = 3, color = "red")

ggsave("sa_boxplot.jpg", boxplot_sa, width = 12, height = 8, dpi = 300, bg = "white")

# =============================================================================
# 7. DASHBOARD
# =============================================================================

cat("Creating dashboard...\n")

dashboard_sa <- plot_grid(
  main_trends_sa + theme(legend.position = "none"),
  ranking_sa + theme(axis.text.x = element_text(angle = 0, hjust = 0.5)),
  covid_analysis_sa + theme(legend.position = "none"),
  boxplot_sa + theme(legend.position = "none"),
  ncol = 2, nrow = 2,
  labels = c("A", "B", "C", "D"),
  label_size = 14
)

legend <- get_legend(main_trends_sa + theme(legend.position = "bottom"))
dashboard_final_sa <- plot_grid(dashboard_sa, legend, ncol = 1, rel_heights = c(1, 0.1))

ggsave("sa_dashboard.jpg", dashboard_final_sa, width = 16, height = 12, dpi = 300, bg = "white")

# =============================================================================
# 8. SAVE DATA
# =============================================================================

# Save seasonally adjusted data
write_csv(sa_data, "seasonally_adjusted_unemployment.csv")
write_csv(sa_summary, "sa_summary_statistics.csv")

# Calculate advantages
columbus_avg <- sa_summary$mean_rate[sa_summary$Metro == "Columbus"]
ohio_avg <- sa_summary$mean_rate[sa_summary$Metro == "Ohio"]
us_avg <- sa_summary$mean_rate[sa_summary$Metro == "United States"]
cincinnati_avg <- sa_summary$mean_rate[sa_summary$Metro == "Cincinnati"]
cleveland_avg <- sa_summary$mean_rate[sa_summary$Metro == "Cleveland"]

cat("\n=== SEASONALLY ADJUSTED ANALYSIS COMPLETE ===\n")
cat("Files created:\n")
cat("✓ sa_main_trends.jpg - Main trends chart\n")
cat("✓ sa_columbus_focus.jpg - Columbus focus chart\n")
cat("✓ sa_ranking.jpg - Ranking chart\n")
cat("✓ sa_covid_analysis.jpg - COVID analysis\n")
cat("✓ sa_columbus_ohio_us.jpg - Columbus vs Ohio vs US\n")
cat("✓ sa_boxplot.jpg - EDA boxplot\n")
cat("✓ sa_dashboard.jpg - Combined dashboard\n")
cat("✓ seasonally_adjusted_unemployment.csv - Clean data\n")
cat("✓ sa_summary_statistics.csv - Summary statistics\n")

cat("\nKey Statistics (Seasonally Adjusted):\n")
cat("• Columbus:", columbus_avg, "%\n")
cat("• Cincinnati:", cincinnati_avg, "%\n")
cat("• Cleveland:", cleveland_avg, "%\n")
cat("• Ohio:", ohio_avg, "%\n")
cat("• United States:", us_avg, "%\n")

cat("\nColumbus Advantages:\n")
cat("• Over Ohio:", round(ohio_avg - columbus_avg, 3), "percentage points\n")
cat("• Over US:", round(us_avg - columbus_avg, 3), "percentage points\n")
cat("• Over Cincinnati:", round(cincinnati_avg - columbus_avg, 3), "percentage points\n")
cat("• Over Cleveland:", round(cleveland_avg - columbus_avg, 3), "percentage points\n")
