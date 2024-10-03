use CMS
-- ANS 1
select * from Users

-- ANS 2
select * from Courier where SenderName='Alice Brown'

--Ans 3
select * from Courier

--ANS 4
select * from Courier where CourierID=4

--ANS 5
select * from Courier where TrackingNumber='TRK005'

--ANS 6
select * from Courier where Status='Pending'

--ANS 7
select * from Courier where DeliveryDate='2024-10-01'

--ANS 8
select * from Courier where Status='In Transit'

--ANS 9
Select TrackingNumber,count(*) as TotalPackage from Courier Group By TrackingNumber

--ANS 10
Alter TABLE Courier ADD OrderDate date NOT NULL;

select CourierID,AVG(DATEDIFF(day,OrderDate,DeliveryDate))As AvgDeliveryDate From Courier Group BY CourierID

--ANS 11
select * from Courier where Weight Between 3.0 and 5.5

--ANS 12
select * from Employee where Name LIKe '%John%'


--ANS 13

Select CourierID from Payment Where Amount>50