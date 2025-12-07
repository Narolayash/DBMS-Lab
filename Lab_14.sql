Create Table STUDENT_DATA (
	Rno INT,
	Name varchar(20),
	City varchar(20),
	DID INT
);

Insert Into STUDENT_DATA Values 
(101, 'Raju', 'Rajkot', 10),
(102, 'Amit', 'Ahmedabad', 20),
(103, 'Sanjay', 'Baroda', 40),
(104, 'Neha', 'Rajkot', 20),
(105, 'Meera', 'Ahmedabad', 30),
(106, 'Mahesh', 'Baroda', 10);

Create Table DEPARTMENT (
	DID INT,
	DName varchar(20)
);

Insert Into DEPARTMENT Values 
(10, 'Computer'),
(20, 'Electrical'),
(30, 'Mechanical'),
(40, 'Civil');

Create Table ACADEMIC (
	Rno INT,
	SPI DECIMAL(3, 1),
	BKLOG INT
);

Insert Into ACADEMIC Values
(101, 8.8, 0),
(102, 9.2, 2),
(103, 7.6, 1),
(104, 8.2, 4),
(105, 7.0, 2),
(106, 8.9, 3);



--Part – A: 
--1. Display details of students who are from computer department. 
SELECT * 
FROM STUDENT_DATA 
WHERE DID = (
	SELECT DID 
	FROM DEPARTMENT
	WHERE DName = 'Computer'
);

--2. Displays name of students whose SPI is more than 8. 
SELECT Name 
FROM STUDENT_DATA 
WHERE Rno IN (
	SELECT Rno 
	FROM ACADEMIC
	WHERE SPI > 8
);

--3. Display details of students of computer department who belongs to Rajkot city.
SELECT * FROM STUDENT_DATA 
WHERE City = 'Rajkot' AND DID = (
	SELECT DID 
	FROM DEPARTMENT 
	WHERE DName = 'Computer'
);

--4. Find total number of students of electrical department. 
SELECT COUNT(Rno)
FROM STUDENT_DATA 
WHERE DID = (
	SELECT DID 
	FROM DEPARTMENT 
	WHERE DName = 'Electrical'
);

--5. Display name of student who is having maximum SPI.
SELECT Name 
FROM STUDENT_DATA
WHERE Rno = (
	SELECT Rno
	FROM ACADEMIC
	WHERE SPI = (
		SELECT MAX(SPI)
		FROM ACADEMIc
	)
);

--6. Display details of students having more than 1 backlog. 
SELECT * FROM STUDENT_DATA
WHERE RNO IN (
	SELECT Rno FROM ACADEMIC
	WHERE BKLOG > 1
);

--Part – B: 
--1. Display name of students who are either from computer department or from mechanical department. 
SELECT Name FROM STUDENT_DATA
WHERE DID IN (
	SELECT DID FROM DEPARTMENT
	WHERE Dname = 'Computer' OR Dname = 'Mechanical'
);

--2. Display name of students who are in same department as 102 studying in. 
SELECT Name FROM STUDENT_DATA 
WHERE DID = (
	SELECT DID FROM STUDENT_DATA 
	WHERE Rno = 102
);


--Part – C: 
--1. Display name of students whose SPI is more than 9 and who is from electrical department. 
SELECT Name FROM STUDENT_DATA
WHERE Rno IN (SELECT Rno FROM ACADEMIC WHERE SPI > 9) AND
		DID = (SELECT DID FROM DEPARTMENT WHERE DName = 'Electrical');

--2. Display name of student who is having second highest SPI. 
SELECT Name FROM STUDENT_DATA 
WHERE Rno = (
	SELECT Rno FROM ACADEMIC
	WHERE SPI = (SELECT TOP 1 SPI FROM ACADEMIC
					WHERE SPI < (
						SELECT MAX(SPI) FROM ACADEMIC
						)
					order by SPI Desc
				)
	);

--3. Display city names whose students SPI is 9.2 
SELECT City FROM STUDENT_DATA 
WHERE Rno = (
	SELECT Rno FROM ACADEMIC
	WHERE SPI = 9.2
);

--4. Find the names of students who have more than the average number of backlogs across all students. 
SELECT Name FROM STUDENT_DATA
WHERE Rno IN (
	SELECT Rno FROM ACADEMIC
	WHERE BKLOG > (SELECT AVG(BKLOG) FROM ACADEMIC)
);

