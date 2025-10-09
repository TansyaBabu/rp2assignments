-- Topic: Movie Streaming Platform Analytics

-- The project aims to  movie streaming platform data to optimize content strategy, enhance user engagement, maximize revenue, and provide personalized recommendations.


-- Create the tables with appropriate data types, constraints (PK, FK), indexes.


CREATE DATABASE Movie;
use Movie;
CREATE TABLE Users(user_id INT primary key,
name varchar(20) NOT NULL,
join_date DATE NOT NULL DEFAULT (CURRENT_DATE),
country VARCHAR(50) NOT NULL,
subscription_type VARCHAR(20) NOT NULL CHECK (subscription_type IN ('Basic', 'Standard', 'Premium')),
status VARCHAR(20) NOT NULL CHECK (status IN ('Active', 'Inactive', 'Banned')));
CREATE TABLE Genres (
genre_id INT PRIMARY KEY ,
genre_name VARCHAR(50)  NOT NULL
);
CREATE TABLE Movies (
movie_id INT PRIMARY KEY,
title VARCHAR(100) NOT NULL,
release_year YEAR NOT NULL,
genre_id INT NOT NULL ,FOREIGN KEY (genre_id) REFERENCES Genres(genre_id),
length_minutes INT NOT NULL CHECK (length_minutes>0),
language VARCHAR(50) NOT NULL);
CREATE TABLE Viewing (
view_id INT PRIMARY KEY,
user_id INT NOT NULL,FOREIGN KEY (user_id) REFERENCES Users(user_id),
movie_id INT NOT NULL,FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
view_date DATE NOT NULL DEFAULT (CURRENT_DATE),
watch_duration_minutes INT NOT NULL);
CREATE TABLE SubscriptionPayments (
payment_id INT PRIMARY KEY,
user_id INT NOT NULL,FOREIGN KEY (user_id) REFERENCES Users(user_id),
payment_date DATE NOT NULL DEFAULT (CURRENT_DATE),
amount DECIMAL(8,2) NOT NULL CHECK (amount>0),
payment_method VARCHAR(30) NOT NULL);
CREATE TABLE InactiveUsers (
    inactive_id INT PRIMARY KEY,
    user_id INT NOT NULL, FOREIGN KEY (user_id) REFERENCES Users(user_id),
    last_active_date DATE NOT NULL,
    last_seen_movie VARCHAR(100) NOT NULL
);

