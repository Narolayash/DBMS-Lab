 --Part – A: 
--1. Combine information from Person and Department table using cross join or Cartesian product. 
SELECT * 
FROM Person
CROSS JOIN Dept;

--2. Find all persons with their department name 
SELECT Person.PersonName, Dept.DepartmentName
FROM Person
JOIN Dept
ON Person.DepartmentID = Dept.DepartmentID;

--3. Find all persons with their department name & code.
SELECT Person.PersonName,Dept.DepartmentID, Dept.DepartmentName
FROM Person
JOIN Dept
ON Person.DepartmentID = Dept.DepartmentID;

--4. Find all persons with their department code and location. 
SELECT Person.PersonID, Dept.DepartmentCode, Dept.Location
FROM Person
JOIN Dept
ON Person.DepartmentID = Dept.DepartmentID;

--5. Find the detail of the person who belongs to Mechanical department. 
SELECT *
FROM Person
JOIN Dept
ON Person.DepartmentID = Dept.DepartmentID
WHERE Dept.DepartmentName = 'Mechanical';

--6. Final person’s name, department code and salary who lives in Ahmedabad city.  
SELECT Person.PersonID, Dept.DepartmentCode, Person.Salary
FROM Person
LEFT OUTER JOIN Dept
ON Person.DepartmentID = Dept.DepartmentID
WHERE Person.City = 'Ahmedabad';

--7. Find the person's name whose department is in C-Block. 
SELECT Person.PersonID, Dept.Location
FROM Person
RIGHT OUTER JOIN Dept
ON Person.DepartmentID = Dept.DepartmentID
WHERE Dept.Location = 'C-Block';

--8. Retrieve person name, salary & department name who belongs to Jamnagar city. 
SELECT Person.PersonName, Person.Salary, Dept.DepartmentName
FROM Person
LEFT OUTER JOIN Dept
ON Person.DepartmentID = Dept.DepartmentID
WHERE Person.City = 'Jamnagar';

--9. Retrieve person’s detail who joined the Civil department after 1-Aug-2001. 
SELECT *
FROM Person
LEFT OUTER JOIN Dept
ON Person.DepartmentID = Dept.DepartmentID
WHERE JoiningDate > '2001-08-01';

--10. Display all the person's name with the department whose joining date difference with the current date 
--is more than 365 days. 
SELECT Person.PersonName, Dept.DepartmentName
FROM Person
LEFT OUTER JOIN Dept
ON Person.DepartmentID = Dept.DepartmentID
WHERE DATEDIFF(DAY, JoiningDate, GETDATE()) > 365;

--11. Find department wise person counts. 
SELECT Dept.DepartmentName, Count(Person.PersonName)
FROM Person
LEFT OUTER JOIN Dept
ON Person.DepartmentID = Dept.DepartmentID
GROUP BY Dept.DepartmentName;

--12. Give department wise maximum & minimum salary with department name. 
SELECT MAX(person.Salary), MIN(Person.Salary), Dept.DepartmentName
FROM Person
RIGHT OUTER JOIN Dept
ON Person.DepartmentID = Dept.DepartmentID
GROUP BY Dept.DepartmentName;

--13. Find city wise total, average, maximum and minimum salary. 
SELECT SUM(Salary), AVG(Salary), MAX(Salary), MIN(Salary), City
FROM Person
GROUP BY City;

--14. Find the average salary of a person who belongs to Ahmedabad city.
SELECT AVG(Salary), City
FROM Person
WHERE City = 'Ahmedabad'
GROUP BY City;

--15. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In 
--single column) 
SELECT Person.PersonName + 'lives in' + Person.City + 'and works in' + Dept.DepartmentName + 'Department.'
FROM Person
JOIN Dept 
ON Person.DepartmentID = Dept.DepartmentID;


--Part – B: 

--1. Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly. (In 
--single column) 
SELECT Person.PersonName + 'earns' + CAST(Person.Salary AS varchar) + 'form' + Dept.DepartmentName + 'department monthly.'
FROM Person
JOIN Dept
ON Person.DepartmentID = Dept.DepartmentID;

--2. Find city & department wise total, average & maximum salaries. 
SELECT P.City, D.DepartmentName, SUM(P.Salary), AVG(P.Salary), MAX(P.Salary)
FROM Person P
JOIN Dept D
ON P.DepartmentID = D.DepartmentID
GROUP BY P.City, D.DepartmentName;

--3. Find all persons who do not belong to any department. 

--4. Find all departments whose total salary is exceeding 100000. 
--Part – C: 
--1. List all departments who have no person. 
--2. List out department names in which more than two persons are working. 
--3. Give a 10% increment in the computer department employee’s salary. (Use Update)