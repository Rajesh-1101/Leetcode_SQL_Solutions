--- Question 1: Not Boring Movies
--- https://leetcode.com/problems/not-boring-movies/submissions/1442627492/?envType=study-plan-v2&envId=top-sql-50

SELECT *
FROM Cinema
WHERE ((id % 2) != 0) AND description NOT LIKE "boring"
ORDER BY rating DESC

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--- Question 2: Average Selling Price 
--- https://leetcode.com/problems/average-selling-price/submissions/1442691997/?envType=study-plan-v2&envId=top-sql-50

  # Write your MySQL query statement below

SELECT 
    P.product_id,
    COALESCE(ROUND(SUM(units*price)/SUM(units),2),0) AS average_price
FROM Prices P
LEFT JOIN UnitsSold U ON P.product_id = U.product_id 
AND U.purchase_date BETWEEN start_date AND end_date
GROUP BY product_id;

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--- Question 3: Project Employee 1 
--- https://leetcode.com/problems/project-employees-i/submissions/1442703766/?envType=study-plan-v2&envId=top-sql-50

# Write your MySQL query statement below


SELECT 
    P.project_id,
    ROUND(AVG(experience_years),2) AS average_years
FROM Project P
LEFT JOIN Employee E ON P.employee_id = E.employee_id
GROUP BY 1;

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--- Question 4: Percentage of User Attended Contest 
  --- https://leetcode.com/problems/percentage-of-users-attended-a-contest/submissions/1442713774/?envType=study-plan-v2&envId=top-sql-50

  # Write your MySQL query statement below


SELECT 
    contest_id,
    ROUND(COUNT(R.user_id)/(select count(user_id) from Users)*100,2) AS percentage
FROM Users U
LEFT JOIN Register R ON U.user_id = R.user_id
WHERE contest_id IS NOT NULL
GROUP BY 1
ORDER BY percentage DESC,contest_id ASC;



+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--- Question 5: Queries, Quality and Percentage 
--- https://leetcode.com/problems/queries-quality-and-percentage/submissions/1446449152/?envType=study-plan-v2&envId=top-sql-50
  
SELECT 
    query_name,
    ROUND(AVG(rating/position),2) AS quality,
    ROUND(COUNT(CASE WHEN rating < 3 THEN 1 END)/ (COUNT(rating))*100, 2) AS poor_query_percentage
FROM Queries
WHERE query_name IS NOT NULL
GROUP BY 1;

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- Question 6: Monthly Transaction 1 
--- https://leetcode.com/problems/monthly-transactions-i/submissions/1446749533/?envType=study-plan-v2&envId=top-sql-50


SELECT 
    SUBSTR(trans_date, 1, 7) AS month,
    country,
    COUNT(country) AS  trans_count,
    COUNT(CASE WHEN state = 'approved' THEN 1 END) AS approved_count,
    SUM(amount) as trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 end) AS approved_total_amount
FROM Transactions
GROUP BY 1,2;

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--- Question 7: Immediate Food delivery
--- https://leetcode.com/problems/immediate-food-delivery-ii/?envType=study-plan-v2&envId=top-sql-50



+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--- Question 8: Game Play Analysis 
--- https://leetcode.com/problems/game-play-analysis-iv/description/?envType=study-plan-v2&envId=top-sql-50