-- Load sample data (you can generate or use public datasets).
INSERT INTO Genres(genre_id,genre_name) VALUES
(1,'Action'),
(2,'Comedy'),
(3,'Drama'),
(4,'Horror'),
(5,'Romance'),
(6,'Science Fiction');
INSERT INTO Users(user_id,name,join_date,country,subscription_type,status)VALUES
(1,'Kevin Sanu','2024-01-10','USA','Premium','Active'),
(2,'Renfer Biju','2024-02-15','India','Standard','Active'),
(3,'Maria Gomez','2024-03-20','Spain','Basic','Inactive'),
(4,'Kento Yamazaki','2024-04-05','Japan', 'Premium','Active'),
(5,'Kylian Mbappe','2024-05-12','France','Standard','Banned'),
(6,'David Billa','2024-06-18','UK','Basic','Active'),
(7,'Jerrin George','2023-07-12','Canada', 'Premium','Inactive'),
(8,'Dale Steyn','2023-08-03','South Africa','Standard', 'Active'),
(9,'Lamine Yamal','2023-09-09','Spain', 'Basic','Active'),
(10,'Sakura Tanaka','2023-10-02','Japan', 'Premium','Active'),
(11,'Karim Benzema','2023-10-15','France', 'Standard','Inactive'),
(12,'Mohammed Hassan','2023-11-01','Egypt', 'Premium','Active');
INSERT INTO Movies(movie_id,title,release_year,genre_id,length_minutes,language)VALUES
(1,'Avengers: Endgame',2019,1,181,'English'),      
(2,'The Hangover',2009,2,100,'English'),          
(3,'The Shawshank Redemption',1994,3,142,'English'), 
(4,'The Conjuring',2013,4, 112,'English'),        
(5,'Titanic',1997,5,195,'English'),                
(6,'Interstellar',2014,6,169,'English');
INSERT INTO Viewing (view_id, user_id, movie_id, view_date, watch_duration_minutes) VALUES
(1,1, 1, '2024-07-01', 180),
(2, 2, 2, '2024-07-02', 95),
(3, 3, 3, '2024-07-03', 120),
(4, 4, 4, '2024-07-04', 100),
(5, 5, 5, '2024-07-05', 150),
(6, 6, 6, '2024-07-06', 160),
(7, 1, 1, '2024-07-07', 180),
(8, 1, 2, '2024-07-08', 120),
(9, 2, 1, '2024-07-09', 150),
(10, 2, 2, '2024-07-10', 95),
(11, 3, 3, '2024-07-11', 120),
(12, 4, 4, '2024-07-12', 100),
(13, 5, 5, '2024-07-13', 150),
(14, 6, 1, '2024-07-14', 160),
(15,5,2,'2025-07-16',180),
(16,6,1,'2025-12-25',155),
(18,4,2,'2025-07-6',120),
(19,3,1,'2025-10-25',155),
(20, 1, 1, '2024-07-10', 170),
(21, 1, 1, '2024-07-12', 175),
(22, 1, 1, '2024-07-14', 180),
(23, 6, 6, '2024-07-10', 160),
(24, 6, 6, '2024-07-11', 165),
(25, 6, 6, '2024-07-13', 170),
(26, 6, 6, '2024-07-14', 168),
(27, 4, 4, '2024-07-08', 95),
(28, 4, 4, '2024-07-10', 100),
(29, 4, 4, '2024-07-11', 102),
(30, 4, 4, '2024-07-13', 98),
(31, 2, 2, '2024-07-09', 92),
(32, 2, 2, '2024-07-11', 90),
(33, 2, 2, '2024-07-12', 94),
(34, 2, 2, '2024-07-13', 96),
(35, 2, 2, '2024-07-14', 95),
(36, 5, 5, '2024-07-09', 150),
(37, 5, 5, '2024-07-10', 152),
(38, 5, 5, '2024-07-11', 155),
(39, 5, 5, '2024-07-12', 158),
(40, 5, 5, '2024-07-13', 160),
(41, 5, 5, '2024-07-14',162);
INSERT INTO SubscriptionPayments(payment_id,user_id,payment_date,amount,payment_method)VALUES
(1,1,'2024-07-10',15.99,'Credit Card'),
(2,2,'2024-07-12',9.99,'UPI'),
(3,3,'2024-07-13',5.99,'PayPal'),
(4,4,'2024-07-14',15.99,'Debit Card'),
(5,5,'2024-07-15',9.99,'NetBanking'),
(6,6,'2024-07-16',5.99,'Credit Card'),
(7, 7, '2023-07-12', 15.99, 'Credit Card'),  
(8, 8, '2023-08-03', 9.99, 'UPI'),          
(9, 9, '2023-09-09', 5.99, 'PayPal'),       
(10, 10, '2023-10-02', 15.99, 'Credit Card'), 
(11, 11, '2023-10-15', 9.99, 'Debit Card'),  
(12, 12, '2023-11-01', 15.99, 'NetBanking'); 
INSERT INTO InactiveUsers(inactive_id, user_id, last_active_date, last_seen_movie) VALUES
(3, 6, '2024-07-20', 'Interstellar'),              
(4, 2, '2024-07-18', 'The Hangover'),           
(5, 1, '2024-07-22', 'Avengers: Endgame'),        
(6, 4, '2024-07-25', 'The Conjuring'),             
(7, 3, '2024-07-30', 'Titanic');    
select * from Genres;
select * from Users;
select * from Movies;
select * from Viewing;
select * from SubscriptionPayments;
SELECT * FROM  InactiveUsers;   

