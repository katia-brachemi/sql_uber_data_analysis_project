/* 
===========================================================
 Script: Data Standardization
===========================================================
   Purpose: 
     - Check the Booking table schema
     - Rename columns for clarity and consistency
     - Apply snake_case naming convention (lowercase with underscores)

SQL Functions Used:
- INFORMATION_SCHEMA.COLUMNS
- sp_rename 
- SELECT * 
===========================================================
*/

-- Explore All Columns in the Table
SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Booking'
  AND TABLE_SCHEMA = 'dbo';


 -- Rename columns in Booking table

EXEC sp_rename 'Booking.Date', 'booking_date', 'COLUMN';
EXEC sp_rename 'Booking.Time', 'booking_time', 'COLUMN';
EXEC sp_rename 'Booking.Booking_ID', 'booking_id', 'COLUMN';
EXEC sp_rename 'Booking.Booking_Status', 'booking_status', 'COLUMN';
EXEC sp_rename 'Booking.Customer_ID', 'customer_id', 'COLUMN';
EXEC sp_rename 'Booking.Vehicle_Type', 'vehicle_type', 'COLUMN';
EXEC sp_rename 'Booking.Pickup_Location', 'pickup_location', 'COLUMN';
EXEC sp_rename 'Booking.Drop_Location', 'drop_location', 'COLUMN';
EXEC sp_rename 'Booking.Avg_VTAT', 'avg_vtat', 'COLUMN';
EXEC sp_rename 'Booking.Avg_CTAT', 'avg_ctat', 'COLUMN';
EXEC sp_rename 'Booking.Cancelled_Rides_by_Customer', 'cancelled_by_customer', 'COLUMN';
EXEC sp_rename 'Booking.Reason_for_cancelling_by_Customer', 'customer_cancel_reason', 'COLUMN';
EXEC sp_rename 'Booking.Cancelled_Rides_by_Driver', 'cancelled_by_driver', 'COLUMN';
EXEC sp_rename 'Booking.Driver_Cancellation_Reason', 'driver_cancel_reason', 'COLUMN';
EXEC sp_rename 'Booking.Incomplete_Rides', 'incomplete_rides', 'COLUMN';
EXEC sp_rename 'Booking.Incomplete_Rides_Reason', 'incomplete_reason', 'COLUMN';
EXEC sp_rename 'Booking.Booking_Value', 'booking_value', 'COLUMN';
EXEC sp_rename 'Booking.Ride_Distance', 'ride_distance', 'COLUMN';
EXEC sp_rename 'Booking.Driver_Ratings', 'driver_rating', 'COLUMN';
EXEC sp_rename 'Booking.Customer_Rating', 'customer_rating', 'COLUMN';
EXEC sp_rename 'Booking.Payment_Method', 'payment_method', 'COLUMN';

-- Check the Table
SELECT*
FROM Booking;

