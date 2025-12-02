--1.  Retrieve the distinct mission names where the mission lasted more than 30 days. 
SELECT DISTINCT mission_name 
FROM Mission
WHERE duration_days > 30;

--2.  Retrieve the top 3 astronauts who participated in the most missions, ensuring no duplicates. 
SELECT TOP 3 astronaut_name 
FROM Astronauts
Order by total_space_missions Decs;

--3.  Insert a new space mission called "Jupiter Exploration" that is scheduled to launch on '2024-11
--01', lasting 365 days, and classified as an exploration mission. 
INSERT INTO Mission (mission_name, launch_date, duration_days, mission_type)
VALUES ('Jupiter Exploration', '2024-11-01', 365, 'Exploration');

--4.  Update the total space missions count for astronaut with ID = 5, increasing it by 1. 
UPDATE Astronauts 
SET total_space_missions = total_space_missions+1
WHERE astronaut_id = 5;

--5.  Delete participation record for astronaut ID 3 in mission ID 2. 
DELETE 
FROM Participation
WHERE astronaut_id = 3 AND mission_id = 2;

--6.  Add a new column experience_level (VARCHAR(50)) to the Astronauts table to store the 
--astronaut's experience level. 
ALTER TABLE Astronauts
ADD experience_level VARCHAR(50);

--7.  Clear all the data from the Participation table.(Truncate) 
Truncate Table Participation;

--8.  Retrieve all mission names where the mission type contains 'exploration'
SELECT mission_name FROM Mission 
WHERE mission_type Like '%exploration%'; 

--9.  Retrieve all missions that contain the word "Mars" and lasted more than 100 days.
SELECT * FROM Mission
WHERE mission_name Like '%Mars%'  AND duration_days > 100;

--10.  Retrieve the square root of the total number of missions for astronaut ID 102 
SELECT SQRT(total_space_missions)
FROM Astronauts
WHERE astronaut_id = 102;

--11.  Retrieve the first 3 characters of each astronaut's name.
SELECT Substring(astronaut_name, 1, 3) FROM Astronauts;

--12.  Retrieve the astronauts who participated in missions launched in the current year. 
SELECT DISTINCT a.astronaut_name 
FROM Astronauts a
JOIN Participation p
on p.astronaut_id = a.astronaut_id
JOIN Missions m
on p.mission_id = m.mission_id
WHERE year(launch_date) = year(getdate());

--13.  Count the number of astronauts from each nationality who have participated in more than 2 
--space missions.
SELECT count(astronaut_id), nationality
FROM Astronauts
WHERE total_space_missons > 2;
GROUP BY nationality;

--14.  Retrieve the total number of missions and the average mission duration for each mission type, 
--but only include mission types that have been involved in more than 3 missions. 
SELECT count(*) As mission_count, Avg(duration_days) As mission_duration
From missions
Group by mission_type
having count(*) > 3;

--15.  Find the number of missions commanded by astronauts for each nationality where more than 5 
--missions were commanded 
SELECT a.nationality, count(*) as mission_count
FROM Astronaut a
JOIN Participation p
on p.atronaut_id = a.atronaut_id
WHERE p.roll = 'commanded'
Group by a.nationality
Having count(*) > 5;

--16.  Retrieve the name of the spacecraft used in the mission "Apollo 11" (Use sub Query) 
select spacecraft_name
from spacecrafts 
where spacecraft_id = (
	select p.spacecraft_id 
	from participation p
	join mission m
	on p.spacecraft_id = m.spacecraft_id
	where mission_name = 'Appollo 11'
);

--17.  Create a view that shows all active missions (those that launched after 2020). 
create view active_mission 
As
select mission_id, mission_name 
from mission 
where year(launch_date) > 2020;

--18.  List all astronauts and their respective spacecraft for each mission they participated in. 
select a.astronauts_name, s.spacecraft_name, misssion_name
from Astronauts a
join participation p
on a.atronaut_id = p.stronaut_id
join mission m
on ...

--19.  Retrieve the names of astronauts who participated in missions using spacecrafts manufactured by 
--"SpaceX", along with the names of those missions and the duration of each mission. Include only 
--astronauts who have participated in more than 2 missions. 
select a.astro_name, s.manufactuers, m.misssion_name, m.duration
from 
--20.  Retrieve the names of astronauts, the names of missions they participated in, the names of 
--spacecraft used in those missions, and the manufacturers of those spacecraft, for missions where 
--the mission duration is greater than the average duration of all missions conducted by astronauts 
--from the "USA".




--1.  Retrieve Unique Roles of Players. 
--2.  Calculate the winning percentage of each team. 
--3.  Insert a new record to Stadium Table. (2, Wankhede Stadium, Mumbai,33000) 
--4.  Update Team Coach Name of Team RCB to Ashish Nehra. 
--5.  Delete All the Records of Player Shikhar Dhawan. 
--6.  Change the size of stadium_name column from VARCHAR (100) to VARCHAR (15). 
--7.  Remove Player Table. 
--8.  Display Top 30 Players Whose First Name Starts with Vowel. 
--9.  Display City Whose Stadium Name does not Ends with ‘M’. 
--10.  Generate Random Number between 0 to 100. 
--11.  Display 4th to 9th Character of ‘Virat Kohli’. 
--12.  Display The Day of week on 01-01-2005. 
--13.  Display City Wise Maximum Stadium Capacity. 
--14.  Display City Whose Average Stadium Capacity is Above 20000. 
--15.  Display All Players Full Name, Jersey No and Role Who is Playing for Mumbai Indians. (Using Sub 
--query). 
--16.  Display Team Name Having Home Stadium Capacity Over 50000. (Using Sub query ). 
--17.  Create a View Players_Above_100_Matches of Players Who have Played More than 100 Matches. 
--18.  Get the Player name, Team name, and their Jersey number who have played Between than 50 to 
--100 matches. 
--19.  Produce Output Like: <PlayerFirstName> Plays For <TeamName> and Has Played <PlayerMatches> 
--matches. (In single column) 
--20.  Display Stadium Capacity of Team CSK.



