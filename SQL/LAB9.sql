--LAB-9--

--PART-A--

--1. Display cities where total salary of employees greater than 20000.--

SELECT CITY,SUM(SALARY) AS TOTAL_CITY_SAL FROM EMPLOYEE1
GROUP BY CITY
HAVING SUM(SALARY) >20000
ORDER BY CITY

--2. Display departments having average salary greater than 12000. --

SELECT DEPARTMENT,AVG(SALARY) AS AVG_SAL_DEPT FROM EMPLOYEE1
GROUP BY DEPARTMENT
HAVING SUM(SALARY) >12000
ORDER BY DEPARTMENT

--3. Display departments having total salary greater than 20000. --

SELECT DEPARTMENT,SUM(SALARY) AS TOTAL_SAL_DEPT FROM EMPLOYEE1
GROUP BY DEPARTMENT
HAVING SUM(SALARY) >20000
ORDER BY DEPARTMENT

--4. Display departments having number of employees greater than 2. --

SELECT DEPARTMENT,COUNT(EID) AS COUNT_OF_EMP FROM EMPLOYEE1
GROUP BY DEPARTMENT
HAVING COUNT(EID) > 2
ORDER BY DEPARTMENT

--5. Display cities where minimum salary less than 7000. --

SELECT CITY,MIN(SALARY) AS MIN_CITY_SAL FROM EMPLOYEE1
GROUP BY CITY
HAVING MIN(SALARY) < 7000
ORDER BY CITY

--6. Display cities where average salary less than 12000.--

SELECT CITY,AVG(SALARY) AS AVG_CITY_SAL FROM EMPLOYEE1
GROUP BY CITY
HAVING AVG(SALARY) < 12000
ORDER BY CITY

--7. Display departments where maximum salary greater than 14000.--

SELECT DEPARTMENT,MAX(SALARY) AS MAX_DEPT_SAL FROM EMPLOYEE1
GROUP BY DEPARTMENT
HAVING MAX(SALARY) > 14000
ORDER BY DEPARTMENT

--8. Display cities where total salary greater than equal to 30000. --

SELECT CITY,SUM(SALARY) AS SUM_CITY_SAL FROM EMPLOYEE1
GROUP BY CITY
HAVING SUM(SALARY) >= 30000

--9. Display departments having number of employees equal to 2.--

SELECT DEPARTMENT, COUNT(EID) AS COUNT_EMP FROM EMPLOYEE1
GROUP BY DEPARTMENT
HAVING COUNT(EID) = 2

--10. Display cities having number of female employees greater than equal to 1.--

SELECT CITY ,COUNT(EID) AS FEMALE_COUNT FROM EMPLOYEE1
WHERE GENDER = 'FEMALE'
GROUP BY CITY
HAVING COUNT(EID) >= 1

--11. Display departments where minimum salary of male employees greater than 7000.--

SELECT DEPARTMENT, MIN(SALARY) AS MALE_SAL FROM EMPLOYEE1
WHERE GENDER = 'MALE'
GROUP BY DEPARTMENT
HAVING MIN(SALARY) > 7000

--12. Display cities where maximum salary of female employees less than 13000.--

SELECT CITY, MAX(SALARY) AS FEMALE_MAX_SAL FROM EMPLOYEE1
WHERE GENDER = 'FEMALE'
GROUP BY CITY
HAVING MAX(SALARY) < 13000

--13. Display departments where average salary greater than 10000 and less than 14000. --

SELECT DEPARTMENT, AVG(SALARY) AS AVG_SAL FROM EMPLOYEE1
GROUP BY DEPARTMENT
HAVING AVG(SALARY) >10000 AND AVG(SALARY) < 14000

--14. Display cities where number of employees joined before 2023 greater than 1.--

SELECT CITY, COUNT(EID) AS COUNT_EMP FROM EMPLOYEE1
WHERE JOININGYEAR < 2023
GROUP BY CITY
HAVING COUNT(EID) > 1
SELECT * FROM EMPLOYEE1

--15. Display cities where total salary of male employees greater than 15000, ordered by total salary. --

SELECT CITY, SUM(SALARY) AS MALE_SAL FROM EMPLOYEE1
WHERE GENDER = 'MALE'
GROUP BY CITY
HAVING SUM(SALARY) > 15000
ORDER BY MALE_SAL

--16. Display departments where maximum salary greater than 13000, ordered by max salary. --

