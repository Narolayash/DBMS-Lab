--Part – A: Views (First create a view then display all views) 
-- STUDENT_INFO 
-- RNo Name Branch SPI Bklog 
--101 Raju CE 8.80 0 
--102 Amit CE 2.20 3 
--103 Sanjay ME 1.50 6 
--104 Neha EC 7.65 1 
--105 Meera EE 5.52 2 
--106 Mahesh EC 4.50 3

Create Table STUDENT_INFO (
	Rno INT,
	Name VARCHAR(50),
	Branch VARCHAR(50),
	SPI INT,
	Blog INT
);

INSERT INTO STUDENT_INFO Values 
(101, 'Raju', 'CE', 8.80, 0),
(102, 'Amit', 'CE', 2.20, 3),
(103, 'Sanjay', 'ME', 1.50, 6),
(104, 'Neha', 'EC', 7.65, 0),
(105, 'Meera', 'EE', 5.52, 2),
(106, 'Mahesh', DEFAULT, 4.50, 3);

select * FROM STUDENT_INFO
--1. Create a view Personal with all columns. 
Create View Personal 
AS
SELECT * FROM STUDENT_INFO;

select * from Personal;

--2. Create a view Student_Details having columns Name, Branch & SPI.  
Create View Studnet_Details 
AS 
SELECT Name, BRANCH, SPI
FROM STUDENT_INFO;

select * from Studnet_Details;

--3. Create a view AcademicData having columns RNo, Name, Branch. 
Create View AcademicData 
AS 
SELECT Rno, Name, Branch
FROM STUDENT_INFO;

--4. Create a view Student_ bklog having all columns but students whose bklog more than 2. 
Create View Student_bklog 
AS 
SELECT *
FROM STUDENT_INFO
WHERE Blog > 2;

--5. Create a view Student_Pattern having RNo, Name & Branch columns in which Name consists of four 
--letters. 
Create View Student_Pattern 
AS 
SELECT Rno, Name, Branch
FROM STUDENT_INFO
WHERE Name Like '____';

--6. Insert a new record to AcademicData view. (107, Meet, ME) 
Insert into AcademicData values (107, 'Meet', 'ME');

--7. Update the branch of Amit from CE to ME in Student_Details view. 
Update Studnet_Details
SET Branch = 'ME'
WHERE Name = 'Amit';

--8. Delete a student whose roll number is 104 from AcademicData view. 
DELETE FROM AcademicData
WHERE Rno = 104;

--9. Create view for the student whose name starts with M and ends with a, having SPI more than 6 and 
--backlog less than 2. 
create view temp
AS
SELECT *
FROM STUDENT_INFO
WHERE name like 'M%a' ANd SPI > 6 AND blog < 2; 

--10. Create the view for the students whose name contains vowel. 
create view temp1 
AS 
SELECT *
from STUDENT_INFO
WHERE name like '%[a,i,e,o,u]%';

--Part – B:
--1.
--Create a view that displays information of all students whose SPI is above 8.5
CREATE VIEW VIEWB1
AS
SELECT * FROM STU_INFO
WHERE SPI>8.5
--2.
--Create a view that displays 0 backlog students.
CREATE VIEW VIEWB2
AS
SELECT * FROM STU_INFO
WHERE BKLOG=0
--3.
--Create a view Computerview that displays CE branch data only.
CREATE VIEW COMPUTERVIEW
AS
SELECT * FROM STU_INFO
WHERE BRANCH='CE'
--Part – C:
--1.
--Create a view Result_EC that displays the name and SPI of students with SPI less than 5 of branch EC.
CREATE VIEW Result_EC
AS
SELECT NAME,SPI FROM STU_INFO
WHERE SPI<5 AND BRANCH='EC'
--2.
--Update the result of student MAHESH to 4.90 in Result_EC view.
UPDATE Result_EC
SET SPI=4.90
WHERE NAME='MAHESH'
--3.
--Create a view Stu_Bklog with RNo, Name and Bklog columns in which name starts with ‘M’ and having bklogs more than 5.
CREATE VIEW STU_BKLOG
AS 
SELECT NAME,RNO,BKLOG FROM STU_INFO
WHERE NAME LIKE 'M%' AND BKLOG>5
--4.
--Drop Computerview form the database.
DROP VIEW COMPUTERVIEW