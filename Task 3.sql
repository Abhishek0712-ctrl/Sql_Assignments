--ANS 14

alter table Courier add empid int foreign key references employee(employeeid)
select empid,count(CourierID) from courier 
group by empid

--ANS 15
Select LocationID,sum(amount) AS TotalRevenue from Payment Group by LocationID

--ANS 16

select LocationID,count(CourierID) AS CourierDelivered from Payment group by LocationID


--ANS 17

SELECT TOP 1 CourierID, AVG(DATEDIFF(day, OrderDate, DeliveryDate)) AS AvgDeliveryTime
FROM Courier
GROUP BY CourierID
ORDER BY AvgDeliveryTime Desc;

--ANS 18
--select LocationID, sum(amount) AS Total from Payment Group BY LocationID Order By Total

--ANS 20
select CourierID,sum(amount) as Total from Payment Group BY CourierID Having sum(amount)>100.00

--ANS 21
select CourierID from Payment Group BY CourierID,PaymentDate Having PaymentDate>'2024-09-27' and sum(amount)>100.00

--Ans 22

select LocationID from Payment Group BY LocationID,PaymentDate having PaymentDate>'2024-09-27' and sum(amount)>50.00
