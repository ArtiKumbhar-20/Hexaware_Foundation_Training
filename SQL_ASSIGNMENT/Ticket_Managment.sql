-- TICKET BOOKING SYSTEM
-- TASK 1 -----------------------------------------------------------------------------------------------------------------------------------
-- 1. Create the database named "TicketBookingSystem" 
CREATE DATABASE IF NOT EXISTS ticket_booking_system;

use ticket_booking_system;

-- 2. Write SQL scripts to create the mentioned tables with appropriate data types, constraints, and relationships.  
-- • Venu  
-- • Event  
-- • Customers  
-- • Booking 

-- Venue Table
CREATE TABLE Venue (
    venue_id INT AUTO_INCREMENT PRIMARY KEY,
    venue_name VARCHAR(255),
    address VARCHAR(255)
);

DESC Venue;

-- Event Table
CREATE TABLE Event (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(255),
    event_date DATE,
    event_time TIME,
    venue_id INT,
    total_seats INT,
    available_seats INT,
    ticket_price DECIMAL(10, 2),
    event_type ENUM('Movie', 'Sports', 'Concert'),
    FOREIGN KEY (venue_id) REFERENCES ticket_booking_system.Venue(venue_id)
    
);

DESC Event;

-- Customer Table
CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255),
    email VARCHAR(255),
    phone_number VARCHAR(15)
);


-- Booking Table
CREATE TABLE Booking (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    event_id INT,
    num_tickets INT,
    total_cost DECIMAL(10, 2),
    booking_date DATE,
    FOREIGN KEY (customer_id) REFERENCES ticket_booking_system.Customer(customer_id),
    FOREIGN KEY (event_id) REFERENCES ticket_booking_system.Event(event_id)
);

DESC Booking;

-- 4. Create appropriate Primary Key and Foreign Key constraints for referential integrity. 

--  ADD booking_is as foreign key in event table
ALTER TABLE ticket_booking_system.Event
ADD COLUMN booking_id INT,
ADD CONSTRAINT fk_event_booking_id 
FOREIGN KEY (booking_id) 
REFERENCES ticket_booking_system.Booking(booking_id);

-- ADD booking_id as foreign key in Customer Table
ALTER TABLE ticket_booking_system.Customer
ADD COLUMN booking_id INT,
ADD FOREIGN KEY (booking_id) REFERENCES ticket_booking_system.Booking(booking_id);


-- TASK 2 -----------------------------------------------------------------------------------------------------------------------------------

-- 1. Write a SQL query to insert at least 10 sample records into each table. 

INSERT INTO Venue (venue_name, address)
VALUES
    ('ABC Theater', '123 Main Street'),
    ('XYZ Stadium', '456 Park Avenue'),
    ('City Hall', '789 Elm Road'),
    ('Sunset Arena', '101 Sunset Boulevard'),
    ('Moonlight Hall', '222 Star Avenue'),
    ('Ocean View Park', '333 Ocean Drive'),
    ('Mountain Theater', '444 Mountain Road'),
    ('Valley Stadium', '555 Valley Lane'),
    ('Riverfront Center', '666 River Street'),
    ('Lakeside Pavilion', '777 Lakeview Drive'),
    ('Golden Palace', '888 Gold Street'),
    ('Emerald Hall', '999 Emerald Avenue'),
    ('Royal Arena', '111 Royal Road'),
    ('Silver Stadium', '222 Silver Lane'),
    ('Amber Park', '333 Amber Drive'),
    ('Sapphire Center', '444 Sapphire Street'),
    ('Skyline Pavilion', '555 Skyline Drive'),
    ('Dream Theater', '666 Dream Road'),
    ('Phoenix Stadium', '777 Phoenix Lane'),
    ('Meadow Park', '888 Meadow Avenue');