--1.  Retrive first five distinct movies along with their title from MovieDetails table. 
--2.  Display the total of the BudgetUSD and BoxOfficeUSD assign the name TotalUSD from 
--MovieFinancials. 
--3.  Insert the new row with this data (11,The Incredible Hulk, Action, Louis Leterrier,2008) in 
--MovieDetails table. 
--4.  Set the value of the genre to 'Action' of 'Avengers:Endgame' movie from MovieDetails table. 
--5.  Delete the records with duration of 181 minutes from MovieRatingsDuration table. 
--6.  Add a new column 'Producer' into the MovieDetails table. 
--7.  Delete records of MovieFinancials table without removing its table structure. 
--8.  Retrive all the movies from MovieDetails table with title starting with 'The'. 
--9.  Retrive name of directors includes 'son' from MovieDetails table. 
--10.  Convert and display title of all movies in uppercase.
--11.  Display the highest rating from the MovieRatingsDuration table. 
--12.  Calculate the years between current year and movies release year. 
--13.  Find the languages in which movies have an average rating of greater than 8.0. Display the language 
--and the average rating. 
--14.  Retrieve the minimum, maximum, and average movie duration for each language in the 
--MovieRatingsDuration table, but display only those languages where the average rating is greater 
--than 7.5. 
--15.  Find the titles of movies whose budget is higher than the average budget of all movies.(Do not use 
--JOINS) 
--16.  Find the titles of movies that have a box office revenue greater than the average box office revenue 
--of all movies. 
--17.  Create a view with Rating, Language and Country columns with no data and named it MovieReview. 
--18.  List all movies that have the same director but different genres, displaying the director’s name, both 
--movie titles, and their respective genres. 
--19.  Retrieve the title, director, and box office earnings for all movies that were released after 2010, along 
--with their ratings. 
--20.  List all directors and the number of movies they have directed, but only include directors who have 
--directed more than 1 movie. 


--1.  
--2.  
--Display the top 3 percentages books order by title in descending.  
--Display a distinct list of genres. 
--3.  
--Insert a new book into the books table. ('The Adventures of Sherlock Holmes', 2, 'Mystery', 1892, 
--5) 
--4.  
--5.  
--Update the number of available copies is 10 for a book whose book_id is available. 
--Delete a member from the members table whose member_id is 4. 
--6.  
--7.  
--Add a new column language varchar(20) to the books table. 
--Truncate all data from the loans table. (Using Truncate) 
--8.  
--9.  
--Find books whose title starts with ‘H’ and end with ‘L’. 
--Find authors whose name does not ends with vowel. 
--10.  Find Lenth of ‘Manish Pandey’
--11.  Calculate your age in year. 
--12.  Display the total number of books by genre. 
--13.  Display the minimum, maximum, and average number of available copies for each genre whose 
--book_id is available.  
--14.  Display the title of books where the author was born before 1970.(Using Sub query) 
--15.  Create a view View_Member whose membership date is not available from members table 
--16.  Find the title of books that have been borrowed the most (the top 1 book) and the corresponding 
--author name (Using sub Query) 
--17.  Display the loan_id ,member name ,title ,loan date whose member name is 'Raj'. 
--18.  List the titles of books that have been borrowed by members who registered before 2020.(using 
--Sub query) 
--19.  Display the total number of books borrowed by each member. 
--20.  Display the title of books that have not been borrowed by any members.


--1.  
--2.  
--Display unique city of customers who have 'gold' membership.  
--Display top 2 rating with restaurant names. 
--3.  
--4.  
--Insert new restaurant in restaurant table. (5, 'Burger Junction', 'American', 4.1) 
--Update customer id to 4 in orders table where amount is 60. 
--5.  
--6.  
--Remove the costumer who belongs to Chicago city.  
--Change column name Total Amount to Amount in Orders table. 
--7.  
--8.  
--Display 3rd to 7th character of restaurant name from restaurants table. 
--Delete Menu Items table. 
--Display name and city of those customers whose membership contains 4 letters. 
--9.  
--10.  Write a query to subtract 1 year from current date. 
--11.  Find max amount of all orders. 
--12.  Display city with the total number of customers. 
--13.  display restaurant names with average rating greater than 4.5. 
--14.  Find the highest-rated restaurant and its details. 
--15.  Subquery to get restaurants that are visited by customers from 'New York'. 
--16.  Create a View to list customers and their cities. 
--17.  Get all customers and their orders (including customers without order) 
--18.  Generate a combination of every customer with every restaurant. 
--19.  List all restaurants and the corresponding orders. 
--20.  Get the total amount spent by each customer at each restaurant, along with the customer and 
--restaurant names. Include customers who have not ordered from certain restaurants, showing 
--NULL for those cases.