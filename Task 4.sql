use CMS	

--ANS 23

select c.CourierID,SenderName,ReceiverName,Weight,TrackingNumber,DeliveryDate,OrderDate,p.Amount,PaymentDate
from Payment p join Courier c 
on p.CourierID=c.CourierID

--ANS 24

select l.LocationID,LocationName,Address,p.Amount 
from Payment p join Location l 
on p.LocationID=l.LocationID
order by l.LocationID

--ANS 25

select c.CourierID,SenderName,ReceiverName,Weight,TrackingNumber,DeliveryDate,OrderDate,p.Amount,l.LocationID,LocationName,Address
from Payment p join Courier c 
on p.CourierID=c.CourierID
join Location l
on p.LocationID=l.LocationID

--ANS 26

select c.CourierID,SenderName,ReceiverName,Weight,TrackingNumber,DeliveryDate,OrderDate,p.Amount,PaymentDate
from Payment p join Courier c 
on p.CourierID=c.CourierID

--ANS 27

SELECT c.CourierID,sum(amount)
FROM Courier c join Payment p 
on c.CourierID=p.CourierID group by c.CourierID

--ANS 28

SELECT p.PaymentID, Amount, PaymentDate, c.CourierID, TrackingNumber, SenderName, ReceiverName
FROM Payment p
JOIN Courier c ON p.CourierID = c.CourierID
WHERE p.PaymentDate = '2024-09-26';

--ANS 29

select PaymentID,c.CourierID,SenderName,ReceiverName,Weight,Status,TrackingNumber,DeliveryDate,OrderDate,Amount
from Courier c join Payment p on c.CourierID=p.CourierID order by p.CourierID

--ANS 30

select PaymentID,l.locationID,LocationName,Address,Amount 
from payment p join Location l 
on p.LocationID=l.LocationID

--Ans 31

SELECT c.CourierID,sum(amount)
FROM Courier c join Payment p 
on c.CourierID=p.CourierID group by c.CourierID

--ANS 32

select PaymentID,c.CourierID,c.weight,c.TrackingNumber 
from payment p join Courier c 
on p.courierid=c.courierid and p.PaymentDate between '2024-09-25' and '2024-09-28'


--ANS 33

select u.UserID, u.CourierId,u.Name,u.ContactNumber,u.Email,c.TrackingNumber,c.DeliveryDate 
from Users u full outer join Courier c 
on u.CourierId=c.CourierID

--ANS 34

select ServiceID,ServiceName,Cost,c.CourierID,c.TrackingNumber,p.Amount 
from Courier c full outer join CourierServices cs 
on cs.ServiceID=c.CourierID 
full outer join Payment p 
on p.CourierID=c.CourierID

--ANS 35

select e.EmployeeID,p.LocationID,e.Name,e.Role,e.Email,p.PaymentID,p.Amount
from Employee e full outer join payment p
on e.LocationID=p.LocationID

--ANS 36

select u.UserID,u.Name,u.Email,cs.ServiceID,cs.ServiceName,cs.Cost 
from Users u cross join CourierServices cs

--ANS 37

select e.EmployeeID,e.Name,e.Role,e.ContactNumber,l.LocationID,l.LocationName 
from Employee e cross join Location l


--ANS 38

select CourierID,courier.SenderName,courier.SenderAddress,courier.OrderDate from Courier

--ANS 39

select CourierID,ReceiverName,ReceiverAddress,courier.DeliveryDate from Courier

--ANS 40

select p.CourierID,cs.ServiceID,cs.ServiceName,cs.Cost 
from CourierServices cs join Payment p
on cs.Cost=p.Amount


--ANS 41

select e.EmployeeID,e.Name,e.ContactNumber,e.Email,count(c.CourierID) NoOfCouriers
from Employee e left join Courier c 
on c.empid=e.EmployeeID 
group by e.EmployeeID,e.Name,e.ContactNumber,e.Email
order by e.EmployeeID

--ANS 42

select l.LocationID,e.EmployeeID,l.LocationName,e.Name,e.Role,e.ContactNumber 
from Location l right join Employee e 
on l.LocationID=e.LocationID


--ANS 43

select u.UserID,u.Name,u.Email,c.CourierID,c.ReceiverName,c.TrackingNumber,c.OrderDate,c.DeliveryDate
from Courier c join Users u 
on u.Name=c.SenderName and u.Name='Eve Green'

--ANS 44

select * from Employee where Role='Sales Representative'

--ANS 45

select p.PaymentID,c.CourierID,l.LocationID,c.OrderDate,c.SenderAddress,l.LocationName,p.Amount 
from Payment p join Courier c on p.CourierID=c.CourierID 
join Location l on p.LocationID=l.LocationID and l.LocationID=3 

--ANS 46

SELECT * from Courier where SenderAddress Like '789 Pine St, Chicago, IL'

--ANS 47

select e.EmployeeID,e.Name,count(Status) TOtalCouriers from Employee e Join Courier c on e.EmployeeID=c.empid and c.Status='Delivered' group by e.EmployeeID,e.Name

--ANS 48

alter table payment add ServiceID int Foreign key references CourierServices(ServiceID)

select * from CourierServices

select p.PaymentID,p.CourierID,p.LocationID,cs.ServiceID,p.PaymentDate,p.Amount 
from payment p join CourierServices cs 
on cs.ServiceID=p.ServiceID and p.Amount>cs.Cost

--ANS 49

select * from Courier where Weight > all(select avg(weight) from Courier)

--ANS 50

select * from Employee where Salary > (select avg(salary) from Employee)


--ANS 51

SELECT SUM(Cost) AS TotalCost
FROM CourierServices
WHERE Cost < (SELECT MAX(Cost) FROM CourierServices)


--ANS 52

SELECT *
FROM Courier
WHERE CourierID IN (SELECT DISTINCT CourierID
FROM Payment)

--ANS 53

SELECT l.LocationID, l.LocationName, l.Address,p.Amount
FROM Location l
JOIN Payment p ON l.LocationID = p.LocationID
WHERE p.Amount = (SELECT MAX(Amount) FROM Payment)


--ANS 54

SELECT *
FROM Courier
WHERE Weight > ALL ( SELECT Weight FROM Courier WHERE SenderName = 'George Hill')