--Part – A: 
--Create below table with following constraints 
--1. Do not allow SPI more than 10 
--2. Do not allow Bklog less than 0. 
--3. Enter the default value as ‘General’ in branch to all new records IF no other value is specified. 
--4. Try to update SPI of Raju from 8.80 to 12. 
--5. Try to update Bklog of Neha from 0 to -1

Create Table STU_MASTER (
	Rno INT NOT NULL PRIMARY KEY,
	Name VARCHAR(50),
	Branch VARCHAR(50) DEFAULT 'General',
	SPI DECIMAL(4,2) CHECK (SPI <= 10),
	Bklog INT CHECK (Bklog >= 0)
);

drop table STU_MASTER

INSERT INTO STU_MASTER Values 
(101, 'Raju', 'CE', 8.80, 0),
(102, 'Amit', 'CE', 2.20, 3),
(103, 'Sanjay', 'ME', 1.50, 6),
(104, 'Neha', 'EC', 7.65, 0),
(105, 'Meera', 'EE', 5.52, 2),
(106, 'Mahesh', DEFAULT, 4.50, 3);

select * from STU_MASTER

--4. Try to update SPI of Raju from 8.80 to 12. 
UPDATE STU_MASTER
SET SPI = 12
WHERE Name = 'Raju';

--5. Try to update Bklog of Neha from 0 to -1 
UPDATE STU_MASTER
SET Bklog = -1
WHERE Name = 'Neha';

--Part – B: Create table as per following schema with proper validation and try to insert data which violate your 
--validation. 
--1. Emp_details(Eid, Ename, Did, Cid, Salary, Experience) 

Create Table Emp_details (
	Eid INT NOT NULL PRIMARY KEY,
	EName VARCHAR(50),
	Did INT FOREIGN KEY REFERENCES Dept_details(Did),
	Cid INT FOREIGN KEY REFERENCES City_details(Cid),
	Salary DECIMAL(8, 2),
	Experience INT
);
--Dept_details(Did, Dname) 
Create Table Dept_details (
	Did INT NOT NULL PRIMARY KEY,
	Dname VARCHAR(50)
);

--City_details(Cid, Cname) 
Create Table City_details (
	Cid INT NOT NULL PRIMARY KEY,
	Cname VARCHAR(50)
);

Drop Table Emp_info;
Drop Table Dept_info;
Drop Table City_info;
Drop Table District;
Drop Table State;
Drop Table Country;
--Part – C: Create table as per following schema with proper validation and try to insert data which violate your 
--validation. 
--1. Emp_info(Eid, Ename, Did, Cid, Salary, Experience) 
Create Table Emp_info (
	Eid INT PRIMARY KEY,
	Ename VARCHAR(50),
	Did INT FOREIGN KEY REFERENCES Dept_info(Did),
	Cid INT FOREIGN KEY REFERENCES City_info(Cid),
	Salary DECIMAL(8, 2),
	Experience INT
);

--Dept_info(Did, Dname) 
Create Table Dept_info (
	Did INT NOT NULL PRIMARY KEY,
	Dname VARCHAR(50)
);

--City_info(Cid, Cname, Did)) 
Create Table City_info (
	Cid INT NOT NULL PRIMARY KEY,
	Cname VARCHAR(50),
	Did INT FOREIGN KEY REFERENCES District(Did)
);

--District(Did, Dname, Sid) 
Create Table District (
	Did INT PRIMARY KEY,
	Dname VARCHAR(50),
	Sid INT FOREIGN KEY REFERENCES State(Sid)
);

--State(Sid, Sname, Cid) 
Create Table State (
	Sid INT PRIMARY KEY,
	Sname VARCHAR(50),
	Cid INT FOREIGN KEY REFERENCES Country(Cid)
);

--Country(Cid, Cname) 
Create Table Country (
	Cid INT PRIMARY KEY,
	Cname VARCHAR(50)
);
--2. Insert 5 records in each table. 
-- Country
INSERT INTO Country (Cid, Cname) VALUES
(1, 'India'),
(2, 'USA'),
(3, 'UK'),
(4, 'Canada'),
(5, 'Australia');

-- State
INSERT INTO State (Sid, Sname, Cid) VALUES
(1, 'Gujarat', 1),
(2, 'California', 2),
(3, 'London State', 3),
(4, 'Ontario', 4),
(5, 'Sydney State', 5);

-- District
INSERT INTO District (Did, Dname, Sid) VALUES
(1, 'Ahmedabad', 1),
(2, 'Los Angeles District', 2),
(3, 'London District', 3),
(4, 'Toronto District', 4),
(5, 'Sydney District', 5);

-- City
INSERT INTO City_info (Cid, Cname, Did) VALUES
(1, 'Ahmedabad City', 1),
(2, 'Los Angeles', 2),
(3, 'London City', 3),
(4, 'Toronto', 4),
(5, 'Sydney', 5);

-- Department
INSERT INTO Dept_info (Did, Dname) VALUES
(10, 'HR'),
(20, 'IT'),
(30, 'Finance'),
(40, 'Marketing'),
(50, 'Operations');

-- Employee
INSERT INTO Emp_info (Eid, Ename, Did, Cid, Salary, Experience) VALUES
(101, 'Amit', 10, 1, 50000, 5),
(102, 'Rina', 20, 2, 60000, 6),
(103, 'John', 30, 3, 75000, 8),
(104, 'Sara', 40, 4, 80000, 7),
(105, 'David', 50, 5, 90000, 10);

--3. Display employeename, departmentname, Salary, Experience, City, District, State and country of all 
--employees. 
SELECT 
    E.Ename AS EmployeeName,
    D.Dname AS DepartmentName,
    E.Salary,
    E.Experience,
    C.Cname AS City,
    Dist.Dname AS District,
    S.Sname AS State,
    Ctry.Cname AS Country
FROM Emp_info E
JOIN Dept_info D ON E.Did = D.Did
JOIN City_info C ON E.Cid = C.Cid
JOIN District Dist ON C.Did = Dist.Did
JOIN State S ON Dist.Sid = S.Sid
JOIN Country Ctry ON S.Cid = Ctry.Cid;
