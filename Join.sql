--- Question 1: Replace ID with Unique_id 
--- https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/submissions/1440676038/?envType=study-plan-v2&envId=top-sql-50

SELECT COALESCE(unique_id, null) AS unique_id, name
FROM Employees E
LEFT JOIN EmployeeUNI U 
ON E.id = U.id;

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--- Question 2: Product Sales Analysis 1
  --- https://leetcode.com/problems/product-sales-analysis-i/submissions/1440678656/?envType=study-plan-v2&envId=top-sql-50

SELECT P.product_name, S.year, S.price
FROM Sales S
JOIN Product P
ON S.product_id = P.product_id;

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--- Question 3: Customer Visited but not made any transaction
  --- https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/submissions/1440688488/?envType=study-plan-v2&envId=top-sql-50

SELECT customer_id, COUNT(V.visit_id) AS count_no_trans
FROM Visits V
LEFT JOIN Transactions T
ON V.visit_id = T.visit_id
WHERE T.transaction_id IS NULL
GROUP BY 1;

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--- Question 4: Raising Temperature
  --- https://leetcode.com/problems/rising-temperature/submissions/1440695803/?envType=study-plan-v2&envId=top-sql-50

SELECT W1.id
FROM Weather W1
WHERE W1.temperature > (
    SELECT W2.temperature
    FROM Weather W2
    WHERE DATEDIFF(W1.recordDate, W2.recordDate) = 1
);

--- Other Method 

WITH PreviousDayWeather AS (
    SELECT id, temperature, recordDate
    FROM Weather
)
SELECT w1.id
FROM Weather w1
JOIN PreviousDayWeather w2 
ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
WHERE w1.temperature > w2.temperature;

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--- Question 5: Average Time of process Per machine
  --- https://leetcode.com/problems/average-time-of-process-per-machine/description/?envType=study-plan-v2&envId=top-sql-50


+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--- Question 6: Employee Bonus
  --- https://leetcode.com/problems/employee-bonus/description/?envType=study-plan-v2&envId=top-sql-50



+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--- Question 7: Students and examinations
  --- https://leetcode.com/problems/students-and-examinations/description/?envType=study-plan-v2&envId=top-sql-50



+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--- Question 8: Manager with 5 direct Reportee
  --- https://leetcode.com/problems/managers-with-at-least-5-direct-reports/?envType=study-plan-v2&envId=top-sql-50



+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--- Question 9: Confirmation Rate
  --- https://leetcode.com/problems/confirmation-rate/description/?envType=study-plan-v2&envId=top-sql-50





--- END Of JOIN SECTION >.....................................................................................
