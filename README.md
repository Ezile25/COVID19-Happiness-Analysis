### COVID-19 and Happiness: A Comparative Analysis between Developing and Developed Countries
The COVID-19 pandemic brought dramatic and often distressing changes to people’s lives worldwide. With lockdowns, mask mandates, and travel restrictions, our normal activities were halted, leading to heightened stress, anxiety, and uncertainty for many. Beyond the physical health crisis, COVID-19 also struck at a crucial marker of social well-being happiness. Happiness, as gauged by well-being assessments like the World Happiness Report, is a key indicator of societal health. This project is an exploration of how the pandemic affected happiness worldwide, with a special focus on the differences between developed and developing nations.

#### Research Questions
##### Primary Question
To what extent did the COVID-19 pandemic influence global happiness levels?

##### Secondary Question
How did the effects of COVID-19 on happiness differ between developed and developing nations?

These questions guide an analysis aimed at uncovering the social impact of the pandemic. By examining happiness scores before and during the pandemic, we can gain a better understanding of its broader effects on well-being across different socioeconomic contexts.

#### Project Goals
The objective of this analysis is to capture and quantify the effect of COVID-19 on happiness worldwide. By comparing pre- and post-pandemic happiness scores, we aim to identify key patterns and divergences between developed and developing countries. This information could be vital for policymakers, sociologists, and public health experts looking to bolster societal resilience in future global crises.

#### Data Sources
To conduct this analysis, I used two primary datasets:

World Happiness Report Data (2015-2020): This dataset provided happiness scores and metrics such as GDP per capita, social support, and life expectancy for a range of countries. It offered a baseline for understanding happiness trends in the years leading up to and during the pandemic.

COVID-19 Case Data: Sourced from global health repositories, this data includes case counts, recoveries, and deaths across countries, allowing us to map COVID-19 severity to shifts in happiness.

#### Data Cleaning and Preparation
Data cleaning was performed to ensure consistency and accuracy across datasets. The following steps were undertaken:

Removed duplicates to prevent skewed results.
Filtered out unnecessary columns to streamline the analysis.
Standardized column names to ensure uniformity across different datasets.

#### Exploratory Data Analysis (EDA)
#### Scatter Plot 
This scatter plot reveals a negative correlation between COVID-19 cases and happiness scores: as cases rise, happiness tends to decline. Most scores cluster between 3 and 8, with lower happiness levels associated with higher case counts. Outliers above score 6 suggest that some regions maintained higher happiness despite high case numbers. 