-- Queries
/* Most popular movies by country*/

SELECT 
    u.country,
    m.title AS most_popular_movie,
    COUNT(v.view_id) AS total_views
FROM Viewing v
JOIN Users u ON v.user_id = u.user_id
JOIN Movies m ON v.movie_id = m.movie_id
GROUP BY u.country, m.title
HAVING COUNT(v.view_id) = (
    SELECT 
        COUNT(v2.view_id)
    FROM Viewing v2
    JOIN Users u2 ON v2.user_id = u2.user_id
    WHERE u2.country = u.country
    GROUP BY v2.movie_id
    ORDER BY COUNT(v2.view_id) DESC
    LIMIT 1
)
ORDER BY u.country;      


/* Churn analysis: users who stop viewing or cancel subscription.*/

SELECT 
    (SELECT COUNT(*) FROM Users WHERE status IN ('Inactive', 'Banned')) AS inactive_banned_count,
    (SELECT COUNT(DISTINCT user_id) FROM InactiveUsers) AS inactive_users_count,
     (SELECT COUNT(*) FROM Users) AS total_users,
    ((
        (SELECT COUNT(*) FROM Users WHERE status IN ('Inactive', 'Banned')) + 
        (SELECT COUNT(DISTINCT user_id) FROM InactiveUsers)
    ) * 100.0 / (SELECT COUNT(*) FROM Users)) AS churn_rate_percentage;
 
 
 /* Average revenue per user (ARPU) by subscription type.*/
 
 SELECT
    u.subscription_type,
    SUM(sp.amount) AS total_revenue,
    COUNT(DISTINCT u.user_id) AS paying_users,
    SUM(sp.amount) / COUNT(DISTINCT u.user_id) AS average_revenue_per_user
FROM
    Users u
JOIN
    SubscriptionPayments sp ON u.user_id = sp.user_id
GROUP BY
    u.subscription_type;
    
    /* Total watch time per user per genre*/
    SELECT
    u.user_id,
    u.name AS user_name,
    g.genre_name,
    SUM(v.watch_duration_minutes) AS total_watch_time_minutes
FROM
    Viewing v
JOIN Users u ON v.user_id = u.user_id
JOIN Movies m ON v.movie_id = m.movie_id
JOIN Genres g ON m.genre_id = g.genre_id
GROUP BY
    u.user_id, u.name, g.genre_name
ORDER BY
    u.user_id, g.genre_name;
    
    /* Joins: between Users ↔ Viewing, Viewing ↔ Movies, Movies ↔ Genres, Users ↔ SubscriptionPayments*/
    
    SELECT
    u.user_id,
    u.name AS user_name,
    u.country,
    u.subscription_type,
    u.status,
    g.genre_name,
    m.title AS movie_title,
    sp.payment_date,
    sp.amount AS payment_amount,
    v.view_date,
    v.watch_duration_minutes
FROM
    Users u
JOIN Viewing v 
    ON u.user_id = v.user_id
JOIN Movies m 
    ON v.movie_id = m.movie_id
JOIN Genres g 
    ON m.genre_id = g.genre_id
JOIN SubscriptionPayments sp 
    ON u.user_id = sp.user_id
ORDER BY
    u.user_id, v.view_date;
    
    /* Aggregations, GROUP BY, ORDER BY, filtering*/
 -- Aggregations - Total watch time across all users
 SELECT SUM(watch_duration_minutes) AS total_watch_time
FROM Viewing;

-- GROUP BY- Total watch time per user
SELECT 
    u.user_id,
    u.name AS user_name,
    SUM(v.watch_duration_minutes) AS total_watch_time
FROM Viewing v
JOIN Users u ON v.user_id = u.user_id
GROUP BY u.user_id, u.name;

-- ORDER BY- Top users by total watch time

SELECT 
    u.user_id,
    u.name AS user_name,
    SUM(v.watch_duration_minutes) AS total_watch_time