SELECT DEPARTMENT, MAX(SALARY) AS MAX_SAL FROM EMPLOYEE1
GROUP BY DEPARTMENT
HAVING MAX(SALARY) > 13000
ORDER BY MAX_SAL

--17. Display cities where total salary of male employees greater than 15000.--

SELECT CITY, SUM(SALARY) AS TOTAL_SAL FROM EMPLOYEE1
WHERE GENDER = 'MALE'
GROUP BY CITY
HAVING SUM(SALARY) > 15000

--18. Display departments where employees joined after 2022 and count greater than 1.--

SELECT DEPARTMENT, COUNT(EID) AS COUNT_EMP FROM EMPLOYEE1
WHERE JOININGYEAR > 2022
GROUP BY DEPARTMENT
HAVING COUNT(EID) > 1

--19. Display departments where average salary of female employees greater than 8000.--

SELECT DEPARTMENT, AVG(SALARY) AS FEMALE_SAL FROM EMPLOYEE1
WHERE GENDER = 'FEMALE'
GROUP BY DEPARTMENT
HAVING AVG(SALARY) > 8000

--20. Display departments having total salary greater than 20000 and less than 40000.--

SELECT DEPARTMENT, SUM(SALARY) AS TOTAL_SAL FROM EMPLOYEE1
GROUP BY DEPARTMENT
HAVING SUM(SALARY) > 20000 AND SUM(SALARY) < 40000

--PART-B--

--21. Display departments having total salary of employees joined after 2021 greater than 20000.--

SELECT DEPARTMENT , SUM(SALARY) AS TOTAL_DEPT_SAL FROM EMPLOYEE1
WHERE JOININGYEAR > 2021
GROUP BY DEPARTMENT
HAVING SUM(SALARY) > 20000

--22. Display cities where average salary of employees joined after 2022 greater than 10000.--

SELECT CITY , AVG(SALARY) AS AVG_CITY_SAL FROM EMPLOYEE1
WHERE JOININGYEAR > 2022
GROUP BY CITY
HAVING AVG(SALARY) > 10000

--23. Display cities having number of distinct departments greater than 1.--

SELECT CITY ,COUNT(DISTINCT DEPARTMENT) FROM EMPLOYEE1
GROUP BY CITY
HAVING COUNT(DISTINCT DEPARTMENT) > 1

--24. Display cities where maximum salary of employees joined before 2022 greater than 12000.--

SELECT CITY , MAX(SALARY) AS MAX_CITY_SAL FROM EMPLOYEE1
WHERE JOININGYEAR < 2022
GROUP BY CITY
HAVING MAX(SALARY) > 12000

--25. Display departments where total salary of female employees less than 15000.--

SELECT DEPARTMENT , SUM(SALARY) AS FEMALE_SAL_MAX FROM EMPLOYEE1
WHERE GENDER = 'FEMALE'
GROUP BY DEPARTMENT
HAVING SUM(SALARY) < 15000

--PART-C--

--26. Display cities where number of male employees greater than female employees.--

SELECT CITY, COUNT(EID) AS MAL_COUNT_DIFF_FEMALE FROM EMPLOYEE1
GROUP BY CITY
HAVING SUM(CASE WHEN GENDER='MALE' THEN 1 ELSE 0 END) > SUM(CASE WHEN GENDER='FEMALE' THEN 1 ELSE 0 END)

--27. Display departments having number of cities greater than 1.--

SELECT DEPARTMENT , COUNT(CITY) AS COUNT_OF_CITY FROM EMPLOYEE1
GROUP BY DEPARTMENT
HAVING COUNT(CITY) > 1

--28. Display cities where total salary excluding IT department greater than 15000.--

SELECT CITY , SUM(SALARY) AS GREATER_THEN_IT FROM EMPLOYEE1
WHERE DEPARTMENT <> 'IT'
GROUP BY CITY
HAVING SUM(SALARY) > 15000

--29. Display departments where average salary excluding HR employees greater than 11000.--

SELECT DEPARTMENT , AVG(SALARY) AS EXCEPT_SAL FROM EMPLOYEE1
WHERE DEPARTMENT <> 'HR'
GROUP BY DEPARTMENT
HAVING SUM(SALARY) > 11000

--30. Display departments where total salary of male employees greater than female employees.--

SELECT DEPARTMENT FROM EMPLOYEE1
GROUP BY DEPARTMENT
HAVING SUM(CASE WHEN GENDER='MALE' THEN SALARY ELSE 0 END) > SUM(CASE WHEN GENDER='FEMALE' THEN SALARY ELSE 0 END)