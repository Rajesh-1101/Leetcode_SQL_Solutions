--- Question 1: (Recyclable and Low Fat Product) 
  --- https://leetcode.com/problems/recyclable-and-low-fat-products/submissions/1431160583/?envType=study-plan-v2&envId=top-sql-50
SELECT product_id FROM Products
WHERE low_fats = 'Y'  AND recyclable = 'Y'

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--- Question 2: (Find Customer Referee) 
  --- https://leetcode.com/problems/find-customer-referee/submissions/1431165758/?envType=study-plan-v2&envId=top-sql-50

SELECT name FROM Customer
where id NOT IN (SELECT id FROM customer WHERE referee_id = 2)

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--- Question 3: (Big Countries)
  --- https://leetcode.com/problems/big-countries/submissions/1431176564/?envType=study-plan-v2&envId=top-sql-50

SELECT name, population, area FROM World
where (area >= 3000000 OR population >= 25000000);

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--- Question 4: (Article View1) 
  --- https://leetcode.com/problems/article-views-i/submissions/1431180213/?envType=study-plan-v2&envId=top-sql-50

SELECT DISTINCT author_id AS id 
FROM Views
WHERE author_id = viewer_id
ORDER BY 1 ASC;

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--- Question 5: (Invalid Tweet) 
  --- https://leetcode.com/problems/invalid-tweets/submissions/1431182389/?envType=study-plan-v2&envId=top-sql-50

SELECT tweet_id 
FROM Tweets
WHERE LENGTH(content) > 15;
