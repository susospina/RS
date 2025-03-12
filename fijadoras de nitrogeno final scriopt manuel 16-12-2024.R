# Load required libraries
library(ggplot2)
library(dplyr)

# Data for 1-04-2024
data_1_04_2024 <- data.frame(
  Treatment = c('Treatment 1', 'Treatment 2', 'Treatment 3', 'Treatment 4', 'Treatment 5', 'Treatment 6'),
  R1 = c(9.5e6, 6e6, 3e6, 16e6, 12.5e6, 2e6), 
  R2 = c(4.5e5, 1.05e6, 3.5e6, 11e6, 2.5e6, 4.5e5),
  R3 = c(4e6, 1.5e6, 3.51e6, 1.9e6, 8.5e5, 5.5e6),
  R4 = c(4e6, 1e6, 3e6, 12e6, 4.5e6, 9e5)
)

# Calculate averages for 1-04-2024
data_1_04_2024_avg <- data_1_04_2024 %>%
  mutate(Average = rowMeans(select(., -Treatment)))

# Data for 17-04-2024
data_17_04_2024 <- data.frame(
  Treatment = c('Treatment 1', 'Treatment 2', 'Treatment 3', 'Treatment 4', 'Treatment 5', 'Treatment 6'),
  R1 = c(11e5, 3e6, 5.5e6, 10.54e6, 8.5e6, 1e6),
  R2 = c(4.5e5, 4e6, 3.5e6, 1e6, 2e6, 3.5e5),
  R3 = c(3.5e6, 1.0e5, 5.5e6, 7e5, 1e6, 1e5),
  R4 = c(1e5, 2e6, 15e6, 6e6, 6e6, 6.5e5)
)

# Calculate averages for 17-04-2024
data_17_04_2024_avg <- data_17_04_2024 %>%
  mutate(Average = rowMeans(select(., -Treatment)))

# Data for 28-08-2024
data_28_08_2024 <- data.frame(
  Treatment = rep(c('Treatment 1', 'Treatment 2', 'Treatment 3', 'Treatment 4', 'Treatment 5', 'Treatment 6'), each = 4),
  Replicate = rep(1:4, times = 6),
  UFC_g = c(
    9e6, 8.5e6, 7.5e6, 6.5e6,       # Treatment 1
    5.5e6, 4.5e6, 3.5e6, 2.5e6,     # Treatment 2
    7.2e6, 6.1e6, 5.3e6, 5e6,       # Treatment 3
    11.5e6, 10e6, 8.5e6, 9e6,       # Treatment 4
    6.5e6, 7e6, 5.2e6, 5.8e6,       # Treatment 5
    3.5e6, 4e6, 3.9e6, 3.8e6        # Treatment 6
  )
)

# Calculate averages for 28-08-2024
data_28_08_2024_avg <- data_28_08_2024 %>%
  group_by(Treatment) %>%
  summarise(Average = mean(UFC_g))

# Combine all dates into a single data frame for plotting
all_data <- data.frame(
  Treatment = rep(c('Treatment 1', 'Treatment 2', 'Treatment 3', 'Treatment 4', 'Treatment 5', 'Treatment 6'), times = 3),
  Date = rep(c('1-04-2024', '17-04-2024', '28-08-2024'), each = 6),
  Average = c(data_1_04_2024_avg$Average, data_17_04_2024_avg$Average, data_28_08_2024_avg$Average)
)

# Plot data with ggplot2
ggplot(all_data, aes(x = Treatment, y = Average, fill = Date)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  labs(title = "Nitrogen Fixing Bacteria by Treatment and Date",
       x = "Treatment",
       y = "Average UFC/g",
       fill = "Date") +
  theme_minimal() +
  scale_fill_brewer(palette = "Set2") +
  scale_y_continuous(labels = scales::label_scientific())
