--- Question 1: Number of unquie subject taught by each teacher
--- https://leetcode.com/problems/number-of-unique-subjects-taught-by-each-teacher/submissions/1431307252/?envType=study-plan-v2&envId=top-sql-50

SELECT teacher_id, COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;


+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  
  --- Question 2: User activity for past 30 days
  --- https://leetcode.com/problems/user-activity-for-the-past-30-days-i/submissions/1431313636/?source=submission-noac

SELECT activity_date AS day, count(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date;


+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- Question 3: Product Sales Analysis 3
  --- https://leetcode.com/problems/product-sales-analysis-iii/submissions/1431323143/?envType=study-plan-v2&envId=top-sql-50

  SELECT 
s.product_id,
s.year AS first_year,
s.quantity,
s.price
FROM Sales s
JOIN ( 
    SELECT product_id, MIN(year) as min_year
    FROM Sales 
    GROUP BY product_id
) AS t
ON s.product_id = t.product_id AND s.year = t.min_year
JOIN Product p
ON s.product_id = p.product_id

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- Question 4: Class more than 5 students
  --- https://leetcode.com/problems/classes-more-than-5-students/submissions/1431368283/?envType=study-plan-v2&envId=top-sql-50
  
SELECT class 
FROM Courses
GROUP BY class
HAVING COUNT(DISTINCT student) >= 5;

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- Question 5: Find Followers count
  --- https://leetcode.com/problems/find-followers-count/submissions/1431382473/?envType=study-plan-v2&envId=top-sql-50

SELECT user_id, COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id;

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- Question 6: Biggest Single Number
  --- https://leetcode.com/problems/biggest-single-number/submissions/1431390228/?envType=study-plan-v2&envId=top-sql-50
SELECT MAX(num) AS num
FROM MyNumbers
WHERE num IN(
    SELECT num FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1
);

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--- Question 7: Customer who bought all products
--- https://leetcode.com/problems/customers-who-bought-all-products/submissions/1431396256/?envType=study-plan-v2&envId=top-sql-50

SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product);
