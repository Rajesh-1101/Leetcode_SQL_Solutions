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
  --- https://leetcode.com/problems/average-time-of-process-per-machine/submissions/1442421471/?envType=study-plan-v2&envId=top-sql-50

  
  # Write your MySQL query statement below

WITH Activity_Summary AS(
    SELECT 
        machine_id, 
        process_id,
        SUM(CASE WHEN activity_type = "start" THEN TIMESTAMP ELSE 0 END) AS start_time,
        SUM(CASE WHEN activity_type = "end" THEN TIMESTAMP ELSE 0 END) AS end_time
    FROM Activity
    GROUP BY machine_id, process_id
),
Process_Duration AS(
    SELECT 
        machine_id, 
        process_id,
        (end_time - start_time) as process_time
    FROM Activity_Summary
)
SELECT 
    machine_id,
    ROUND(AVG(process_time), 3) AS processing_time
FROM Process_Duration
GROUP BY machine_id;

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--- Question 6: Employee Bonus
  --- https://leetcode.com/problems/employee-bonus/submissions/1442437885/?envType=study-plan-v2&envId=top-sql-50

# Write your MySQL query statement below
  
SELECT 
    name,
    COALESCE(B.bonus, null) as bonus
FROM Employee E
LEFT JOIN Bonus B ON E.empId = B.empId
WHERE (B.bonus < 1000 OR B.bonus IS NULL)
GROUP BY E.empId, E.name;


+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--- Question 7: Students and examinations
  --- https://leetcode.com/problems/students-and-examinations/submissions/1442506110/?envType=study-plan-v2&envId=top-sql-50
  
# Write your MySQL query statement below

SELECT 
    S.student_id,
    S.student_name,
    B.subject_name,
    COUNT(E.subject_name) AS attended_exams
FROM Students S
Cross Join Subjects B
LEFT JOIN Examinations E
ON S.student_id = E.student_id AND B.subject_name = E.subject_name
GROUP BY S.student_id, B.subject_name, E.subject_name
ORDER BY S.student_id, B.subject_name, E.subject_name;

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  --- Question 8: Manager with 5 direct Reportee
  --- https://leetcode.com/problems/managers-with-at-least-5-direct-reports/submissions/1442518179/?envType=study-plan-v2&envId=top-sql-50

WITH Output_Table AS(
    SELECT E1.managerId, E2.name as name, count(E2.id)
    FROM Employee E1
    JOIN Employee E2 ON E1.managerId = E2.Id
    GROUP BY 1
    HAVING COUNT(E2.Id) >= 5
)
SELECT NAME FROM Output_Table;


+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--- Question 9: Confirmation Rate
  --- https://leetcode.com/problems/confirmation-rate/submissions/1442620381/?envType=study-plan-v2&envId=top-sql-50

# Write your MySQL query statement below

SELECT 
    S.user_id,
    COALESCE(ROUND((COUNT(CASE WHEN action = 'confirmed' THEN S.user_id END)/(COUNT(action))),2),0) AS confirmation_rate
FROM Signups S
LEFT JOIN Confirmations C ON S.user_id = C.user_id
GROUP BY 1;

--- END Of JOIN SECTION >.....................................................................................
