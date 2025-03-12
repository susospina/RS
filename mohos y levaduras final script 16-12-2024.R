# Load required libraries
library(ggplot2)
library(dplyr)
library(scales)

# Data for 1-04-2024
data_1_04_2024 <- data.frame(
  Treatment = c('Treatment 1', 'Treatment 2', 'Treatment 3', 'Treatment 4', 'Treatment 5', 'Treatment 6'),
  R1 = c(1e6, 3.5e6, 14.5e6, 7.5e6, 10e6, 1e6),
  R2 = c(2e6, 9.5e6, 2.5e6, 5e6, 2.5e6, 5e6),
  R3 = c(5e6, 2e6, 3.5e6, 2.5e6, 2e6, 5e6),
  R4 = c(3e6, 5.5e6, 3.2e6, 2e6, 2.5e6, 3.5e6)
)

# Calculate averages for 1-04-2024
data_1_04_2024_avg <- data_1_04_2024 %>%
  mutate(Average = rowMeans(select(., -Treatment)))

# Data for 17-04-2024
data_17_04_2024 <- data.frame(
  Treatment = c('Treatment 1', 'Treatment 2', 'Treatment 3', 'Treatment 4', 'Treatment 5', 'Treatment 6'),
  R1 = c(1e6, 2e6, 5e6, 3e6, 1e6, 10.5e6),
  R2 = c(3.5e6, 9.5e6, 2e6, 5.5e6, 4e6, 9e5),
  R3 = c(14.5e6, 2.5e6, 3.5e6, 3.2e6, 1.5e6, 2.0e6),
  R4 = c(7.5e6, 5e6, 2.5e6, 2e6, 1.5e6, 3e6)
)

# Calculate averages for 17-04-2024
data_17_04_2024_avg <- data_17_04_2024 %>%
  mutate(Average = rowMeans(select(., -Treatment)))

# Data for 28-08-2024
data_28_08_2024 <- data.frame(
  Treatment = rep(c('Treatment 1', 'Treatment 2', 'Treatment 3', 'Treatment 4', 'Treatment 5', 'Treatment 6'), each = 4),
  Replicate = rep(1:4, times = 6),
  UFC_g = c(
    2e6, 2.5e6, 3e6, 3.5e6,         # Treatment 1
    3.5e6, 4e6, 3.8e6, 3.9e6,       # Treatment 2
    5.2e6, 5.5e6, 5.8e6, 5.6e6,     # Treatment 3
    4.1e6, 4.3e6, 4.6e6, 4.7e6,     # Treatment 4
    6.2e6, 6.8e6, 7.1e6, 7.5e6,     # Treatment 5
    1.8e6, 2.1e6, 2.4e6, 2.6e6      # Treatment 6
  )
)

# Calculate averages for 28-08-2024
data_28_08_2024_avg <- data_28_08_2024 %>%
  group_by(Treatment) %>%
  summarise(Average = mean(UFC_g))

# Combine all data into one data frame for plotting
all_data <- data.frame(
  Treatment = rep(c('Treatment 1', 'Treatment 2', 'Treatment 3', 'Treatment 4', 'Treatment 5', 'Treatment 6'), times = 3),
  Date = rep(c('1-04-2024', '17-04-2024', '28-08-2024'), each = 6),
  Average = c(data_1_04_2024_avg$Average, data_17_04_2024_avg$Average, data_28_08_2024_avg$Average)
)

# Plot the data with ggplot2
ggplot(all_data, aes(x = Treatment, y = Average, fill = Date)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  labs(title = " Molds and Yeasts by Treatment and Date",
       x = "Treatment",
       y = "Average UFC/g",
       fill = "Date") +
  theme_minimal() +
  scale_fill_brewer(palette = "Set2") +
  scale_y_continuous(labels = scales::label_scientific())
