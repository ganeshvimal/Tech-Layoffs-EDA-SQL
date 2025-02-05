# Executive Summary: Exploratory Data Analysis on Tech Layoffs 

## Introduction
This SQL code performs an exploratory data analysis (EDA) on tech company layoffs, focusing on various metrics related to layoffs. It includes queries to identify the companies with the highest and lowest layoffs, the industries and countries most affected, and the impact of layoffs over time. The code also calculates rolling totals of layoffs by month, year-wise layoffs by company, and ranks companies by the number of employees laid off annually. Additionally, it filters top-ranked companies for each year. The analysis provides insights into the scale and patterns of layoffs in the tech industry.

## Key Insights

1. **Company Analysis:**
- Maximizing Layoffs: The company with the highest total layoffs has been identified, along with companies that laid off the entire workforce (100% layoffs).
- Smallest Layoffs: We examined companies with the smallest layoffs to understand layoffs on a smaller scale.
- Highest Total Layoffs: The companies with the highest total layoffs across all time periods are ranked.
- Top 5 Companies: The top 5 companies with the highest number of layoffs were selected, providing insight into which companies were most affected in terms of workforce reductions.

2. **Industry and Country Impact:**
- Most Affected Industries: The industries most impacted by layoffs have been identified based on the total number of employees laid off.
- Country Comparison: We analyzed which countries experienced the highest number of layoffs, offering insights into global trends in tech layoffs.

3. **Temporal Analysis:**
- Overall Layoffs Timeline: The start and end dates of layoffs across companies were explored, providing an understanding of the duration and frequency of layoffs over time.
- Year-by-Year Comparison: A year-over-year analysis of layoffs was conducted, offering insights into trends and fluctuations in layoffs over the past few years.

4. **Layoffs by Stage:**
- Stages of Layoffs: The dataset was analyzed to determine which stages of layoffs (e.g., voluntary, involuntary) contributed the most to total layoffs.

5. **Rolling Layoff Trends:**
- Monthly Rolling Total: A rolling total of layoffs per month was calculated to observe how layoffs evolved over time, from March 2020 to March 2023. This helps in understanding the impact of global events (e.g., COVID-19) on layoffs.

6. **Company Ranking by Year:**
- Company Ranking: Companies with the highest layoffs in each year were ranked using the dense_rank function, helping to highlight the most significant players in terms of layoffs each year.

7. **Top 5 Ranked Companies per Year:**
- A filter was applied to get the top 5 ranked companies for each year based on the total number of layoffs, offering a clear view of the key players in workforce reductions annually.

## Conclusion
This EDA provides a comprehensive understanding of the tech layoffs landscape, highlighting the companies, industries, and countries most impacted by layoffs. The analysis helps in identifying trends over time and the scale of layoffs, offering valuable insights into the broader impact of workforce reductions in the tech industry. The results can inform decision-making for businesses, policymakers, and individuals affected by these trends.
