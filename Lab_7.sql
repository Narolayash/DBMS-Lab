CREATE TABLE EMP (
	EID INT,
	ENAME VARCHAR(20),
	DEPARTMENT VARCHAR(20), 
	SALARY INT,
	JOININGDATE DATETIME,
	CITY VARCHAR(20),
	GENDER VARCHAR(20)
);

INSERT INTO EMP VALUES 
(101, 'RAHUL', 'ADMIN', 56000, '1990-01-01', 'RAJKOT', 'MALE'),
(102, 'HARDIK', 'IT', 18000, '1990-09-25', 'AHMEDABAD', 'MALE'),
(103, 'BHAVIN', 'HR', 25000, '1991-05-14', 'BARODA', 'MALE'),
(104, 'BHOOMI', 'ADMIN', 39000, '1991-02-08', 'RAJLOT', 'FEMALE'),
(105, 'ROHIT', 'IT', 17000, '1990-07-23', 'JAMNAGAR', 'MALE'),
(106, 'PRIYA', 'IT', 9000, '1990-10-18', 'AHMEDABAD', 'FEMALE'),
(107, 'BOOMI', 'HR', 34000, '1991-12-25', 'RAJKOT', 'FEMALE');

SELECT *
FROM EMP;

--1. Display the Highest, Lowest, Label the columns Maximum, Minimum respectively
SELECT MAX(SALARY) AS MAXIMUM, 
	MIN(SALARY) AS MINIMUM
FROM EMP;

--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal, 
--respectively.
SELECT SUM(SALARY) AS TOTAL_SAL,
	AVG(SALARY) AS AVERAGE_SAL
FROM EMP;

--3. Find total number of employees of EMPLOYEE table. 
SELECT COUNT(EID) AS NUMBER_OF_EMP
FROM EMP;

--4. Find highest salary from Rajkot city.
SELECT MAX(SALARY) AS MAX_SAL_RAJ
FROM EMP
WHERE CITY = 'RAJKOT';

--5. Give maximum salary from IT department. 
SELECT MAX(SALARY) AS MAX_SAL_IT
FROM EMP
WHERE DEPARTMENT = 'IT';

--6. Count employee whose joining date is after 8-feb-91. 
SELECT COUNT(JOININGDATE) AS JOIN_AFT_08_02_1991
FROM EMP
WHERE JOININGDATE > '1991-02-08';

--7. Display average salary of Admin department. 
SELECT AVG(SALARY) AS AVG_SAL_AD
FROM EMP
WHERE DEPARTMENT = 'ADMIN';

--8. Display total salary of HR department. 
SELECT SUM(SALARY) AS TOTAL_SAL_HR
FROM EMP
WHERE DEPARTMENT = 'HR';

--9. Count total number of cities of employee without duplication. 
SELECT COUNT(DISTINCT CITY)
FROM EMP;

--10. Count unique departments. 
SELECT COUNT(DISTINCT DEPARTMENT)
FROM EMP;

--11. Give minimum salary of employee who belongs to Ahmedabad. 
SELECT MIN(SALARY)
FROM EMP
WHERE CITY = 'AHMEDABAD';

--12. Find city wise highest salary. 
SELECT CITY, MIN(SALARY) AS MAX_CITY_SALARY
FROM EMP
GROUP BY CITY;

--13. Find department wise lowest salary. 
SELECT DEPARTMENT, MIN(SALARY) AS MIN_DEP_SAL
FROM EMP
GROUP BY DEPARTMENT;

--14. Display city with the total number of employees belonging to each city. 
SELECT CITY, COUNT(EID) AS TOT_NUM_EMP_CITY
FROM EMP
GROUP BY CITY;

--15. Give total salary of each department of EMP table. 
SELECT DEPARTMENT, SUM(SALARY) AS TOT_SAL_DEP
FROM EMP
GROUP BY DEPARTMENT;

--16. Give average salary of each department of EMP table without displaying the respective department 
SELECT AVG(SALARY) AS SAL_DEP
FROM EMP
GROUP BY DEPARTMENT;

--name. 
--17. Count the number of employees for each department in every city.
SELECT CITY, DEPARTMENT, COUNT(EID)
FROM EMP
GROUP BY CITY, DEPARTMENT;

--18. Calculate the total salary distributed to male and female employees. 
SELECT GENDER,SUM(SALARY)
FROM EMP
GROUP BY GENDER;
--19. Give city wise maximum and minimum salary of female employees. 
SELECT GENDER, MAX(SALARY), MIN(SALARY)
FROM EMP
WHERE GENDER = 'FEMALE'
GROUP BY GENDER;
--20. Calculate department, city, and gender wise average salary.
SELECT DEPARTMENT, CITY, GENDER, AVG(SALARY)
FROM EMP
GROUP BY DEPARTMENT, CITY, GENDER;

--Part – B: 
--1. Count the number of employees living in Rajkot.
SELECT CITY, COUNT(EID) AS EMP_RAJ
FROM EMP
WHERE CITY = 'RAJKOT'
GROUP BY CITY;

--2. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE.
SELECT MAX(SALARY) - MIN(SALARY)
FROM EMP;

--3. Display the total number of employees hired before 1st January, 1991. 
SELECT COUNT(EID)
FROM EMP
WHERE JOININGDATE < '1991-01-01';


--Part – C: 

--1. Count the number of employees living in Rajkot or Baroda. 
SELECT CITY, COUNT(EID)
FROM EMP
WHERE CITY = 'RAJKOT' OR CITY = 'BARODA'
GROUP BY CITY;

--2. Display the total number of employees hired before 1st January, 1991 in IT department. 
SELECT DEPARTMENT, COUNT(EID)
FROM EMP
WHERE JOININGDATE < '1991-01-01'
GROUP BY DEPARTMENT;

--3. Find the Joining Date wise Total Salaries. 
SELECT JOININGDATE, SUM(SALARY)
FROM EMP
GROUP BY JOININGDATE;

--4. Find the Maximum salary department & city wise in which city name starts with ‘R’. 
SELECT CITY, DEPARTMENT, MAX(SALARY)
FROM EMP
WHERE CITY LIKE 'R%'
GROUP BY CITY, DEPARTMENT;