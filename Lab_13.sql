--Part – A: 
--1. List all books with their authors.
SELECT Book.Title, Author.AuthorName 
FROM Book
JOIN Author 
ON Book.AuthorID = Author.AuthorID;

--2. List all books with their publishers. 
SELECT B.Title, P.PublisherName
FROM Book B
JOIN Publisher P
ON B.PublisherID = P.PublisherID;

--3. List all books with their authors and publishers. 
SELECT B.Title, A.AuthorName, P.PublisherName
FROM Book B
JOIN Author A
ON B.AuthorID = A.AuthorID
JOIN Publisher P
ON B.PublisherID = P.PublisherID;

--4. List all books published after 2010 with their authors and publisher and price. 
SELECT B.Title, A.AuthorName, P.PublisherName, B.PublicationYear
FROM Book B
JOIN Author A
ON B.AuthorID = A.AuthorID
JOIN Publisher P
ON B.PublisherID = P.PublisherID
WHERE B.PublicationYear > 2010;

--5. List all authors and the number of books they have written. 
SELECT A.AuthorName, Count(B.BookID)
FROM Book B
JOIN Author A
ON B.AuthorID = A.AuthorID
GROUP BY A.AuthorName;

--6. List all publishers and the total price of books they have published. 
SElECT P.PublisherName, SUM(B.Price)
FROM Book B
JOIN Publisher P
ON B.PublisherID = P.PublisherID
GROUP BY P.PublisherName;

--7. List authors who have not written any books. 
SELECT A.AuthorName, COUNT(B.BookID)
FROM Book B
RIGHT JOIN Author A
ON B.AuthorID = A.AuthorID
GROUP BY A.AuthorName
HAVING COUNT(B.BookID) = 0;

--8. Display total number of Books and Average Price of every Author.
SELECT A.AuthorName, COUNT(B.BookID), AVG(B.Price)
FROM Book B
RIGHT JOIN Author A
ON B.AuthorID = A.AuthorID
GROUP BY A.AuthorName

--9. lists each publisher along with the total number of books they have published, sorted from highest to 
--lowest. 
SELECT P.PublisherName, COUNT(B.BookID)
FROM Book B
RIGHT JOIN Publisher P
ON B.PublisherID = P.PublisherID
GROUP BY P.PublisherName
Order BY COUNT(B.BookID) DESC;

--10. Display number of books published each year.
SELECT PublicationYear, COUNT(BookID)
FROM Book
GROUP BY PublicationYear;
 
--Part – B: 
--1. List the publishers whose total book prices exceed 500, ordered by the total price. 
SELECT P.PublisherName, SUM(B.Price)
FROM Book B
RIGHT JOIN Publisher P
ON B.PublisherID = P.PublisherID
GROUP BY P.PublisherName
HAVING SUM(B.Price) > 500
ORDER BY SUM(B.Price);

--2. List most expensive book for each author, sort it with the highest price. 
SELECT A.AuthorName, MAX(B.Price)
FROM Author A
JOIN Book B
ON A.AuthorID = B.AuthorID
GROUP BY A.AuthorName
ORDER BY MAX(B.Price) DESC;

--Part – C: Create table as per following schema with proper validation and try to insert data which violate your 
--validation. 
--1. Emp_info(Eid, Ename, Did, Cid, Salary, Experience) 
--Dept_info(Did, Dname) 
--City_info(Cid, Cname, Did)) 
--District(Did, Dname, Sid) 
--State(Sid, Sname, Cid) 
--Country(Cid, Cname) 
--2. Insert 5 records in each table. 
--3. Display employeename, departmentname, Salary, Experience, City, District, State and country of all 
--employees. 