![image](https://github.com/user-attachments/assets/daf186e7-0e12-4169-81ef-d94568b0a7d6)

#### Correlation Matrix 
This correlation matrix reveals strong positive relationships between happiness and factors like GDP per capita and social support, while indicating that higher COVID-19 cases and deaths correlate negatively with happiness. This matrix helps identify key influences on happiness and guides further analysis.

![image](https://github.com/user-attachments/assets/a087047a-0b00-4600-8da8-d14be7409182)

#### Gradient Booster Classifier
To analyze the impact of COVID-19 on happiness in developed and developing countries,I used a Gradient Boosting Classifier to predict happiness based on GDP per capita, COVID-19 cases, deaths, and regional development status.

#### Confusion Matrix
The model correctly identified 4081 instances as "Not Happy," yielding zero false positives and false negatives. However, it failed to predict any individuals as "Happy," indicating a significant limitation in its ability to recognize happiness.
![image](https://github.com/user-attachments/assets/a5e859d8-664e-4843-b10a-2e9d0a0bfc3e)

#### Box Plot
This box plot shows the distribution of happiness scores across different country types. Western Europe consistently exhibits higher median happiness scores compared to other regions. Countries in North America also demonstrate relatively high happiness levels, though they vary more widely.
![image](https://github.com/user-attachments/assets/b141fb83-085a-43af-b4cf-87d8ba0c0e8f)

#### Bar Plot
This Bar Plot indicates that Western Europe has the highest average happiness, reinforcing its reputation for high quality of life and strong social support systems.
North America follows, suggesting that wealth and resources in this region positively influence happiness, though the distribution is wider, indicating more variability in happiness levels.
Latin America and the Caribbean and East Asia show moderate happiness scores, while South Asia and Sub-Saharan Africa lag behind, indicating ongoing challenges in these regions.
![image](https://github.com/user-attachments/assets/7ede7955-9436-4592-9f43-78359474ff7d)

#### Reflection
##### Decision-Making Process
In approaching this assignment, I focused on understanding the impact of COVID-19 on global happiness levels, particularly in developed versus developing countries.I decided to do this analysis due to the changes that covid 19 came with in our lives, I have an interest to examine the psychological and societal implications that were resulted by this pandemic.

##### Framework for Analysis
I decided to use both quantitative and qualitative data analysis methods; regression analysis and correlation matrix, scatter plots and maps. This decision was made with a view of getting a broad perspective of the data and get deeper insights into how different regions and economic status impacted on the level of happiness.

##### Model Selection
In my analysis of the impact of COVID-19 on happiness, I initially employed the ARIMA model to examine temporal trends in happiness scores. However, after evaluating the resultsTo enrich the analysis, I wanted to include machine learning models namely Logistic Regression, Gradient Boosting Classifier and Random Forest Model.

##### Logistic Regression
To gain a clearer understanding of the factors influencing happiness, I implemented Logistic Regression. This model is particularly useful for binary classification tasks, allowing me to categorize happiness into two outcomes: "Happy" and "Not Happy."One of the key advantages of Logistic Regression is its interpretability.I utilized a confusion matrix to evaluate the model's performance. While the model performed well in identifying "Not Happy" cases, it struggled to predict "Happy" instances, highlighting an imbalance in the dataset. This prompted further refinement of the analysis.

##### Gradient Boosting Classifier
To address the limitations of previous models, I incorporated the Gradient Boosting Classifier. This model builds decision trees sequentially, where each tree corrects the errors of the previous ones, resulting in improved predictive accuracy.This model also provides insights into feature importance, enabling me to identify the most influential factors affecting happiness and refine my understanding of the key drivers behind well-being.
Random Forest In addition to the above models, I utilized Random Forest, an ensemble learning technique that constructs multiple decision trees and aggregates their outputs for enhanced accuracy.The Random Forest model also provided strong predictive performance, and by comparing its results with those from Logistic Regression and Gradient Boosting, I could validate and cross-check findings across different methodologies.

##### Comprehensive Analysis
Combining Models: Through the application of Logistic Regression, Gradient Boosting, and Random Forest, I wanted to achieve the best of all the models. This enabled a rigorous analysis of the factors of happiness and also different ways of analyzing the same data set

##### Insights Gained from the Data
Through this analysis, I learned several key lessons about the impact of COVID-19 on happiness. Firstly, it became clear that developed countries generally maintained higher happiness levels during the pandemic, primarily due to their access to resources such as healthcare, economic support, and social services. This access played a significant role in mitigating the negative effects of COVID-19, highlighting the importance of robust infrastructure in times of crisis. Additionally, I discovered that logged GDP per capita is a significant predictor of happiness; countries with stronger economies were better equipped to handle the psychological and social impacts of the pandemic, reinforcing the idea that financial stability is crucial for overall well-being. The analysis also underscored the critical role of social support in influencing happiness, as developed nations with strong social safety nets fared better, demonstrating the necessity of community and government interventions during challenging times. Finally, I learned that the resilience of developed countries in terms of happiness underscores the urgent need for developing nations to strengthen their systems to enhance overall well-being and prepare for future challenges.

##### Areas for Improvement in Future Analyses
In future analyses, I will focus on a more detailed examination of happiness levels post-COVID-19, particularly in both developed and developing countries. This will involve exploring additional variables that may influence happiness, such as mental health indicators, social cohesion, and access to healthcare services, to provide a more comprehensive understanding of well-being in the aftermath of the pandemic. I plan to enhance my data visualization techniques to better illustrate trends and disparities, making the findings more accessible and impactful

##### Conclusion
This analysis has underscored the significant disparities in happiness levels between developed and developing countries during the COVID-19 pandemic. It has become evident that developed nations, with their ample resources and robust infrastructure, were better equipped to mitigate the negative effects of the pandemic on well-being. The findings highlight the crucial roles of economic stability, social support, and effective government interventions in shaping happiness outcomes. While developed countries managed to maintain higher happiness levels, the challenges faced by developing nations emphasize the urgent need for strengthening their systems and support networks. Moving forward, it is essential to focus on understanding the long-term implications of the pandemic on happiness and well-being, ensuring that future analyses incorporate a broader range of factors and perspectives. This will ultimately contribute to developing targeted strategies that promote resilience and enhance quality of life for individuals across all regions.




