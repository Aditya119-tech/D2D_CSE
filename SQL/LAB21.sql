--LAB-21--

--Part – A: --

--1. Display all students whose SPI is greater than 8. --

WITH HighSPIStudents AS (
    SELECT * 
    FROM STUDENT1 
    WHERE SPI > 8
)
SELECT * 
FROM HighSPIStudents;


--2. Display average SPI of all students. --

WITH AverageSPI AS (
    SELECT AVG(spi) AS avg_spi
    FROM STUDENT1
)
SELECT avg_spi 
FROM AverageSPI;

--3. Display total number of students in each branch. --

WITH BranchCount AS (
    SELECT 
        BRANCH, 
        COUNT(*) AS total_students
    FROM 
        STUDENT1
    GROUP BY 
        BRANCH
)
SELECT 
    BRANCH, 
    total_students
FROM 
    BranchCount;


--4. Display students who belong to RAJKOT city. --

WITH STUDENT_CITY_RAJKOT AS(
SELECT * FROM STUDENT1
WHERE CITY='RAJKOT'
)
SELECT * FROM STUDENT_CITY_RAJKOT

--5. Find branch names that appear more than once. --

WITH BRANCH_COUNT_1 AS(
SELECT BRANCH,COUNT(*) AS TOTAL_STUDENTS
FROM STUDENT1
GROUP BY BRANCH
)
SELECT * FROM BRANCH_COUNT_1
WHERE TOTAL_STUDENTS > 1

--6. Display row number for each student. --

WITH ROW_NUMBERS_STUDENT AS(
SELECT * ,ROW_NUMBER() OVER(ORDER BY STDID) as ROW_NO
FROM STUDENT1
)
SELECT * FROM ROW_NUMBERS_STUDENT

--7. Display top 3 students based on SPI. --

WITH STU_TOP_3 AS(
SELECT *,ROW_NUMBER() OVER(ORDER BY SPI DESC,STDID) AS ROW_NO
FROM STUDENT1
)
SELECT * FROM STU_TOP_3
WHERE ROW_NO <=3

--8. Display students having maximum SPI. --

WITH STU_MIN_SPI AS(
SELECT MAX(SPI) AS HIGH_SPI
FROM STUDENT1
)
SELECT S.* FROM STUDENT1 S CROSS JOIN STU_MIN_SPI AS M
WHERE S.SPI=M.HIGH_SPI

--9. Display students having minimum SPI. --

WITH STU_MAX_SPI AS(
SELECT MIN(SPI) AS LOW_SPI
FROM STUDENT1
)
SELECT S.* FROM STUDENT1 S CROSS JOIN STU_MAX_SPI AS M
WHERE S.SPI=M.LOW_SPI

--10. Display branch -wise rank of students. --

WITH STU_BRANCH_WISE AS (
SELECT STDID,SNAME,BRANCH,SPI,RANK() OVER(PARTITION BY BRANCH ORDER BY SPI DESC)  AS BRACH_RANK FROM STUDENT1
)
SELECT * FROM STU_BRANCH_WISE

--Part – B: --

--11. Display students SPI average belonging to Computer branch. --

WITH COMP_AVG_SPI AS (
SELECT SPI FROM STUDENT1
WHERE BRANCH='COMPUTER'
)
SELECT AVG(SPI) AS COMP_AVG_SPI_1
FROM COMP_AVG_SPI

--12. Display students whose SPI is greater than average SPI of his/her branch. --

WITH BRANCH_SPI AS (
SELECT BRANCH , AVG(SPI) AS AVG_SPI
FROM STUDENT1
GROUP BY BRANCH
)
SELECT S.*
FROM STUDENT1 AS S
JOIN BRANCH_SPI AS B
ON S.BRANCH=B.BRANCH
WHERE S.SPI > B.AVG_SPI

--13. Display branch having more than 2 students. --

WITH BRANCH_COUNT AS (
SELECT BRANCH,COUNT(*) AS TOTAL_STUDENT
FROM STUDENT1
GROUP BY BRANCH
)
SELECT * FROM BRANCH_COUNT 
WHERE TOTAL_STUDENT > 2

--14. Display branches having average SPI between 7 and 9--

WITH BranchAverage AS (
    SELECT BRANCH, AVG(SPI) AS Average_SPI
    FROM STUDENT1
    GROUP BY BRANCH
)
SELECT *
FROM BranchAverage
WHERE Average_SPI BETWEEN 7 AND 9;

--15. Display students whose SPI is lower than overall average SPI. --

WITH OverallAverage AS (
    SELECT AVG(SPI) AS Average_SPI
    FROM STUDENT1
)
SELECT s.*
FROM STUDENT1 AS s
CROSS JOIN OverallAverage AS a
WHERE s.spi < a.Average_SPI;

--Part – C: --

--16. Display branches having exactly one student. --

WITH BranchCount AS (
    SELECT BRANCH, COUNT(*) AS Total_Students
    FROM STUDENT1
    GROUP BY BRANCH
)
SELECT *
FROM BranchCount
WHERE Total_Students = 1;

--17. Display branch having highest average SPI. --

WITH BranchAverage AS (
    SELECT BRANCH, AVG(SPI) AS Average_SPI
    FROM STUDENT1
    GROUP BY BRANCH
),
HighestAverage AS (
    SELECT MAX(Average_SPI) AS Highest_SPI
    FROM BranchAverage
)
SELECT b.*
FROM BranchAverage AS b
CROSS JOIN HighestAverage AS h
WHERE b.Average_SPI = h.Highest_SPI;

--18. Display branch having lowest average SPI. --

WITH BranchAverage AS (
    SELECT BRANCH, AVG(SPI) AS Average_SPI
    FROM STUDENT1
    GROUP BY BRANCH
),
LowestAverage AS (
    SELECT MIN(Average_SPI) AS Lowest_SPI
    FROM BranchAverage
)
SELECT b.*
FROM BranchAverage AS b
CROSS JOIN LowestAverage AS l
WHERE b.Average_SPI = l.Lowest_SPI;

--19. Display students whose SPI is lower than branch average SPI. --

WITH BranchAverage AS (
    SELECT BRANCH, AVG(SPI) AS Average_SPI
    FROM STUDENT1
    GROUP BY BRANCH
)
SELECT s.*
FROM STUDENT1 AS s
JOIN BranchAverage AS b
    ON s.BRANCH = b.BRANCH
WHERE s.SPI < b.Average_SPI;

--20. Display branches having maximum number of students. --

WITH BranchCount AS (
    SELECT BRANCH, COUNT(*) AS Total_Students
    FROM STUDENT1
    GROUP BY BRANCH
),
MaximumCount AS (
    SELECT MAX(Total_Students) AS Max_Students
    FROM BranchCount
)
SELECT b.*
FROM BranchCount AS b
CROSS JOIN MaximumCount AS m
WHERE b.Total_Students = m.Max_Students; 