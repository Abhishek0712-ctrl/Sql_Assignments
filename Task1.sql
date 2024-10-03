Create database CMS

use CMS;

create table Users(
UserID INT PRIMARY KEY,  
Name VARCHAR(255),  
Email VARCHAR(255) UNIQUE,  
Password VARCHAR(255),  
ContactNumber VARCHAR(20),  
Address TEXT
)

sp_help Users

create table Courier(
CourierID INT PRIMARY KEY,  
SenderName VARCHAR(255),  
SenderAddress TEXT,  
ReceiverName VARCHAR(255),  
ReceiverAddress TEXT,  
Weight DECIMAL(5, 2),  
Status VARCHAR(50),  
TrackingNumber VARCHAR(20) UNIQUE,  
DeliveryDate DATE
)

sp_help Courier

create table CourierServices(
ServiceID INT PRIMARY KEY,  
ServiceName VARCHAR(100),  
Cost DECIMAL(8, 2)
)

sp_help CourierService

create table Employee(
EmployeeID INT PRIMARY KEY,  
Name VARCHAR(255),  
Email VARCHAR(255) UNIQUE,  
ContactNumber VARCHAR(20),  
Role VARCHAR(50),  
Salary DECIMAL(10, 2)
)

sp_help Employee

create table Location(
LocationID INT PRIMARY KEY,  
LocationName VARCHAR(100),  
Address TEXT
)

sp_help Location

create table Payment(
PaymentID INT PRIMARY KEY,  
CourierID INT,  
LocationID INT,  
Amount DECIMAL(10, 2),  
PaymentDate DATE,  
FOREIGN KEY (CourierID) REFERENCES Courier(CourierID),  
FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
)

sp_help Payment

Select * from information_schema.Tables

INSERT INTO Users (UserID, Name, Email, Password, ContactNumber, Address)
VALUES
(1, 'John Doe', 'john.doe@example.com', 'Password123', '1234567890', '123 Main St, New York, NY'),
(2, 'Jane Smith', 'jane.smith@example.com', 'SecurePass!456', '0987654321', '456 Oak St, Los Angeles, CA'),
(3, 'Alice Brown', 'alice.brown@example.com', 'Alice@789', '1112223333', '789 Pine St, Chicago, IL'),
(4, 'Bob Johnson', 'bob.johnson@example.com', 'BobPassword@321', '4445556666', '101 Maple St, Dallas, TX'),
(5, 'Charlie Davis', 'charlie.davis@example.com', 'CharlieD#567', '7778889999', '234 Elm St, Seattle, WA');


INSERT INTO Courier (CourierID, SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weight, Status, TrackingNumber, DeliveryDate)
VALUES
(1, 'John Doe', '123 Main St, New York, NY', 'Jane Smith', '456 Oak St, Los Angeles, CA', 2.5, 'In Transit', 'TRK001', '2024-09-30'),
(2, 'Alice Brown', '789 Pine St, Chicago, IL', 'Bob Johnson', '101 Maple St, Dallas, TX', 5.0, 'Pending', 'TRK002', '2024-10-01'),
(3, 'Charlie Davis', '234 Elm St, Seattle, WA', 'Diana White', '567 Cedar St, Miami, FL', 1.2, 'Delivered', 'TRK003', '2024-09-25'),
(4, 'Eve Green', '321 Birch St, Boston, MA', 'Frank Black', '654 Willow St, Houston, TX', 3.7, 'In Transit', 'TRK004', '2024-10-02'),
(5, 'George Hill', '987 Spruce St, Denver, CO', 'Helen Gray', '111 Poplar St, Atlanta, GA', 4.8, 'Pending', 'TRK005', '2024-10-03');


INSERT INTO Employee (EmployeeID, Name, Email, ContactNumber, Role, Salary)
VALUES
(1, 'Michael Scott', 'michael.scott@dundermifflin.com', '1234567890', 'Manager', 75000.00),
(2, 'Dwight Schrute', 'dwight.schrute@dundermifflin.com', '0987654321', 'Sales Representative', 55000.00),
(3, 'Pam Beesly', 'pam.beesly@dundermifflin.com', '1112223333', 'Receptionist', 35000.00),
(4, 'Jim Halpert', 'jim.halpert@dundermifflin.com', '4445556666', 'Sales Representative', 60000.00),
(5, 'Stanley Hudson', 'stanley.hudson@dundermifflin.com', '7778889999', 'Sales Representative', 58000.00);


INSERT INTO CourierServices (ServiceID, ServiceName, Cost)
VALUES
(1, 'Standard Shipping', 10.00),
(2, 'Express Shipping', 25.00),
(3, 'Same Day Delivery', 50.00),
(4, 'International Shipping', 100.00),
(5, 'Freight Shipping', 200.00);

INSERT INTO Payment (PaymentID, CourierID, LocationID, Amount, PaymentDate)
VALUES
(1, 1, 1, 10.00, '2024-09-25'),
(2, 2, 2, 25.00, '2024-09-26'),
(3, 3, 3, 50.00, '2024-09-27'),
(4, 4, 4, 100.00, '2024-09-28'),
(5, 5, 5, 200.00, '2024-09-29');


