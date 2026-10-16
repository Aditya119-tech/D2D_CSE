--LAB-20--
--Part – A: --
--1. Display rank of students based on SPI. --
SELECT *,
       RANK() OVER (ORDER BY SPI)
FROM   STUDENT1;

--2. Display dense rank of students based on SPI.-- 
SELECT *,
       DENSE_RANK() OVER (ORDER BY SPI)
FROM   STUDENT1;

--3. Display sequential number for each student record.-- 
SELECT *,
       ROW_NUMBER() OVER (ORDER BY SPI)
FROM   STUDENT1;

--4. Display branch-wise rank of students. --
SELECT *,
       RANK() OVER (PARTITION BY BRANCH ORDER BY SPI DESC) AS BRANCH_SPI
FROM   STUDENT1;

--5. Display branch-wise dense ranking of students.-- 
SELECT *,
       DENSE_RANK() OVER (PARTITION BY BRANCH ORDER BY SPI DESC) AS BRANCH_SPI_DENSE
FROM   STUDENT1;

--6. Display branch-wise sequential numbering of students.-- 
SELECT *,
       ROW_NUMBER() OVER (PARTITION BY BRANCH ORDER BY SPI) AS BRANCH_SPI_SEQ
FROM   STUDENT1;

--7. Display SNAME, Current SPI, Previous SPI and SPI Difference with previous student in ascending order of SPI. --
SELECT   SNAME,
         SPI AS CURR_SPI,
         LAG(SPI) OVER (ORDER BY SPI ASC) AS PREV_SPI,
         SPI - LAG(SPI) OVER (ORDER BY SPI ASC) AS DIFF_SPI
FROM     STUDENT1
ORDER BY SPI ASC;

--8. Display SNAME, Current SPI, Next SPI and SPI Difference with next student in descending order of SPI.  --
SELECT   SNAME,
         SPI AS CURR_SPI,
         LEAD(SPI) OVER (ORDER BY SPI DESC) AS NEXT_SPI,
         SPI - LEAD(SPI) OVER (ORDER BY SPI DESC) AS DIFF_SPI
FROM     STUDENT1
ORDER BY SPI DESC;

--9. Display top 3 students based on SPI. --
SELECT   TOP (3) *
FROM     STUDENT1
ORDER BY SPI DESC;

--10. Display top 2 students from each branch.-- 
SELECT   *
FROM     (SELECT *,
                 ROW_NUMBER() OVER (PARTITION BY BRANCH ORDER BY SPI DESC) AS RN
          FROM   STUDENT1) AS T
WHERE    RN <= 2
ORDER BY BRANCH, RN;

--Part – B: --
--11. Display 5th highest SPI.-- 
SELECT SPI
FROM   (SELECT DISTINCT SPI,
                        ROW_NUMBER() OVER (ORDER BY SPI DESC) AS RN
        FROM   STUDENT1) AS T
WHERE  RN = 5;

--12. Display 6th highest SPI. --
SELECT SPI
FROM   (SELECT DISTINCT SPI,
                        ROW_NUMBER() OVER (ORDER BY SPI DESC) AS RN
        FROM   STUDENT1) AS T
WHERE  RN = 6;

--13. Display students having same ranking.-- 
WITH     R
AS       (SELECT *,
                 RANK() OVER (ORDER BY SPI DESC) AS RNK
          FROM   STUDENT1)
SELECT   *
FROM     R
WHERE    RNK IN (SELECT   RNK
                 FROM     R
                 GROUP BY RNK
                 HAVING   COUNT(*) > 1)
ORDER BY RNK, SPI DESC;

--14. Display SNAME, Previous SPI, Current SPI and Next SPI based on ascending order of SPI.-- 
SELECT   SNAME,
         LAG(SPI) OVER (ORDER BY SPI ASC) AS PREV_SPI,
         SPI AS CURR_SPI,
         LEAD(SPI) OVER (ORDER BY SPI ASC) AS NEXT_SPI
FROM     STUDENT1
ORDER BY SPI ASC;

--15. Display topper of each branch. --
SELECT   SNAME,
         BRANCH,
         SPI
FROM     (SELECT SNAME,
                 BRANCH,
                 SPI,
                 ROW_NUMBER() OVER (PARTITION BY BRANCH ORDER BY SPI DESC) AS RN
          FROM   STUDENT1) AS T
WHERE    RN = 1
ORDER BY BRANCH;

--Part – C: --
--16. Display students whose SPI is greater than the previous student and less than the next student.-- 
SELECT   *
FROM     (SELECT *,
                 LAG(SPI) OVER (ORDER BY SPI ASC) AS PREV_SPI,
                 LEAD(SPI) OVER (ORDER BY SPI ASC) AS NEXT_SPI
          FROM   STUDENT1) AS T
WHERE    PREV_SPI IS NOT NULL
         AND NEXT_SPI IS NOT NULL
         AND SPI > PREV_SPI
         AND SPI < NEXT_SPI
ORDER BY SPI ASC;

--17. Display branch-wise second topper students. --
SELECT   SNAME,
         BRANCH,
         SPI
FROM     (SELECT SNAME,
                 SPI,
                 BRANCH,
                 ROW_NUMBER() OVER (PARTITION BY BRANCH ORDER BY SPI DESC) AS RN
          FROM   STUDENT1) AS T
WHERE    RN = 2
ORDER BY BRANCH;

--18. Display students whose rank and dense rank are different.-- 
SELECT   *
FROM     (SELECT *,
                 RANK() OVER (ORDER BY SPI DESC) AS rnk,
                 DENSE_RANK() OVER (ORDER BY SPI DESC) AS drnk
          FROM   STUDENT1) AS t
WHERE    rnk <> drnk
ORDER BY SPI DESC;

--19. Display consecutive students having same branch ordered by SPI.-- 
SELECT   *
FROM     (SELECT *,
                 LAG(BRANCH) OVER (ORDER BY SPI DESC) AS prev_branch
          FROM   STUDENT1) AS t
WHERE    prev_branch = BRANCH
ORDER BY SPI DESC;

--20. Display students whose SPI difference with previous student is maximum.-- 
SELECT   TOP (1) SNAME,
                 SPI,
                 prev_spi,
                 ABS(SPI - prev_spi) AS DiffWithPrev
FROM     (SELECT SNAME,
                 SPI,
                 LAG(SPI) OVER (ORDER BY SPI ASC) AS prev_spi
          FROM   STUDENT1) AS t
WHERE    prev_spi IS NOT NULL
ORDER BY ABS(SPI - prev_spi) DESC;