INSERT INTO Event (event_name, event_date, event_time, venue_id, total_seats, available_seats, ticket_price, event_type)
VALUES
    ('Movie Night', '2024-04-20', '18:00:00', 1, 100, 100, 15.00, 'Movie'),
    ('Rock Concert', '2024-04-22', '20:00:00', 2, 500, 500, 50.00, 'Concert'),
    ('Football Match', '2024-04-25', '15:00:00', 3, 10000, 9500, 25.00, 'Sports'),
    ('Drama Play', '2024-04-28', '19:30:00', 4, 200, 180, 20.00, 'Sports'),
    ('Live Comedy Show', '2024-04-30', '21:00:00', 5, 300, 290, 30.00, 'Concert'),
    ('Basketball Game', '2024-05-02', '16:30:00', 6, 8000, 7500, 35.00, 'Sports'),
    ('Art Exhibition', '2024-05-05', '12:00:00', 7, 50, 40, 10.00, 'Movie'),
    ('Classical Music Concert', '2024-05-08', '19:00:00', 8, 400, 390, 40.00, 'Movie'),
    ('Gaming Tournament', '2024-05-10', '14:00:00', 9, 2000, 1900, 20.00, 'Sports'),
    ('Fitness Workshop', '2024-05-12', '17:30:00', 10, 30, 25, 5.00, 'Sports'),
    ('Spring Festival', '2024-05-15', '11:00:00', 11, 150, 140, 12.00, 'Movie'),
    ('Painting Exhibition', '2024-05-18', '13:00:00', 12, 80, 70, 8.00, 'Movie'),
    ('Tech Conference', '2024-05-20', '09:30:00', 13, 500, 480, 50.00, 'Movie'),
    ('Food Expo', '2024-05-25', '12:30:00', 14, 200, 180, 15.00, 'Sports'),
    ('Fashion Show', '2024-05-28', '18:30:00', 15, 100, 90, 25.00, 'Sports'),
    ('Science Fair', '2024-06-01', '10:00:00', 16, 300, 280, 10.00, 'Movie'),
    ('Charity Gala', '2024-06-05', '19:00:00', 17, 150, 140, 30.00, 'Movie'),
    ('Book Launch', '2024-06-10', '16:00:00', 18, 50, 40, 5.00, 'Sports'),
    ('Cultural Night', '2024-06-15', '20:30:00', 19, 200, 190, 20.00, 'Movie'),
    ('Music Festival', '2024-06-20', '14:00:00', 20, 1000, 950, 40.00, 'Movie');
    
INSERT INTO Customer (customer_name, email, phone_number)
VALUES
    ('Alice Johnson', 'alice@example.com', '123-456-7890'),
    ('Bob Smith', 'bob@example.com', '987-654-3210'),
    ('John Doe', 'john.doe@example.com', '111-222-3333'),
    ('Jane Doe', 'jane.doe@example.com', '444-555-6666'),
    ('Michael Brown', 'michael.brown@example.com', '777-888-9999'),
    ('Emily Davis', 'emily.davis@example.com', '333-444-5555'),
    ('David Wilson', 'david.wilson@example.com', '666-777-8888'),
    ('Jennifer Anderson', 'jennifer.anderson@example.com', '222-333-4444'),
    ('Matthew Taylor', 'matthew.taylor@example.com', '555-666-7777'),
    ('Olivia Thomas', 'olivia.thomas@example.com', '999-000-1111'),
    ('Daniel Martinez', 'daniel.martinez@example.com', '111-222-3333'),
    ('Sophia Hernandez', 'sophia.hernandez@example.com', '444-555-6666'),
    ('James Miller', 'james.miller@example.com', '777-888-9999'),
    ('Isabella Moore', 'isabella.moore@example.com', '333-444-5555'),
    ('Ethan Jackson', 'ethan.jackson@example.com', '666-777-8888'),
    ('Ava White', 'ava.white@example.com', '222-333-4444'),
    ('Alexander Harris', 'alexander.harris@example.com', '555-666-7777'),
    ('Mia Clark', 'mia.clark@example.com', '999-000-1111'),
    ('William Lewis', 'william.lewis@example.com', '111-222-3333'),
    ('Charlotte Robinson', 'charlotte.robinson@example.com', '444-555-6666');


