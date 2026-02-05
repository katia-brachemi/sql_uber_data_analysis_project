/*
============================================================-
Purpose: Data Analysis
============================================================

  Script:
  - Contains exploratory SQL queries designed to extract key operational and customer insights 
   from the Booking table. Each query answers a specific business question that can later be 
   visualized in Tableau as KPIs.

 Queries included:
 - Longest customer waiting time
 - Most common cancellation reasons (with percentages)
 - Highest booking value 
 - Most used payment method
 - Most frequent pickup/drop route
 - Overall performance metrics: Total bookings, Completed rides, Customer cancellations and Driver cancellations

SQL Functions/Objects Used:
- SELECT 
- TOP (n)
- ORDER BY
- GROUP BY
- COUNT()
- SUM() OVER()
- CAST()
- Aliases
============================================================
*/


-- Longest customer waiting time
SELECT TOP 1 booking_id, customer_id, avg_ctat AS waiting_time
FROM Booking
ORDER BY avg_ctat DESC;


-- Most common customer cancellation reasons (with percentage)
SELECT customer_cancel_reason AS Reason,
       COUNT(*) AS ReasonCount,
       CAST(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER() AS DECIMAL(5,2)) AS Percentage
FROM Booking
WHERE cancelled_by_customer > 0
GROUP BY customer_cancel_reason
ORDER BY ReasonCount DESC;


-- Highest booking value
SELECT TOP 1 booking_id, booking_value
FROM Booking
ORDER BY booking_value DESC;


-- Payment method usage frequency
SELECT payment_method, COUNT(*) AS usage_count
FROM Booking
GROUP BY payment_method
ORDER BY usage_count DESC;


-- Top 5 most frequent routes
SELECT TOP 5 pickup_location, drop_location, COUNT(*) AS RideCount
FROM Booking
GROUP BY pickup_location, drop_location
ORDER BY RideCount DESC;


-- Overall booking performance metrics
SELECT 
    COUNT(*) AS total_bookings,
    SUM(CASE WHEN CAST(incomplete_rides AS INT) = 0 
              AND CAST(cancelled_by_customer AS INT) = 0 
              AND CAST(cancelled_by_driver AS INT) = 0 
             THEN 1 ELSE 0 END) AS completed_rides,
    SUM(CAST(cancelled_by_customer AS INT)) AS customer_cancellations,
    SUM(CAST(cancelled_by_driver AS INT)) AS driver_cancellations,
    
    -- Percentages
    CAST(SUM(CASE WHEN CAST(incomplete_rides AS INT) = 0 
                  AND CAST(cancelled_by_customer AS INT) = 0 
                  AND CAST(cancelled_by_driver AS INT) = 0 
             THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS success_rate,
    CAST(SUM(CAST(cancelled_by_customer AS INT)) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS customer_cancel_rate,
    CAST(SUM(CAST(cancelled_by_driver AS INT)) * 100.0 / COUNT(*) AS DECIMAL(5,2)) AS driver_cancel_rate
FROM Booking;