--5. Display the names of students who are in the same department as the student with the highest SPI. 
SELECT Name FROM STUDENT_DATA 
WHERE DID = (SELECT DID FROM DEPARTMENT 
				WHERE DID = (SELECT DID FROM STUDENT_DATA
								WHERE Rno = (SELECT Rno FROM ACADEMIC
												WHERE SPI = (SELECT MAX(SPI) FROM ACADEMIC)
											)
							)
			)


--SET Operators 
--Part – A: 
--Create below two tables as per following data. 
--COMPUTER  ELECTRICAL 
--RollNo 
--Name  
--RollNo 
--101 
--Name 
--Ajay  
--105 
--109 
--Haresh  
--107 
--Ajay 
--115 
--Mahesh 
--Manish  
--115 
--Manish 

Create Table COMPUTER (
	RollNo INT,
	Name varchar(20)
);

Insert Into COMPUTER Values 
(101, 'Ajay'),
(109, 'Haresh'),
(115, 'Manish');

Create Table ELECTRICAL (
	RollNo INT,
	Name varchar(20)
);

Insert Into ELECTRICAL Values 
(105, 'Ajay'),
(107, 'Mahesh'),
(115, 'Manish');


--1. Display name of students who is either in Computer or in Electrical. 
SELECT Name FROM COMPUTER
UNION
SELECT Name FROM ELECTRICAL;

--2. Display name of students who is either in Computer or in Electrical including duplicate data. 
SELECT Name FROM COMPUTER
UNION ALL
SELECT Name FROM ELECTRICAL;

--3. Display name of students who is in both Computer and Electrical. 
SELECT Name FROM COMPUTER
INTERSECT
SELECT Name FROM ELECTRICAL;

--4. Display name of students who are in Computer but not in Electrical.
SELECT Name FROM COMPUTER
EXCEPT
SELECT Name FROM ELECTRICAL;

--5. Display name of students who are in Electrical but not in Computer. 
SELECT Name FROM ELECTRICAL
EXCEPT
SELECT Name FROM COMPUTER;

--6. Display all the details of students who are either in Computer or in Electrical. 
SELECT * FROM COMPUTER
UNION
SELECT * FROM ELECTRICAL;

--7. Display all the details of students who are in both Computer and Electrical. 
SELECT * FROM COMPUTER
INTERSECT
SELECT * FROM ELECTRICAL;

--Part – B: 
--Create below two tables as per following data. 
--EMP_DATA  CUSTOMER 
--EID 
--Name  
--1 
--Ajay  
--CID 
--Name 
--5 
--9 
--Haresh  
--Ajay 
--7 
--5 
--Manish  
--5 
--Mahesh 
--Manish 

Create Table EMP_DATA (
	EID INT,
	Name varchar(20)
);

Create Table CUSTOMER (
	CID INT,
	Name varchar(20)
);

Insert Into EMP_DATA Values 
(1,'Ajay'),
(9,'Haresh'),
(5,'Manish');

Insert Into CUSTOMER Values 
(5,'Ajay'),
(7,'Mahesh'),
(5,'Manish');

--1. Display name of persons who is either Employee or Customer. 
SELECT Name FROM EMP_DATA
UNION 
SELECT Name FROM CUSTOMER;

--2. Display name of persons who is either Employee or Customer including duplicate data. 
SELECT Name FROM EMP_DATA
UNION ALL
SELECT Name FROM CUSTOMER;

--3. Display name of persons who is both Employee as well as Customer. 
SELECT Name FROM EMP_DATA
INTERSECT
SELECT Name FROM CUSTOMER;

--4. Display name of persons who are Employee but not Customer. 
SELECT Name FROM EMP_DATA
EXCEPT
SELECT Name FROM CUSTOMER;

--5. Display name of persons who are Customer but not Employee.
SELECT Name FROM CUSTOMER
EXCEPT
SELECT Name FROM EMP_DATA;


--Part – C:  
--1. Perform all the queries of Part-B but display ID and Name columns instead of Name only. 

SELECT EID, Name FROM EMP_DATA
UNION 
SELECT CID, Name FROM CUSTOMER;


SELECT EID, Name FROM EMP_DATA
UNION ALL
SELECT CID, Name FROM CUSTOMER;


SELECT EID, Name FROM EMP_DATA
INTERSECT
SELECT CID, Name FROM CUSTOMER;


SELECT EID, Name FROM EMP_DATA
EXCEPT
SELECT CID, Name FROM CUSTOMER;


SELECT CID, Name FROM CUSTOMER
EXCEPT
SELECT EID, Name FROM EMP_DATA;