INSERT INTO Booking (customer_id, event_id, num_tickets, total_cost, booking_date)
VALUES
    (11, 61, 2, 40.00, '2024-04-25'),
    (12, 62, 3, 150.00, '2024-04-26'),
    (13, 63, 1, 20.00, '2024-04-27'),
    (14, 64, 4, 80.00, '2024-04-28'),
    (15, 65, 2, 30.00, '2024-04-29'),
    (16, 66, 1, 15.00, '2024-04-30'),
    (17, 67, 3, 90.00, '2024-05-01'),
    (18, 68, 2, 50.00, '2024-05-02'),
    (19, 69, 1, 25.00, '2024-05-03'),
    (20, 70, 4, 100.00, '2024-05-04'),
    (21, 71, 2, 30.00, '2024-05-05'),
    (22, 72, 1, 15.00, '2024-05-06'),
    (23, 73, 3, 60.00, '2024-05-07'),
    (24, 74, 2, 40.00, '2024-05-08'),
    (25, 75, 1, 20.00, '2024-05-09'),
    (26, 76, 4, 80.00, '2024-05-10'),
    (27, 77, 2, 30.00, '2024-05-11'),
    (28, 78, 1, 15.00, '2024-05-12'),
    (29, 79, 3, 60.00, '2024-05-13'),
    (30, 80, 2, 40.00, '2024-05-14');

-- 2. Write a SQL query to list all Events.    
SELECT * FROM event;

-- 3. Write a SQL query to select events with available tickets.
SELECT * 
FROM event
WHERE available_seats > 0;

-- 4. Write a SQL query to select events name partial match with ‘cup’.
SELECT *
FROM event
WHERE event_name LIKE '%cup%';

-- 5. Write a SQL query to select events with ticket price range is between 1000 to 2500.
SELECT * 
FROM event
WHERE ticket_price BETWEEN 1000 AND 2500;

-- 6. Write a SQL query to retrieve events with dates falling within a specific range.
SELECT *
FROM event
WHERE event_date BETWEEN '2024-04-01' AND '2024-04-30';

-- 7. Write a SQL query to retrieve events with available tickets that also have "Concert" in their name.
SELECT * 
FROM event
WHERE available_seats > 0 AND event_type = 'Concert';

-- 8. Write a SQL query to retrieve users in batches of 5, starting from the 6th user.
SELECT * FROM Customer LIMIT 5 OFFSET 5;

SELECT *
FROM Customer
WHERE customer_id BETWEEN 16 AND 20;

-- 9. Write a SQL query to retrieve bookings details contains booked no of ticket more than 4. 
SELECT * 
FROM booking
WHERE num_tickets > 4;

-- 10. Write a SQL query to retrieve customer information whose phone number end with ‘000’
SELECT * 
FROM customer
WHERE phone_number LIKE '%000';

-- 11. Write a SQL query to retrieve the events in order whose seat capacity more than 15000.
SELECT * 
FROM event
WHERE total_seats > 15000;

-- 12. Write a SQL query to select events name not start with ‘x’, ‘y’, ‘z’
SELECT * 
FROM event
WHERE event_name NOT LIKE 'x%' AND event_name NOT LIKE 'y%' AND event_name NOT LIKE 'z%';


-- TASK 3 -----------------------------------------------------------------------------------------------------------------------------------
-- 1. Write a SQL query to List Events and Their Average Ticket Prices. 
SELECT event_name, AVG(ticket_price) AS avg_ticket_price
FROM event
GROUP BY event_name;

-- 2. Write a SQL query to Calculate the Total Revenue Generated by Events. 
SELECT SUM(total_cost) AS total_revenue
FROM Booking;

