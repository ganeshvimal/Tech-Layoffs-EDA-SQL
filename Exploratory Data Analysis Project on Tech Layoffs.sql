-- Exploratory data analysis project on tech layoffs

-- 

select * from layoffs_staging2;

-- working with total_laid_off and percentage_laid_off column

-- company which did maximum laid off
select company, max(total_laid_off) 
from layoffs_staging2 
group by company 
order by max(total_laid_off) desc;

select * from layoffs_staging2
where percentage_laid_off = 1;

-- which company laid off the entire number of employees
select * from layoffs_staging2
where percentage_laid_off = 1
order by total_laid_off desc;

-- Looking at Percentage to see how big these layoffs were
select max(percentage_laid_off), min(percentage_laid_off) from layoffs_staging2;

-- company which laid of the minimum
select company, min(total_laid_off) from layoffs_staging2 group by company order by min(total_laid_off);

-- order by funds raised in millions and %laid off is 1
select * from layoffs_staging2
where percentage_laid_off = 1
order by funds_raised_millions desc;

-- highest sum of total laid off by companies
select company, sum(total_laid_off)
 from layoffs_staging2
 group by company
 order by sum(total_laid_off)  desc;
 
 -- top 5 total laid off companies
select company, total_laid_off
from layoffs_staging2
order by total_laid_off desc
limit 5;

-- starting and ending date
select min(`date`), max(`date`) from layoffs_staging2;

-- which industry got affected most
select industry, sum(total_laid_off)
from layoffs_staging2
group by industry
order by sum(total_laid_off)  desc;

-- which country laid of the most no of employees
select country, sum(total_laid_off)
from layoffs_staging2
group by country
order by sum(total_laid_off)  desc;

-- year by year comparison of sum of total laid off
select year(`date`), sum(total_laid_off)
from layoffs_staging2
group by year(`date`)
order by 1  desc;

-- laid off by stage
select stage, sum(total_laid_off)
from layoffs_staging2
group by stage
order by 2  desc;

--  Rolling total of layoffs per month

-- STEP 1 - We get no of laidoff from 2020 march to 2023 march individually
select substring(`date`, 1,7) as `year & month`, sum(total_laid_off) 
from  layoffs_staging2
where substring(`date`, 1,7) is not null
group by `year & month`
order by 1 asc;

-- STEP 2 - WitH CTE
-- DOING OVER for rolling total and putting inside order by and not partition because we already did group by before
WITH rolling_total as 
( select substring(`date`, 1,7) as `year & month`, sum(total_laid_off) as total_employees_laid_off
from  layoffs_staging2
where substring(`date`, 1,7) is not null
group by `year & month`
order by 1 asc )
select `year & month`,total_employees_laid_off, sum(total_employees_laid_off) OVER(ORDER BY `year & month` ) as rolling_total 
from rolling_total;

-- Sum of Total laid off by company per year 

select company, year(`date`), sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
order by 3 desc;

-- Company with Highest laid off should be ranked no 1 for that year (IMPORTANT)

WITH company_year (company, years, total_laid_off) as 
( select company, year(`date`), sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
)
select *, dense_rank () OVER (PARTITION BY years ORDER BY total_laid_off desc) as rank_company 
from company_year
where years is not null
order by rank_company asc;

-- Filter and getting top 5 ranked companies for each year ( for this we need to add another cte and query of it)
-- VERY IMPORTANT
-- same thing we can do for industry etc just got to put that column name rest everything remains same
WITH company_year (company, years, total_laid_off) as 
( select company, year(`date`), sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
), Company_year_rank as 
(
select *, dense_rank () OVER (PARTITION BY years ORDER BY total_laid_off desc) as rank_company 
from company_year
where years is not null )
select * from Company_year_rank 
where rank_company <=5;




