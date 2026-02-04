/* 
===============================================================================
Script : Data Cleaning
===============================================================================

   Purpose:
     - Normalize booking_time values (seconds only, no fractions)
     - Handle NULL values by replacing with defaults (0 or 'Unknown')
     - Remove duplicate bookings (keep first occurrence)
     - Standardize misleading values ('null' → 'Unknown' / 'Not cancelled')
     - Round numeric values for consistency (distance, ratings)
 
SQL Functions/Objects Used:
     - ALTER TABLE, UPDATE, DELETE, SELECT
     - sp_rename 
     - ROW_NUMBER() 
     - ROUND() 
===============================================================================
*/


-- Time Normalization
-- Step 1: Add the new column

ALTER TABLE dbo.Booking ADD booking_time_clean TIME(0); -- seconds only, no fractional part

-- Step 2: Update the new column with cleaned values
UPDATE dbo.Booking
SET booking_time_clean = booking_time;

-- Step 3: Keep the cleaned values
ALTER TABLE dbo.Booking DROP COLUMN booking_time;
EXEC sp_rename 'dbo.Booking.booking_time_clean', 'booking_time', 'COLUMN';

-- Check the Table
SELECT*
FROM Booking;

-- Check For NULL values
SELECT *
FROM Booking
WHERE 
	avg_vtat IS NULL
	OR avg_ctat IS NULL
	OR booking_value	IS NULL
	OR ride_distance	IS NULL
	OR driver_rating	IS NULL
	OR customer_rating	IS NULL
	OR payment_method	IS NULL;



UPDATE Booking
SET avg_vtat = 0
WHERE avg_vtat IS NULL;

UPDATE Booking
SET avg_ctat = 0
WHERE avg_ctat IS NULL;

UPDATE Booking
SET booking_value = 0
WHERE booking_value IS NULL;

UPDATE Booking
SET ride_distance = 0
WHERE ride_distance IS NULL;


-- 0 = cancelled/incomplete ride (no value/distance).
-- 'unknown' = missing payment method.

	
   

	-- Check for duplicates
SELECT booking_id, COUNT(*)
FROM Booking
GROUP BY booking_id
HAVING COUNT(*) > 1;

-- Remove duplicates (keeping the first occurrence):
WITH CTE AS (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY booking_id ORDER BY booking_date) AS rn
  FROM Booking
)
DELETE FROM CTE WHERE rn > 1;




-- Check the Table
SELECT*
FROM Booking;

-- Identifying misleading values 
SELECT DISTINCT payment_method  
FROM Booking;

SELECT DISTINCT cancelled_by_customer
FROM Booking;



-- Handling misleading values
UPDATE Booking
SET payment_method = 'Unknown'
WHERE payment_method = 'null';


UPDATE Booking
SET cancelled_by_customer = 'Not cancelled'
WHERE cancelled_by_customer IS NULL
   OR cancelled_by_customer = 'null';


UPDATE Booking
SET customer_cancel_reason = 'Not cancelled'
WHERE customer_cancel_reason IS NULL
   OR customer_cancel_reason = 'null';

UPDATE Booking
SET cancelled_by_driver = 'Not cancelled'
WHERE cancelled_by_driver IS NULL
   OR cancelled_by_driver = 'null';

   UPDATE Booking
SET driver_cancel_reason = 'Not cancelled'
WHERE driver_cancel_reason = 'null';


   UPDATE Booking
SET incomplete_rides = 0
WHERE incomplete_rides = 'null';

   UPDATE Booking
SET incomplete_reason = 'None'
WHERE incomplete_reason = 'null';


UPDATE Booking
SET ride_distance   = ROUND(ride_distance, 2),
    driver_rating   = ROUND(driver_rating, 1),
    customer_rating = ROUND(customer_rating, 1);