-- 3. Write a SQL query to find the event with the highest ticket sales. 
SELECT E.event_id, 	E.event_name, SUM(B.num_tickets) AS total_tickets_sold
FROM Booking B
JOIN Event E ON B.event_id = E.event_id
GROUP BY event_id
ORDER BY total_tickets_sold DESC
LIMIT 1;

-- 4. Write a SQL query to Calculate the Total Number of Tickets Sold for Each Event. 
SELECT E.event_id, E.event_name, SUM(num_tickets) AS total_tickets_sold
FROM Event E
LEFT JOIN  Booking B ON B.event_id = E.event_id
GROUP BY event_id
ORDER BY total_tickets_sold DESC;


-- 5. Write a SQL query to Find Events with No Ticket Sales.
SELECT E.event_id, E.event_name, B.num_tickets
FROM Event E
LEFT JOIN  Booking B ON B.event_id = E.event_id
WHERE B.num_tickets =  0;

-- 6. Write a SQL query to Find the User Who Has Booked the Most Tickets. 
SELECT C.customer_id, C.customer_name, MAX(B.num_tickets) AS MAX_TICKETS
FROM Booking B
RIGHT JOIN Customer C ON B.customer_id = C.customer_id
GROUP BY C.customer_id
ORDER BY MAX_TICKETS DESC;

-- 7. Write a SQL query to List Events and the total number of tickets sold for each month. 
SELECT E.event_id, E.event_name, MONTH(B.booking_date) AS booking_month, 
SUM(B.num_tickets) AS total_tickets_sold
FROM Event E
LEFT JOIN  Booking B ON B.event_id = E.event_id
GROUP BY booking_month, E.event_id;


-- 8. Write a SQL query to calculate the average Ticket Price for Events in Each Venue. 
SELECT V.venue_name, AVG(E.ticket_price) AS avg_ticket_price
FROM Venue V
LEFT JOIN Event E ON E.venue_id = V.venue_id
GROUP BY V.venue_id;


-- 9. Write a SQL query to calculate the total Number of Tickets Sold for Each Event Type. 
SELECT E.event_type, SUM(B.num_tickets) AS total_tickets
FROM Booking B
JOIN Event E ON E.event_id = B.event_id
GROUP BY event_type;


-- 10. Write a SQL query to calculate the total Revenue Generated by Events in Each Year. 
SELECT YEAR(B.booking_date) AS YEAR, SUM(B.total_cost) AS total_revenue
FROM Booking B
JOIN Event E ON E.booking_id = B.booking_id
GROUP BY YEAR(B.booking_date);


-- 11. Write a SQL query to list users who have booked tickets for multiple events. 
SELECT B.customer_id, C.customer_name, COUNT(DISTINCT B.event_id) AS total_events_booked
FROM Booking B
JOIN Customer C ON C.customer_id = B.customer_id
GROUP BY B.customer_id
HAVING total_events_booked > 1;


-- 12. Write a SQL query to calculate the Total Revenue Generated by Events for Each User. 
SELECT C.customer_id, C.customer_name, SUM(B.total_cost) AS Total_Revenue
FROM Booking B
RIGHT JOIN Customer C ON B.customer_id = C.customer_id
GROUP BY C.customer_id, C.customer_name;


-- 13. Write a SQL query to calculate the Average Ticket Price for Events in Each Category and Venue. 
SELECT event_type, venue_id, AVG(ticket_price) AS average_ticket_price
FROM Event 
GROUP BY event_type, venue_id
ORDER BY event_type;


-- 14. Write a SQL query to list Users and the Total Number of Tickets They've Purchased in the Last 30 Days. 
SELECT B.customer_id, COUNT(*) AS total_tickets_purchased
FROM Booking B
WHERE B.booking_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
GROUP BY B.customer_id;


-- Tasks 4: Subquery and its types ------------------------------------------------------------------------------------------------------------

-- 1. Calculate the Average Ticket Price for Events in Each Venue Using a Subquery. 

