# libraries
library(dplyr)
library(ggplot2)
library(tidyr)

#file paths
file_path <- "C:/Users/User/Desktop/BCom Hons/Predictive analysis/Happiness data"
path <- "C:/Users/User/Desktop/BCom Hons/Predictive analysis"

# Loading datasets for all years
happiness_2018 <- read.csv(paste0(file_path, "/2018.csv"))
happiness_2019 <- read.csv(paste0(file_path, "/2019.csv"))
happiness_2020 <- read.csv(paste0(file_path, "/2020.csv"))
covid_19 <- read.csv(paste0(path, "/covid19.csv"))

# Displaying the first few rows 
cat("Happiness 2018\n")
head(happiness_2018)

cat("Happiness 2019\n")
head(happiness_2019)

cat("Happiness 2020\n")
head(happiness_2020)

cat("COVID-19 Data\n")
head(covid_19)

#  happiness datasets
happiness_2018 <- happiness_2018 %>%
  rename(Country = Country.or.region, Happiness_Score = Score) %>%
  select(Country, Happiness_Score, GDP.per.capita, Social.support, Healthy.life.expectancy) %>%
  mutate(Year = 2018)

happiness_2019 <- happiness_2019 %>%
  rename(Country = Country.or.region, Happiness_Score = Score) %>%
  select(Country, Happiness_Score, GDP.per.capita, Social.support, Healthy.life.expectancy) %>%
  mutate(Year = 2019)

happiness_2020 <- happiness_2020 %>%
  rename(Country = Country.name, Happiness_Score = Ladder.score) %>%
  select(Country, Happiness_Score, Regional.indicator) %>%
  mutate(Year = 2020)

# Combining happiness data from 2018-2020
happiness_data <- bind_rows(happiness_2018, happiness_2019, happiness_2020)

# Preparing COVID-19 data 
covid_data <- covid_19 %>%
  rename(Country = Country.Region) %>%
  group_by(Country) %>%
  summarize(
    Total_Confirmed = sum(Confirmed, na.rm = TRUE),
    Total_Deaths = sum(Deaths, na.rm = TRUE),
    Total_Recovered = sum(Recovered, na.rm = TRUE)
  )

# Merging happiness data with COVID-19 data
combined_data <- happiness_data %>%
  left_join(covid_data, by = "Country")

# combined data
head(combined_data)

# Line plot of happiness scores over time by category
# Data for before COVID
data_before_covid <- combined_data[combined_data$Year < 2020, ]

# Data for during and after COVID
data_during_after_covid <- combined_data[combined_data$Year >= 2020, ]

# Check how many years of data each country has
table(data_before_covid$Country)
table(data_during_after_covid$Country)

#Happiness scores before covid
data_before_covid$Year <- as.numeric(data_before_covid$Year)
data_before_covid$Country <- as.factor(data_before_covid$Country)

# Select a subset of countries to display
selected_countries <- c("United States", "United Kingdom", "Germany", "France", "Japan", "China", "India", "Brazil")
data_before_covid_subset <- data_before_covid[data_before_covid$Country %in% selected_countries, ]

# Create the line plot
ggplot(data_before_covid_subset, aes(x = Year, y = Happiness_Score, group = Country, color = Country)) +
  geom_line(size = 1, alpha = 0.7) +
  geom_point(size = 3) +
  labs(title = "Happiness Scores Before COVID",
       x = "Year",
       y = "Happiness Score") +
  theme_minimal() +
  theme(legend.position = "bottom",
        legend.title = element_blank(),
        plot.title = element_text(size = 14, face = "bold"),
        axis.title = element_text(size = 12),
        axis.text = element_text(size = 10)) +
  scale_color_brewer(palette = "Paired")

#After covid -19 

# Ensure the Year column is numeric and Country is a factor
data_during_after_covid$Year <- as.numeric(data_during_after_covid$Year)
data_during_after_covid$Country <- as.factor(data_during_after_covid$Country)

# Select a subset of countries to display
selected_countries <- c("United States", "United Kingdom", "Germany", "France", "Japan", "China", "India", "Brazil")
data_after_covid_subset <- data_during_after_covid[data_during_after_covid$Country %in% selected_countries, ]

# Create the line plot for happiness scores after COVID-19
plot_after_covid <- ggplot(data_after_covid_subset, aes(x = Year, y = Happiness_Score, group = Country, color = Country)) +
  geom_line(size = 1, alpha = 0.7) +
  geom_point(size = 3) +
  labs(title = "Happiness Scores After COVID-19",
       x = "Year",
       y = "Happiness Score") +
  theme_minimal() +
  theme(legend.position = "bottom",
        legend.title = element_blank(),
        plot.title = element_text(size = 14, face = "bold"),
        axis.title = element_text(size = 12),
        axis.text = element_text(size = 10)) +
  scale_color_brewer(palette = "Paired")

# Print the plot
print(plot_after_covid)

#Average Happiness Scores
combined_data <- happiness_data %>%
  left_join(covid_data, by = "Country") %>%
  mutate(Category = case_when(
    Country %in% c("USA", "UK", "Germany", "France", "Canada", "Australia", "Japan") ~ "Developed",
    TRUE ~ "Developing"  # All other countries are classified as Developing
  ))

# Data for before COVID
data_before_covid <- combined_data[combined_data$Year < 2020, ]

# Data for during and after COVID
data_during_after_covid <- combined_data[combined_data$Year >= 2020, ]

# Average happiness scores before COVID
avg_before <- data_before_covid %>%
  group_by(Category) %>%
  summarise(Average_Score = mean(Happiness_Score, na.rm = TRUE))

# Average happiness scores after COVID
avg_after <- data_during_after_covid %>%
  group_by(Category) %>%
  summarise(Average_Score = mean(Happiness_Score, na.rm = TRUE))

# averages for plotting
avg_scores <- rbind(
  avg_before %>% mutate(Period = "Before COVID"),
  avg_after %>% mutate(Period = "After COVID")
)

# average scores
print(avg_scores)

#Statistical Analysis
# T-test for happiness scores before COVID
t_test_before <- t.test(Happiness_Score ~ Category, data = data_before_covid)

# T-test for happiness scores after COVID
t_test_after <- t.test(Happiness_Score ~ Category, data = data_during_after_covid)

# Print results
print(t_test_before)
print(t_test_after)

# Plot of the average happiness scores
ggplot(avg_scores, aes(x = Category, y = Average_Score, fill = Period)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Average Happiness Scores Before and After COVID-19",
       x = "Country Category",
       y = "Average Happiness Score") +
  theme_minimal() +
  theme(legend.position = "bottom",
        plot.title = element_text(size = 14, face = "bold"))