FROM Viewing v
JOIN Users u ON v.user_id = u.user_id
GROUP BY u.user_id, u.name
ORDER BY total_watch_time DESC;

-- Filtering - Only active users with their total watch time

SELECT 
    u.user_id,
    u.name AS user_name,
    SUM(v.watch_duration_minutes) AS total_watch_time
FROM Viewing v
JOIN Users u ON v.user_id = u.user_id
WHERE u.status = 'Active'         -- filtering rows before aggregation
GROUP BY u.user_id, u.name
HAVING SUM(v.watch_duration_minutes) > 100  
ORDER BY total_watch_time DESC;



    /* Window functions: e.g. ranking top movies */
    SELECT
    m.title AS movie_title,
    g.genre_name,
    SUM(v.watch_duration_minutes) AS total_watch_time,
    RANK() OVER (ORDER BY SUM(v.watch_duration_minutes) DESC) AS rank_by_watch_time
FROM
    Viewing v
JOIN Movies m ON v.movie_id = m.movie_id
JOIN Genres g ON m.genre_id = g.genre_id
GROUP BY
    m.title, g.genre_name
ORDER BY
    rank_by_watch_time;

-- rolling views over time 
SELECT
    u.user_id,
    u.name AS user_name,
    v.view_date,
    m.title AS movie_title,
    SUM(v.watch_duration_minutes) 
        OVER (PARTITION BY u.user_id ORDER BY v.view_date) AS cumulative_watch_time
FROM Viewing v
JOIN Users u ON v.user_id = u.user_id
JOIN Movies m ON v.movie_id = m.movie_id
ORDER BY u.user_id, v.view_date;



    /* A stored procedure to compute monthly subscription revenue per country*/
    
--  Select the  database
USE Movie;

DELIMITER $$

-- Create the procedure
CREATE PROCEDURE GetMonthlyRevenuePerCountry (
    IN target_year INT,
    IN target_month INT
)
BEGIN
    SELECT
        u.country,
        YEAR(sp.payment_date) AS payment_year,
        MONTH(sp.payment_date) AS payment_month,
        SUM(sp.amount) AS total_revenue
    FROM
        SubscriptionPayments sp
        JOIN Users u ON sp.user_id = u.user_id
    WHERE
        YEAR(sp.payment_date) = target_year
        AND MONTH(sp.payment_date) = target_month
    GROUP BY
        u.country, YEAR(sp.payment_date), MONTH(sp.payment_date)
    ORDER BY
        total_revenue DESC;
END $$

--  Reset delimiter
DELIMITER ;

--  Verify the procedure exists
SHOW PROCEDURE STATUS WHERE Db = 'Movie';

--  for output
CALL GetMonthlyRevenuePerCountry(2024, 7);


    /* A function to recommend top 3 genres for a given user (based on their past viewing)*/

USE Movie;

DROP FUNCTION IF EXISTS GetTop3GenresForUser;
DELIMITER $$

CREATE FUNCTION GetTop3GenresForUser(target_user_id INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE top_genres VARCHAR(255);

    -- Aggregate views by genre first, then pick top 3 and concatenate names
    SELECT 
        GROUP_CONCAT(genre_name ORDER BY total_views DESC SEPARATOR ', ')
    INTO 
        top_genres
    FROM (
        SELECT 
            g.genre_name,
            COUNT(v.view_id) AS total_views
        FROM 
            Viewing v
            JOIN Movies m ON v.movie_id = m.movie_id
            JOIN Genres g ON m.genre_id = g.genre_id
        WHERE 
            v.user_id = target_user_id
        GROUP BY 
            g.genre_name
        ORDER BY 
            total_views DESC
        LIMIT 3
    ) AS ranked_genres;

    RETURN top_genres;
END $$

DELIMITER ;


SELECT GetTop3GenresForUser(1) AS recommended_genres;
SELECT GetTop3GenresForUser(2);
SELECT GetTop3GenresForUser(4);
SELECT GetTop3GenresForUser(5);






    
    