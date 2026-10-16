--LAB-8--

--PART-A--
USE d2d_adi_160
--1. Display the Highest, Lowest Salary and Label the columns Maximum, Minimum respectively.--

SELECT MAX(SALARY) AS MAXIMUM,MIN(SALARY) AS MINIMUM  FROM EMPLOYEE1
SELECT * FROM EMPLOYEE1

--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal,respectively. --

SELECT SUM(SALARY) AS TOTAL_SALARY, AVG(SALARY) AS AVERAGE_SALARY FROM EMPLOYEE1
SELECT * FROM EMPLOYEE1

--3. Find total number of employees of EMPLOYEE table.--

SELECT COUNT(EID) AS COUNT_EMPLOYEE FROM EMPLOYEE1
SELECT * FROM EMPLOYEE1

--4. Find highest salary from Rajkot city.--

SELECT MAX(SALARY) AS MAXIMUM_SALARY_RAJKOT FROM EMPLOYEE1
WHERE CITY='RAJKOT'
SELECT * FROM EMPLOYEE1

--5. Give maximum salary from IT department.--

SELECT MAX(SALARY) AS MAXIMUM_SALARY_IT FROM EMPLOYEE1
WHERE DEPARTMENT='IT'
SELECT * FROM EMPLOYEE1

--6. Count employee department is HR. --

SELECT COUNT(EID) AS COUNT_EMPLOYEE_HR FROM EMPLOYEE1
WHERE DEPARTMENT='HR'
SELECT * FROM EMPLOYEE1

--7. Display average salary of Admin department.--

SELECT AVG(SALARY) AS AVERAGE_SAL_ADMIN FROM EMPLOYEE1
WHERE DEPARTMENT='ADMIN'
SELECT * FROM EMPLOYEE1

--8. Display total salary of HR department.--

SELECT SUM(SALARY) AS TOTAL_SAL_HR FROM EMPLOYEE1
WHERE DEPARTMENT='HR'
SELECT* FROM EMPLOYEE1

--9. Count total number of cities of employee without duplication.--

SELECT COUNT(DISTINCT CITY) AS CITIES FROM EMPLOYEE1
SELECT * FROM EMPLOYEE1

--10. Count unique departments.--

SELECT COUNT(DISTINCT DEPARTMENT) AS UNIQUE_DEPARTMENT FROM EMPLOYEE1

--11. Display minimum salary of employee who belongs to Ahmedabad.--

SELECT MIN(SALARY) AS MIN_SAL_EMP_AHMEDABAD FROM EMPLOYEE1
WHERE CITY='AHMEDABAD'

--12. Find city wise highest salary.--

SELECT CITY, MAX(SALARY) AS MAX_CITY_WISE FROM EMPLOYEE1
GROUP BY CITY

--13. Find department wise lowest salary. --

SELECT DEPARTMENT, MAX(SALARY) AS MAX_DEPT_WISE FROM EMPLOYEE1
GROUP BY DEPARTMENT

--14. Display minimum salary in each city. --

SELECT CITY, MIN(SALARY) AS EACH_CITY FROM EMPLOYEE1
GROUP BY CITY

--15. Display average salary of employees from Surat.--

SELECT AVG(SALARY) AS AVG_SAL_SURAT FROM EMPLOYEE1
WHERE CITY = 'SURAT'

--16. Display total salary of female employees. --

SELECT SUM(SALARY) AS TOTAL_SAL_FEMALE FROM EMPLOYEE1
WHERE GENDER='FEMALE'

--17. Count number of male employees. --

SELECT COUNT(EID) AS COUNT_MALE FROM EMPLOYEE1
WHERE GENDER='MALE'

--18. Display city with the total number of employees belonging to each city. --

SELECT CITY,COUNT(EID) AS COUNT_EMPLOYEE_CITYWISE FROM EMPLOYEE1
GROUP BY CITY

--19. Count number of employees in each city where gender is MALE.--

SELECT CITY,COUNT(EID) AS COUNT_EMPLOYEE_CITYWISE_MALE FROM EMPLOYEE1
WHERE GENDER='MALE'
GROUP BY CITY

--20. Display maximum salary in each department where city is not Ahmedabad. --

SELECT DEPARTMENT,MAX(SALARY) AS MAXIMUM_SALARY_NOT_AHMEDABAD FROM EMPLOYEE1
WHERE CITY<>'AHEMDABAD'
GROUP BY DEPARTMENT

--PART-B--

--21. Display minimum salary in each city where gender is FEMALE.--

SELECT CITY,MIN(SALARY) AS MIN_SAL_FEMALE_CITYWISE FROM EMPLOYEE1
WHERE GENDER='FEMALE'
GROUP BY CITY

--22. Give total salary of each department of EMPLOYEE table.--

SELECT DEPARTMENT,SUM(SALARY) AS TOTAL_SALARY_DEPT FROM EMPLOYEE1
GROUP BY DEPARTMENT

--23. Give average salary of each department of EMPLOYEE table without displaying the respective department name.--

SELECT AVG(SALARY) AS AVERAGE_SAL FROM EMPLOYEE1
GROUP BY DEPARTMENT

--24. Count the number of employees for each department in every city.--

SELECT DEPARTMENT,CITY, COUNT(EID) AS EMPLOYEE_COUNT_CITY_DEPARTMENT FROM EMPLOYEE1
GROUP BY DEPARTMENT,CITY

--25. Calculate the total salary distributed to male and female employees.--

SELECT GENDER,SUM(SALARY) AS SAL_MALE_FEMALE FROM EMPLOYEE1
GROUP BY GENDER

--PART-C--

--26. Give city wise maximum and minimum salary of female employees. --

SELECT CITY,MAX(SALARY) AS FEMALE_MAX_SALRY,MIN(SALARY) AS FEMALE_MIN_SALRY FROM EMPLOYEE1
WHERE GENDER='FEMALE'
GROUP BY CITY

--27. Calculate department, city, and gender wise average salary.--

SELECT DEPARTMENT,CITY,GENDER, AVG(SALARY) AS _AVG_SALARY FROM EMPLOYEE1
GROUP BY DEPARTMENT,CITY,GENDER

--28. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE.--

SELECT MAX(SALARY)-MIN(SALARY) AS DIFFERNCE FROM EMPLOYEE1

--29. Display sum of salaries of department wise where department name consist 5 letter. --

SELECT DEPARTMENT,SUM(SALARY) AS TOTAL_DEPT_SAL FROM EMPLOYEE1
WHERE DEPARTMENT LIKE '_____'
GROUP BY DEPARTMENT

--30. Find the Maximum salary department & city wise in which city name starts with ‘R’.--

SELECT DEPARTMENT,CITY,MAX(SALARY) AS MAX_SALARY FROM EMPLOYEE1
WHERE CITY LIKE 'R%'
GROUP BY DEPARTMENT,CITY