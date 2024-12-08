/*
Question #1: 
What is the number of impressions in 2022 per age group across Facebook and Instagram?
*/

SELECT 
    SUM(impressions), 
    parent_company, 
    age_bucket_user 
FROM meta_revenue
WHERE years = '2022'
GROUP BY age_bucket_user, parent_company
ORDER BY age_bucket_user;

/*
Question #2: 
Have the number of conversions been trending upwards or downwards 
for Facebook for the age bucket 18-24 and 25-34 over the last few years?

conversions 
parent_company 'Facebook'
age_bucket_user 18-24 and 25-34
years

*/

SELECT 
    SUM(conversions), 
    years
FROM meta_revenue
WHERE (age_bucket_user BETWEEN '18-24' AND '25-34')
AND parent_company = 'Facebook'
GROUP BY years
ORDER BY years DESC;

/*
Question #3: 
A standard metric to analyze in the ads business is called conversion-per-click which 
is defined as your total conversion value divided by the number of clicks.

Can you build the conversion-per-click metric and analyze how the metric is trending 
for Instagram for the age bucket 18-24 over the last few years?
*/

/*
cv_per_click = SUM(conversions) / SUM(clicks)
TREND? years
age_bucket_user 18-24
*/

SELECT 
    SUM(conversions) / SUM(clicks) AS cv_per_click, years
FROM meta_revenue
GROUP BY years
ORDER BY years;

/*
Question #4: 
Create a column that summarizes the dates based on the calendar quarters
in the year (e.g., Q1 is 2022-01-01 to 2022-03-31). 

What is the revenue and number of conversions generated per quarter for 
the SMB sales team in 2022?
*/

/*
column AS quaters in 2022
revenue
number conversions
WHERE sales_team = SMB
*/


SELECT
    SUM(revenue),
    SUM(conversions),
  	    CASE
    	    WHEN dates BETWEEN '2022-01-01' AND '2022-03-31' THEN 'q1'
            WHEN dates BETWEEN '2022-04-01' AND '2022-06-30' THEN 'q2'
            WHEN dates BETWEEN '2022-07-01' AND '2022-09-30' THEN 'q3'
            WHEN dates BETWEEN '2022-10-01' AND '2022-12-31' THEN 'q4'
        END AS quaters
FROM meta_revenue
WHERE years = '2022' AND sales_team LIKE('%SMB%')
GROUP BY quaters
ORDER BY quaters;
  
  
/*
Question #5: 
What is the average amount of revenue per ad that is generated per quarter for the SMB sales team in 2022?
*/

/*
AVG revenue per Ad per quarter
WHERE sales_team = SMB AND years = 2022
*/

SELECT SUM(revenue) / COUNT(DISTINCT ad_id) AS avg_rev_per_ad,
	CASE
        WHEN dates BETWEEN '2022-01-01' AND '2022-03-31' THEN 'q1'
        WHEN dates BETWEEN '2022-04-01' AND '2022-06-30' THEN 'q2'
        WHEN dates BETWEEN '2022-07-01' AND '2022-09-30' THEN 'q3'
        WHEN dates BETWEEN '2022-10-01' AND '2022-12-31' THEN 'q4'
	END AS quaters
FROM meta_revenue
WHERE years = '2022' AND sales_team LIKE('%SMB%')
GROUP BY quaters
ORDER BY quaters;


/*
Question #6: 
Calculate the following metrics for the top 10 clients that have the highest amount of revenue in 2022: 

Total revenue, total conversions, total clicks, conversions per click, and average revenue per conversion
*/

/*
Top 10 client_id
ORDER BY revenue DESC
WHERE years 2022
*/



SELECT 
	DISTINCT client_id,
	SUM(revenue) AS sum_revenue,
    SUM(conversions) AS sum_conversion,
    SUM(clicks) AS sum_clicks,
    AVG(conversions::DECIMAL / clicks:: DECIMAL) AS avg_con_p_click,
	AVG(revenue / conversions) AS avg_rev_p_conv
FROM meta_revenue 
WHERE years = '2022'
GROUP BY client_id
ORDER BY SUM(revenue) DESC
LIMIT 10;