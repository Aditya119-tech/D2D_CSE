--LAB-15--

---Part – A:-- 
--1. List all books with their authors.-- 

SELECT B.TITLE , A.AUTHORNAME FROM BOOK B JOIN AUTHOR A
ON B.AUTHORID=A.AUTHORID
--2. List all books with their publishers.--

SELECT P.PUBLISHERNAME,B.TITLE FROM BOOK B JOIN PUBLISHER P
ON B.PUBLISHERID=P.PUBLISHERID

--3. List all books with their authors and publishers.-- 

SELECT B.TITLE, A.AUTHORNAME,P.PUBLISHERNAME FROM  AUTHOR A JOIN BOOK B 
ON B.AUTHORID=A.AUTHORID
JOIN PUBLISHER P
ON P.PUBLISHERID=B.PUBLISHERID

--4. List all books published after 2010 with their authors and publisher and price.-- 

SELECT B.TITLE, A.AUTHORNAME,P.PUBLISHERNAME,B.PRICE FROM  AUTHOR A JOIN BOOK B 
ON B.AUTHORID=A.AUTHORID
JOIN PUBLISHER P
ON P.PUBLISHERID=B.PUBLISHERID
WHERE B.PUBLICATIONYEAR > 2010

--5. List all authors and the number of books they have written. --

SELECT A.AUTHORNAME,COUNT(B.TITLE) AS BOOK_WRITTEN FROM  AUTHOR A JOIN BOOK B 
ON B.AUTHORID=A.AUTHORID
GROUP BY A.AUTHORNAME

--6. List all publishers and the total price of books they have published. --

SELECT B.TITLE,P.PUBLISHERNAME,SUM(B.PRICE) AS TOTAL_PRICE FROM  AUTHOR A JOIN BOOK B 
ON B.AUTHORID=A.AUTHORID
JOIN PUBLISHER P
ON P.PUBLISHERID=B.PUBLISHERID
GROUP BY B.TITLE,P.PUBLISHERNAME

--7. List authors who have not written any books. --

SELECT A.AUTHORNAME FROM AUTHOR A LEFT JOIN BOOK B 
ON B.AUTHORID=A.AUTHORID
WHERE B.AUTHORID IS NULL

--8. Display the total number of books written by each author along with the average price of their books. --

SELECT A.AUTHORNAME,COUNT(B.BOOKID) AS TOTAL_BOOK_WRITTEN,AVG(B.PRICE) AS BOOK_AVG_PRICE FROM  AUTHOR A JOIN BOOK B 
ON B.AUTHORID=A.AUTHORID
JOIN PUBLISHER P
ON P.PUBLISHERID=B.PUBLISHERID
GROUP BY A.AUTHORNAME

--9. lists each publisher along with the total number of books they have published, sorted from highest to lowest. --

SELECT P.PUBLISHERNAME,COUNT(B.BOOKID) AS TOTAL_BOOK_PUBLISHED FROM BOOK B 
JOIN PUBLISHER P
ON P.PUBLISHERID=B.PUBLISHERID
GROUP BY P.PUBLISHERNAME
ORDER BY TOTAL_BOOK_PUBLISHED DESC

--10. Display number of books published each year.--

SELECT B.PUBLICATIONYEAR,COUNT(*) AS BOOK_PUBLISHED FROM BOOK B 
GROUP BY B.PUBLICATIONYEAR
ORDER BY BOOK_PUBLISHED 

--PART-B--
--11. List the publishers whose total book prices exceed, ordered by the total price. --

SELECT P.PUBLISHERID, P.PUBLISHERNAME, SUM(B.PRICE) AS TotalPrice
FROM PUBLISHER P
JOIN BOOK B ON P.PUBLISHERID = B.PUBLISHERID
GROUP BY P.PUBLISHERID, P.PUBLISHERNAME
HAVING SUM(B.PRICE) > 500
ORDER BY TotalPrice;

--12. List most expensive book for each author, sort it with the highest price.-- 