SELECT V.venue_id, 
	(SELECT AVG(E.ticket_price) 
	FROM Event E
	WHERE E.venue_id = V.venue_id
	) AS average_ticket_price
FROM Venue V;


-- 2. Find Events with More Than 50% of Tickets Sold using subquery. 
SELECT event_id, event_name
FROM Event e
WHERE event_id IN (
    SELECT b.event_id
    FROM Booking b
    JOIN Event e ON b.event_id = e.event_id
    GROUP BY b.event_id
    HAVING SUM(b.num_tickets) > e.total_seats * 0.5
);


-- 3. Calculate the Total Number of Tickets Sold for Each Event. 
SELECT event_id, event_name,
    (SELECT SUM(b.num_tickets) 
     FROM Booking b 
     WHERE b.event_id = e.event_id) AS total_tickets_sold
FROM 
    Event e;


-- 4. Find Users Who Have Not Booked Any Tickets Using a NOT EXISTS Subquery.
SELECT *
FROM Customer c
WHERE NOT EXISTS (
    SELECT *
    FROM Booking b
    WHERE b.customer_id = c.customer_id
);
 
-- 5. List Events with No Ticket Sales Using a NOT IN Subquery. 
SELECT event_id, event_name
FROM Event
WHERE event_id NOT IN (
	SELECT DISTINCT event_id FROM Booking);


-- 6. Calculate the Total Number of Tickets Sold for Each Event Type Using a Subquery in the FROM Clause.
SELECT event_type, SUM(num_tickets) AS 'Total Tickets'
FROM (
	SELECT e.event_type, b.num_tickets 
	FROM EVENT e
	JOIN Booking b 
	ON b.event_id = e.event_id
) As Subquery
Group By event_type;


-- 7. Find Events with Ticket Prices Higher Than the Average Ticket Price Using a Subquery in the WHERE Clause. 
SELECT *
FROM Event e
WHERE e.ticket_price > (
    SELECT AVG(ticket_price)
    FROM Event
);


-- 8. Calculate the Total Revenue Generated by Events for Each User Using a Correlated Subquery. 
SELECT c.customer_id, c.customer_name,
       (
           SELECT SUM(b.num_tickets * e.ticket_price)
           FROM Booking b
           JOIN Event e ON b.event_id = e.event_id
           WHERE b.customer_id = c.customer_id
       ) AS total_revenue
FROM Customer c;


-- 9. List Users Who Have Booked Tickets for Events in a Given Venue Using a Subquery in the WHERE Clause. 
SELECT *
FROM Customer c
WHERE EXISTS (
    SELECT *
    FROM Booking b
    JOIN Event e ON b.event_id = e.event_id
    WHERE b.customer_id = c.customer_id
    AND e.venue_id   = 1
);


-- 10. Calculate the Total Number of Tickets Sold for Each Event Category Using a Subquery with GROUP BY. 
SELECT event_type, SUM(num_tickets) AS total_tickets_sold
FROM (
    SELECT e.event_type, b.num_tickets
    FROM Event e
    JOIN Booking b ON e.event_id = b.event_id
) AS subquery
GROUP BY event_type;


-- 11. Find Users Who Have Booked Tickets for Events in each Month Using a Subquery with DATE_FORMAT. 
SELECT DISTINCT
    c.customer_id,
    c.customer_name,
    MONTHNAME(b.booking_date) AS booking_month
FROM
    Customer c
INNER JOIN
    Booking b ON c.customer_id = b.customer_id
GROUP BY
    c.customer_id,
    c.customer_name,
    MONTHNAME(b.booking_date);

-- 12. Calculate the Average Ticket Price for Events in Each Venue Using a Subquery 
SELECT v.venue_id, v.venue_name,
       (SELECT AVG(ticket_price) 
      FROM Event 
      WHERE venue_id = v.venue_id) AS avg_ticket_price
FROM Venue v;


