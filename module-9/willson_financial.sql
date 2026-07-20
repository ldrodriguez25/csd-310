
CREATE TABLE Employee(
 EmployeeID INT PRIMARY KEY,
 FirstName VARCHAR(50),
 LastName VARCHAR(50),
 Role VARCHAR(50),
 Phone VARCHAR(20),
 Email VARCHAR(100)
);
CREATE TABLE Client(
 ClientID INT PRIMARY KEY,
 FirstName VARCHAR(50),
 LastName VARCHAR(50),
 Phone VARCHAR(20),
 Email VARCHAR(100),
 Address VARCHAR(100),
 DateAdded DATE,
 EmployeeID INT,
 FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
CREATE TABLE Asset(
 AssetID INT PRIMARY KEY,
 AssetType VARCHAR(50),
 Value DECIMAL(12,2),
 ClientID INT,
 FOREIGN KEY (ClientID) REFERENCES Client(ClientID)
);
CREATE TABLE TransactionRecord(
 TransactionID INT PRIMARY KEY,
 TransactionDate DATE,
 Amount DECIMAL(12,2),
 TransactionType VARCHAR(50),
 ClientID INT,
 AssetID INT,
 FOREIGN KEY (ClientID) REFERENCES Client(ClientID),
 FOREIGN KEY (AssetID) REFERENCES Asset(AssetID)
);
CREATE TABLE Appointment(
 AppointmentID INT PRIMARY KEY,
 AppointmentDate DATE,
 AppointmentTime TIME,
 Purpose VARCHAR(100),
 ClientID INT,
 EmployeeID INT,
 FOREIGN KEY (ClientID) REFERENCES Client(ClientID),
 FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
CREATE TABLE Billing(
 BillingID INT PRIMARY KEY,
 BillingDate DATE,
 Amount DECIMAL(12,2),
 ClientID INT,
 FOREIGN KEY (ClientID) REFERENCES Client(ClientID)
);

INSERT INTO Employee VALUES
(1,'John','Smith','Advisor','555-1001','john@wf.com'),
(2,'Mary','Jones','Advisor','555-1002','mary@wf.com'),
(3,'David','Lee','Advisor','555-1003','david@wf.com'),
(4,'Sarah','Brown','Manager','555-1004','sarah@wf.com'),
(5,'James','Miller','Advisor','555-1005','james@wf.com'),
(6,'Linda','Wilson','Advisor','555-1006','linda@wf.com');

INSERT INTO Client VALUES
(1,'Alan','Cooper','555-2001','alan@mail.com','El Paso','2026-01-01',1),
(2,'Beth','White','555-2002','beth@mail.com','El Paso','2026-01-05',2),
(3,'Carl','Young','555-2003','carl@mail.com','El Paso','2026-01-10',3),
(4,'Dana','Hall','555-2004','dana@mail.com','El Paso','2026-01-12',1),
(5,'Evan','King','555-2005','evan@mail.com','El Paso','2026-01-15',2),
(6,'Faith','Scott','555-2006','faith@mail.com','El Paso','2026-01-20',3);

INSERT INTO Asset VALUES
(1,'Stocks',10000,1),(2,'Bond',5000,2),(3,'IRA',15000,3),
(4,'ETF',8000,4),(5,'CD',4000,5),(6,'Mutual Fund',12000,6);

INSERT INTO TransactionRecord VALUES
(1,'2026-02-01',500,'Deposit',1,1),(2,'2026-02-02',300,'Withdrawal',2,2),
(3,'2026-02-03',700,'Deposit',3,3),(4,'2026-02-04',600,'Deposit',4,4),
(5,'2026-02-05',200,'Withdrawal',5,5),(6,'2026-02-06',900,'Deposit',6,6);

INSERT INTO Appointment VALUES
(1,'2026-03-01','09:00:00','Review',1,1),(2,'2026-03-02','10:00:00','Planning',2,2),
(3,'2026-03-03','11:00:00','Investment',3,3),(4,'2026-03-04','13:00:00','Review',4,1),
(5,'2026-03-05','14:00:00','Planning',5,2),(6,'2026-03-06','15:00:00','Review',6,3);

INSERT INTO Billing VALUES
(1,'2026-04-01',150,1),(2,'2026-04-01',150,2),(3,'2026-04-01',150,3),
(4,'2026-04-01',150,4),(5,'2026-04-01',150,5),(6,'2026-04-01',150,6);