WITH RankedBooks AS
(
  SELECT A.AUTHORID, A.AUTHORNAME, B.BOOKID, B.TITLE, B.PRICE,
         ROW_NUMBER() OVER (PARTITION BY A.AUTHORID ORDER BY B.PRICE DESC) AS rn
  FROM AUTHOR A
  JOIN BOOK B ON A.AUTHORID = B.AUTHORID
)
SELECT AUTHORID, AUTHORNAME, BOOKID, TITLE, PRICE
FROM RankedBooks
WHERE rn = 1
ORDER BY PRICE DESC;

--13. Display publisher name and difference between maximum and minimum book price. --

SELECT P.PUBLISHERNAME,
       (MAX(B.PRICE) - MIN(B.PRICE)) AS PriceDifference
FROM PUBLISHER P
JOIN BOOK B ON P.PUBLISHERID = B.PUBLISHERID
GROUP BY P.PUBLISHERNAME;

--14. List publisher name and total price of books published each year. --

SELECT P.PUBLISHERNAME, B.PUBLICATIONYEAR, SUM(B.PRICE) AS TotalPriceByYear
FROM PUBLISHER P
JOIN BOOK B ON P.PUBLISHERID = B.PUBLISHERID
GROUP BY P.PUBLISHERNAME, B.PUBLICATIONYEAR
ORDER BY P.PUBLISHERNAME, B.PUBLICATIONYEAR;

--15. Display author name and total price of books sorted by highest total price. --

SELECT A.AUTHORNAME, SUM(B.PRICE) AS TotalPrice
FROM AUTHOR A
JOIN BOOK B ON A.AUTHORID = B.AUTHORID
GROUP BY A.AUTHORNAME
ORDER BY TotalPrice DESC;

--Part – C: --
--16. Retrieve the names of employee along with their manager’s name from the Employee table. --

SELECT e.EmployeeNo, e.Name AS EmployeeName, m.Name AS ManagerName
FROM EMPLOYEE_MASTER e
LEFT JOIN EMPLOYEE_MASTER m ON e.ManagerNo = m.ManagerNo;

create table EMPLOYEE_MASTER(
EmployeeNo varchar(20),
Name varchar(20),
ManagerNo varchar(10),
)
Insert Into EMPLOYEE_MASTER 
values('E01 ','Tarun', NULL ),
('E02','Rohan','E02'),
('E03','Priya','E01'),
('E04','Milan','E03'),
('E05','Jay','E01'),
('E06','Anjana','E04')
--17. Display employees who are managers. --

SELECT DISTINCT m.EmployeeNo, m.Name
FROM EMPLOYEE_MASTER m
JOIN EMPLOYEE_MASTER e ON e.ManagerNo = m.EmployeeNo;

--18. Display number of employees working under each manager. --

SELECT m.EmployeeNo AS ManagerNo, m.Name AS ManagerName, COUNT(e.EmployeeNo) AS DirectReports
FROM EMPLOYEE_MASTER m
LEFT JOIN EMPLOYEE_MASTER e ON e.ManagerNo = m.EmployeeNo
GROUP BY m.EmployeeNo, m.Name;

--19. Display the employee’s name along with their manager’s name and senior manager name. --

SELECT e.EmployeeNo, e.Name AS EmployeeName,
       m.EmployeeNo AS ManagerNo, m.Name AS ManagerName,
       sm.EmployeeNo AS SeniorManagerNo, sm.Name AS SeniorManagerName
FROM EMPLOYEE_MASTER e
LEFT JOIN EMPLOYEE_MASTER m  ON e.ManagerNo = m.EmployeeNo
LEFT JOIN EMPLOYEE_MASTER sm ON m.ManagerNo = sm.EmployeeNo;

--20. Display managers and count of employees under them in descending order.--

SELECT m.EmployeeNo AS ManagerNo, m.Name AS ManagerName, COUNT(e.EmployeeNo) AS DirectReports
FROM EMPLOYEE_MASTER m
LEFT JOIN EMPLOYEE_MASTER e ON e.ManagerNo = m.EmployeeNo
GROUP BY m.EmployeeNo, m.Name
HAVING COUNT(e.EmployeeNo) > 0
ORDER BY DirectReports DESC;