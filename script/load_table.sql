/*
============================================================
Purpose: Create Booking Table
============================================================
This script:
- Drops the existing Booking table if it exists
- Creates the Booking table for ride data
- Loads data from Booking.csv using BULK INSERT

Requirements:
- SQL Server
- Booking.csv located in ./csv_file/
============================================================
*/


IF OBJECT_ID ('Booking','U') IS NOT NULL
   DROP TABLE Booking;

CREATE TABLE Booking(

    booking_id INT PRIMARY KEY,              -- unique identifier
    booking_date DATE,                       
    booking_time TIME,                       
    customer_id INT,                         -- customer reference
    vehicle_type VARCHAR(50),                -- e.g. Car, Bike
    pickup_location VARCHAR(100),
    drop_location VARCHAR(100),
    avg_vtat DECIMAL(5,2),                   -- average vehicle turnaround time
    avg_ctat DECIMAL(5,2),                   -- average customer turnaround time
    cancelled_by_customer INT,                -- count of cancelled rides
    customer_cancel_reason VARCHAR(200),
    cancelled_by_driver INT,
    driver_cancel_reason VARCHAR(200),
    incomplete_rides INT,
    incomplete_reason VARCHAR(200),
    booking_value DECIMAL(10,2),             -- fare amount
    ride_distance DECIMAL(6,2),              -- km or miles
    driver_rating DECIMAL(3,2),              -- 1–5 scale
    customer_rating DECIMAL(3,2),            -- 1–5 scale
    payment_method VARCHAR(20)               -- Cash, Card, Wallet
);

-- Load Data from a csv file
BULK INSERT Booking 
FROM 'csv_file/Booking.csv'
WITH ( 
FIELDTERMINATOR = ',', 
ROWTERMINATOR = '\n',
FIRSTROW = 2 -- skips header row 
);
