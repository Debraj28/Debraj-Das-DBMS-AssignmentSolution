create schema travelonthego;

use travelonthego;

-- Table creation

create table Passenger(Passenger_name varchar(250), Category varchar(50), Gender varchar(1), Boarding_City varchar(50), Destination_City varchar(50), Distance bigint, Bus_Type varchar(50));
create table Price(Bus_Type varchar(50), Distance bigint, Price bigint);

-- Values insertion

insert into Passenger (Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type) values('Sejal', 'AC', 'F', 'Bengaluru', 'Chennai', 350, 'Sleeper');
insert into Passenger (Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type) values('Anmol', 'Non-AC', 'M', 'Mumbai', 'Hyderabad', 700, 'Sitting');
insert into Passenger (Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type) values('Pallavi', 'AC', 'F', 'Panaji', 'Bangaluru', 600, 'Sleeper');
insert into Passenger (Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type) values('Khusboo', 'AC', 'F', 'Chennai', 'Mumbai', 1500, 'Sleeper');
insert into Passenger (Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type) values('Udit', 'Non-AC', 'M', 'Trivandrum', 'Panaji', 1000, 'Sleeper');
insert into Passenger (Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type) values('Ankur', 'AC', 'M', 'Nagpur', 'Hyderabad', 500, 'Sitting');
insert into Passenger (Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type) values('Hemant', 'Non-AC', 'M', 'Panaji', 'Mumbai', 700, 'Sleeper');
insert into Passenger (Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type) values('Manish', 'Non-AC', 'M', 'Hyderabad', 'Bengaluru', 500, 'Sitting');
insert into Passenger (Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type) values('Piyush', 'AC', 'M', 'Pune', 'Nagpur', 700, 'Sitting');


insert into Price (Bus_Type, Distance, Price) values('Sleeper', 350, 770);
insert into Price (Bus_Type, Distance, Price) values('Sleeper', 500, 1100);
insert into Price (Bus_Type, Distance, Price) values('Sleeper', 600, 1320);
insert into Price (Bus_Type, Distance, Price) values('Sleeper', 700, 1540);
insert into Price (Bus_Type, Distance, Price) values('Sleeper', 1000, 2200);
insert into Price (Bus_Type, Distance, Price) values('Sleeper', 1200, 2640);
insert into Price (Bus_Type, Distance, Price) values('Sleeper', 350, 434);
insert into Price (Bus_Type, Distance, Price) values('Sitting', 500, 620);
insert into Price (Bus_Type, Distance, Price) values('Sitting', 600, 744);
insert into Price (Bus_Type, Distance, Price) values('Sitting', 700, 868);
insert into Price (Bus_Type, Distance, Price) values('Sitting', 1000, 1240);
insert into Price (Bus_Type, Distance, Price) values('Sitting', 1200, 1488);
insert into Price (Bus_Type, Distance, Price) values('Sitting', 1500, 1860);

-- 3) How many females and how many male passengers travelled for a minimum distance of 600 KMs?

select * from Passenger where Gender = 'M' or Gender = 'F';
select count(Passenger_name) as PassengerCount from Passenger where (Gender = 'M' or Gender = 'F') and Distance >= 600;

-- 4) Find the minimum ticket price for Sleeper Bus

select MAX(Price) as LargestPrice from Price where Bus_Type = 'Sleeper';

-- 5) Select passenger names whose names start with character 'S'

select * FROM Passenger where Passenger_name like 'S%';

-- 6) Calculate price charged for each passenger displaying Passenger name, Boarding City, Destination City, Bus_Type, Price in the output

select p.Passenger_name, p.Boarding_City, p.Destination_City, p.Bus_Type, prc.Price 
from Passenger p left join Price prc on p.Distance = prc.Distance and p.Bus_Type = prc.Bus_Type order by p.Passenger_name; 

-- 7) What is the passenger name and his/her ticket price who travelled in Sitting bus for a distance of 1000 KMs

select p.Passenger_name, p.Price as Charge from 
(select p.Passenger_name, p.Bus_Type, prc.Price, p.Distance from passenger p left join Price prc on p.Distance = prc.Distance and p.Bus_Type = prc.Bus_Type) as p where p.Bus_Type = 'Sitting' and p.distance = 1000;

-- 8) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?

select p.Passenger_name, prc.Bus_Type, prc.Price as Buscharge from Passenger p inner join Price prc on p.Distance = prc.Distance where p.Passenger_name = 'Pallavi' ;

-- 9) List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order.

select distinct Distance from Passenger order by Distance desc;

-- 10) Display the passenger name and percentage of distance travelled by that passenger from the total distance travelled by all passengers without using user variables

select Passenger_name, (Distance/(select sum(Distance) from Passenger))*100 as Total_Dist_Travelled from Passenger;

-- 11) Display the distance, price in three categories in table Price 
-- a) Expensive if the cost is more than 1000
-- b) Average Cost if the cost is less than 1000 and greater than 500
-- c) Cheap otherwise

select Distance, Price, case 
when Price >1000 then "Expensive"
when Price between 500 and 1000 then "Average Cost"
else "Cheap"
end as Price_Cat
from Price;


