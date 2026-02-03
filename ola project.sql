#1 retrive all the sucessful bookings
create view sucessful_bookings as
select * from bookings where booking_status = 'success';

select * from sucessful_bookings ;


#2find the average ride distance  for eacy vechile type:
create view ride_distance_for_each_vehicle as 
select vehicle_type, avg(ride_distance)
as avg_distance from bookings
group by vehicle_type;

select * from ride_distance_for_each_vehicle;


#3 get the total number  of canceled rides by customer:
create view  cancled_rides_by_customer as 
select count(*) from bookings
where Booking_status = 'Canceled by Customer';

select * from cancled_rides_by_customer;

#4 list the top 5 customers who booked the highest number of rides:
CREATE view TOP_5_CUSTOMERS AS
SELECT customer_ID, count(BOOKING_ID) AS TOTAL_RIDES
FROM BOOKINGS
group by CUSTOMER_ID
ORDER BY TOTAL_RIDES DESC LIMIT 5;

select * FROM TOP_5_CUSTOMERS; 


#5 GET THE NUMBER OF RIDES CANCLED BY DRIVERS DUE TO PERSONAL AND CAR ISSSUES 
create view rides_CANCLED_BY_DRIVERS_P_C_ISSUES AS
SELECT COUNT(*)
FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

select * FROM rides_CANCLED_BY_DRIVERS_P_C_ISSUES;


#6 FIND THE MAXIMUM AND MINIMUM DRIVER RATINNGS FOR PRIME SEDAN BOOKINGS;
create view max_mmin_rating as
select MAX(DRIVER_RATINGS) AS MAX_RATING,
min(DRIVER_RATINGS) AS MIN_RATING
FROM BOOKINGS WHERE vehicle_type = 'prime sedan';

select * from max_mmin_rating;


#7 retrivev all rides where payment was made by upi:
create view upi_payment as
select * from bookings
where payment_method  = 'upi';

select * from upi_payment


#8 select the average customer  rating per vechile type;
create view avg_custo_rating as
select Vehicle_Type, avg(Customer_Rating) as customer_ratings
from bookings
group by vehicle_type;

select * from avg_custo_rating


#9 calculate the total booking vale of rides completed successfully:
create view  total_ssuccss_value as
select sum(booking_value)  as total_ssuccss_value 
from bookings 
where booking_status = 'success'; 

select * from total_ssuccss_value;


#10 list all incomplete rides along with the reason:
select booking_id, Incomplete_Rides_Reason 
from bookings 
where Incomplete_Rides = 'yes'








