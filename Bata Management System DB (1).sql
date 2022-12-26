
/*#################################################################################################################
##################################:::BATA MANAGEMENT SYSTEM DATABASE:::############################################
#################################################################################################################*/


/*#######:::Table Creation & Relashionships:::#########*/


CREATE TABLE Bag(BagID nvarchar(50), Category nvarchar(50)  CHECK (Category IN ('Men','Women','Kids')),
Brand nvarchar(50), Price float NOT NULL CHECK (Price>=0),  primary key(BagID));

CREATE TABLE Customer(CustID nvarchar(50), FName nvarchar(50) NOT NULL ,LName nvarchar(50) NOT NULL, Contact# nvarchar(50) NOT NULL , 
Email nvarchar(50) CHECK (Email LIKE '%@%.%'),  primary key(CustID));

CREATE TABLE Shoe(ShoeID nvarchar(50), Category nvarchar(50)  CHECK (Category IN ('Men','Women','Kids')),
Brand nvarchar(50) , Price float NOT NULL CHECK (Price>=0), Type nvarchar(50) NOT NULL, primary key(ShoeID));

CREATE TABLE ShoeCare(SCareID nvarchar(50), SCareName nvarchar(50) NOT NULL, Price float NOT NULL CHECK (Price>=0),
primary key(SCareID));

CREATE TABLE Sock(SockID nvarchar(50), Category nvarchar(50) NOT NULL CHECK (Category IN ('Men','Women','Kids')),
Brand nvarchar(50) NOT NULL, Price float NOT NULL CHECK (Price>=0), primary key(SockID));

CREATE TABLE Staff(StaffID nvarchar(50), FName nvarchar(50) NOT NULL ,LName nvarchar(50) NOT NULL, Salary float NOT NULL CHECK (Salary>0),
Position nvarchar(50), Manager nvarchar(50)  NOT NULL REFerences Staff(StaffID), primary key(StaffID));


CREATE TABLE ShoeColorDetail(Color nvarchar(50) ,SID nvarchar(50) REFERENCES Shoe(ShoeID) , primary key( Color, SID));
CREATE TABLE ShoeManagingDetail(SID nvarchar(50) REFERENCES Staff(StaffID),ShID nvarchar(50) REFERENCES Shoe(ShoeID) , 
primary key(SID, ShID));
CREATE TABLE ShoePurchasingDetail(CID nvarchar(50) REFERENCES Customer(CustID),SID nvarchar(50) REFERENCES Shoe(ShoeID) , 
Payment float, OrderNumber nvarchar(50),primary key(CID, SID));
CREATE TABLE ShoeSizeDetail(Size numeric ,SID nvarchar(50) REFERENCES Shoe(ShoeID) , primary key( Size, SID));

CREATE TABLE ShoeCareColorDetail(Color nvarchar(50) ,SID nvarchar(50) REFERENCES ShoeCare(SCareID) , primary key( Color, SID));
CREATE TABLE ShoeCareManagingDetail(SID nvarchar(50) REFERENCES Staff(StaffID),SCID nvarchar(50) REFERENCES ShoeCare(SCareID) , 
primary key(SID, SCID));
CREATE TABLE ShoeCarePurchasingDetail(CID nvarchar(50) REFERENCES Customer(CustID),SID nvarchar(50) REFERENCES ShoeCare(SCareID), 
Payment float, OrderNumber nvarchar(50),primary key(CID, SID));
CREATE TABLE ShoeCareSizeDetail(Size numeric ,SID nvarchar(50) REFERENCES ShoeCare(SCareID) , primary key( Size, SID));

CREATE TABLE CustomerAddressDetail( CID nvarchar(50) REFERENCES Customer(CustID), AID nvarchar(50), city nvarchar(50), 
street nvarchar(50), house nvarchar(50), postalCode numeric CHECK (postalCode LIKE '_____'),primary key(CID, AID));

CREATE TABLE BagColorDetail(Color nvarchar(50) ,BID nvarchar(50) REFERENCES Bag(BagID) , primary key( Color, BID));
CREATE TABLE BagManagingDetail(SID nvarchar(50) REFERENCES Staff(StaffID),BID nvarchar(50) REFERENCES Bag(BagID) , primary key(SID, BID));
CREATE TABLE BagPurchasingDetail(CID nvarchar(50) REFERENCES Customer(CustID),BID nvarchar(50) REFERENCES Bag(BagID) , 
Payment float, OrderNumber nvarchar(50),primary key(CID, BID));
CREATE TABLE BagSizeDetail(Size numeric ,BID nvarchar(50) REFERENCES Bag(BagID) , primary key( Size, BID));

CREATE TABLE SockColorDetail(Color nvarchar(50) ,SID nvarchar(50) REFERENCES Sock(SockID) , primary key( Color, SID));
CREATE TABLE SockManagingDetail(SID nvarchar(50) REFERENCES Staff(StaffID),SkID nvarchar(50) REFERENCES Sock(SockID) , 
primary key(SID, SkID));
CREATE TABLE SockPurchasingDetail(CID nvarchar(50) REFERENCES Customer(CustID),SID nvarchar(50) REFERENCES Sock(SockID) , 
Payment float, OrderNumber nvarchar(50),primary key(CID, SID));
CREATE TABLE SockSizeDetail(Size numeric ,SID nvarchar(50) REFERENCES Sock(SockID) , primary key( Size, SID));


/*#######:::Data Insertion:::#########*/


INSERT INTO Bag VALUES('B100', 'Women', 'Prive',3000);
INSERT INTO Bag VALUES('B101', 'Women', 'Marie Claire',2500);
INSERT INTO Bag VALUES('B102', 'Women', 'Prive',2999);
INSERT INTO Bag VALUES('B103', 'Kids', 'Marie Claire',1900);
INSERT INTO Bag VALUES('B104', 'Women', 'Prive',3200);
INSERT INTO Bag VALUES('B105', 'Kids', 'Prive',2700);
INSERT INTO Bag VALUES('B106', 'Women', 'Prive',3000);
INSERT INTO Bag VALUES('B107', 'Women', 'Marie Claire',2500);
INSERT INTO Bag VALUES('B108', 'Women', 'Prive',2999);
INSERT INTO Bag VALUES('B109', 'Kids', 'Marie Claire',1900);
INSERT INTO Bag VALUES('B1010', 'Women', 'Prive',3200);
INSERT INTO Bag VALUES('B111', 'Kids', 'Prive',2700);

INSERT INTO Shoe VALUES( 'S800', 'Men', 'Blite', 1499,'Phawari Chappel');
INSERT INTO Shoe VALUES( 'S801', 'Women', 'LIZA', 2000,'Heels');
INSERT INTO Shoe VALUES('S802' , 'Kids', 'Bubblegummers', 1000,'Shoes');
INSERT INTO Shoe VALUES( 'S803', 'Women', 'Blite', 2500,'Shoes');
INSERT INTO Shoe VALUES( 'S804', 'Women', 'Leena', 1700,'Sandles');
INSERT INTO Shoe VALUES( 'S805', 'Kids', 'LIZA', 1500,'Sandles');
INSERT INTO Shoe VALUES( 'S806', 'Men', 'Blite', 1499,'Phawari Chappel');
INSERT INTO Shoe VALUES( 'S807', 'Women', 'LIZA', 2000,'Heels');
INSERT INTO Shoe VALUES('S808' , 'Kids', 'Bubblegummers', 1000,'Shoes');
INSERT INTO Shoe VALUES( 'S809', 'Women', 'Blite', 2500,'Shoes');
INSERT INTO Shoe VALUES( 'S8010', 'Women', 'Leena', 1700,'Sandles');
INSERT INTO Shoe VALUES( 'S811', 'Kids', 'LIZA', 1500,'Sandles');

INSERT INTO Sock VALUES( 'SC900', 'Men', 'Marie Claire',500);
INSERT INTO Sock VALUES( 'SC901', 'Women', 'Marie Claire',300);
INSERT INTO Sock VALUES( 'SC902', 'Men', 'Power',490);
INSERT INTO Sock VALUES( 'SC903', 'Kids', 'BFirst',200);
INSERT INTO Sock VALUES( 'SC904', 'Kids', 'BFirst',150);
INSERT INTO Sock VALUES( 'SC905', 'Men', 'Marie Claire',500);
INSERT INTO Sock VALUES( 'SC906', 'Women', 'Marie Claire',300);
INSERT INTO Sock VALUES( 'SC907', 'Men', 'Power',490);
INSERT INTO Sock VALUES( 'SC908', 'Kids', 'BFirst',200);
INSERT INTO Sock VALUES( 'SC909', 'Kids', 'BFirst',150);

INSERT INTO Customer VALUES('C1','Sadia','Saeed','+923338697336','sadia@gmail.com');
INSERT INTO Customer VALUES('C2','Umaira','Shaheen','+923185656084','umaira@gmail.com');
INSERT INTO Customer VALUES('C3','Rida','Fatima','+923056396692','rida@gmail.com');
INSERT INTO Customer VALUES('C4','Isha','Tariq','+923338697367','isha@gmail.com');
INSERT INTO Customer VALUES('C5','Samavia','Qamar','+923338697356','samavia@gmail.com');

INSERT INTO Staff VALUES('S1','Ali','Raza','23000','Computer Operator','S1');
INSERT INTO Staff VALUES('S2','raza','ahmed','50000','Dealer','S1');
INSERT INTO Staff VALUES('S3','Ahmed','Kumar','26000','Saler','S1');
INSERT INTO Staff VALUES('S4','hassan','Ali','32000','manager','S1');
INSERT INTO Staff VALUES('S5','haider','Tariq','56000','supervisor','S1');

INSERT INTO ShoeCare VALUES('sv-123','Polish',1200);
INSERT INTO ShoeCare VALUES('sv-456','Shoe Brush',1500);
INSERT INTO ShoeCare VALUES('sv-587','Shoe cream',2000);
INSERT INTO ShoeCare VALUES('sv-921','stain shoe Wax',2500);
INSERT INTO ShoeCare VALUES('sv-638','Shoe Cream Polish',3000);

INSERT INTO CustomerAddressDetail VALUES('C1','A1','Rawalpindi','Street#23 Kamalabad','CB-841',53536);
INSERT INTO CustomerAddressDetail VALUES('C2','A2','islamabad','Street#24 H-12','CB-834',53367);
INSERT INTO CustomerAddressDetail VALUES('C3','A3','karachi','Street#25 karachi','CB-878',16504);
INSERT INTO CustomerAddressDetail VALUES('C4','A4','Faizabad','Street#23 faizabad','CB-679',86976);
INSERT INTO CustomerAddressDetail VALUES('C5','A5','Rawalpindi','Street#23 Shmasabad','CB-542',97874);

INSERT INTO ShoeColorDetail VALUES( 'Red','S800');
INSERT INTO ShoeColorDetail VALUES('Black' ,'S801');
INSERT INTO ShoeColorDetail VALUES('Blue','S802' );
INSERT INTO ShoeColorDetail VALUES( 'White','S803');
INSERT INTO ShoeColorDetail VALUES( 'Green','S804');
INSERT INTO ShoeColorDetail VALUES( 'Black','S805');

INSERT INTO BagColorDetail VALUES( 'Black','B100');
INSERT INTO BagColorDetail VALUES( 'Blue','B101');
INSERT INTO BagColorDetail VALUES( 'Pink','B102');
INSERT INTO BagColorDetail VALUES( 'Green','B103');
INSERT INTO BagColorDetail VALUES( 'Black','B104');

INSERT INTO SockSizeDetail VALUES(10 ,'SC900');
INSERT INTO SockSizeDetail VALUES(6 ,'SC901');
INSERT INTO SockSizeDetail VALUES(7,'SC902');
INSERT INTO SockSizeDetail VALUES( 5,'SC903');
INSERT INTO SockSizeDetail VALUES( 5,'SC904');

INSERT INTO BagSizeDetail VALUES( 10,'B100');
INSERT INTO BagSizeDetail VALUES( 5,'B101');
INSERT INTO BagSizeDetail VALUES( 6,'B102');
INSERT INTO BagSizeDetail VALUES( 10,'B103');
INSERT INTO BagSizeDetail VALUES( 7,'B104');

INSERT INTO ShoeSizeDetail VALUES( 6,'S800' );
INSERT INTO ShoeSizeDetail VALUES( 5,'S801' );
INSERT INTO ShoeSizeDetail VALUES(4,'S802'  );
INSERT INTO ShoeSizeDetail VALUES( 6,'S803' );
INSERT INTO ShoeSizeDetail VALUES(7 ,'S804' );
INSERT INTO ShoeSizeDetail VALUES( 4,'S805' );

INSERT INTO SockColorDetail VALUES( 'Black','SC900');
INSERT INTO SockColorDetail VALUES('Orange' ,'SC901');
INSERT INTO SockColorDetail VALUES( 'White','SC902');
INSERT INTO SockColorDetail VALUES('White' ,'SC903');
INSERT INTO SockColorDetail VALUES( 'Black','SC904');

INSERT INTO SockPurchasingDetail VALUES('C1','SC900',500,'O#12');
INSERT INTO SockPurchasingDetail VALUES('C2','SC901',400,'O#14');
INSERT INTO SockPurchasingDetail VALUES('C3','SC902',200,'O#16');
INSERT INTO SockPurchasingDetail VALUES('C4','SC903',100,'O#13');
INSERT INTO SockPurchasingDetail VALUES('C5','SC904',100,'O#17');

INSERT INTO ShoeCarePurchasingDetail VALUES('C1','sv-123',1200,'O#12');
INSERT INTO ShoeCarePurchasingDetail VALUES('C2','sv-456',1300,'O#15');
INSERT INTO ShoeCarePurchasingDetail VALUES('C3','sv-587',1400,'O#17');
INSERT INTO ShoeCarePurchasingDetail VALUES('C4','sv-921',1500,'O#19');
INSERT INTO ShoeCarePurchasingDetail VALUES('C5','sv-638',1600,'O#13');

INSERT INTO ShoeCareManagingDetail VALUES ('S1','sv-123');
INSERT INTO ShoeCareManagingDetail VALUES ('S2','sv-456');
INSERT INTO ShoeCareManagingDetail VALUES ('S3','sv-587');
INSERT INTO ShoeCareManagingDetail VALUES ('S4','sv-921');
INSERT INTO ShoeCareManagingDetail VALUES ('S5','sv-638');

INSERT INTO ShoeManagingDetail VALUES('S1','S800');
INSERT INTO ShoeManagingDetail VALUES('S2','S801');
INSERT INTO ShoeManagingDetail VALUES('S3','S803');
INSERT INTO ShoeManagingDetail VALUES('S4','S804');
INSERT INTO ShoeManagingDetail VALUES('S5','S805');

INSERT INTO ShoePurchasingDetail VALUES ('C1','S800',1499,'O#190');
INSERT INTO ShoePurchasingDetail VALUES ('C2','S801',1406,'O#191');
INSERT INTO ShoePurchasingDetail VALUES ('C3','S802',1501,'O#192');
INSERT INTO ShoePurchasingDetail VALUES ('C4','S803',1346,'O#193');
INSERT INTO ShoePurchasingDetail VALUES ('C5','S804',1900,'O#194');

INSERT INTO SockManagingDetail VALUES('S1','SC900');
INSERT INTO SockManagingDetail VALUES('S2','SC901');
INSERT INTO SockManagingDetail VALUES('S3','SC902');
INSERT INTO SockManagingDetail VALUES('S4','SC903');
INSERT INTO SockManagingDetail VALUES('S5','SC904');

INSERT INTO BagPurchasingDetail VALUES('C1','B100',3000,'O#17');
INSERT INTO BagPurchasingDetail VALUES('C4','B104',3200,'O#18');
INSERT INTO BagPurchasingDetail VALUES('C4','B103',1900,'O#19');
INSERT INTO BagPurchasingDetail VALUES('C2','B101',2500,'O#20');
INSERT INTO BagPurchasingDetail VALUES('C3','B101',2500,'O#21');
INSERT INTO BagPurchasingDetail VALUES('C1','B102',2999,'O#16');

INSERT INTO BagManagingDetail VALUES ('S1','B100');
INSERT INTO BagManagingDetail VALUES ('S2','B101');
INSERT INTO BagManagingDetail VALUES ('S3','B102');
INSERT INTO BagManagingDetail VALUES ('S4','B103');
INSERT INTO BagManagingDetail VALUES ('S5','B104');

INSERT INTO ShoeCareColorDetail VALUES( 'Red','sv-123');
INSERT INTO ShoeCareColorDetail VALUES( 'green','sv-456');
INSERT INTO ShoeCareColorDetail VALUES( 'blue','sv-587');
INSERT INTO ShoeCareColorDetail VALUES( 'yellow','sv-921');
INSERT INTO ShoeCareColorDetail VALUES( 'pink','sv-638');

INSERT INTO ShoeCareSizeDetail VALUES( 4,'sv-123' );
INSERT INTO ShoeCareSizeDetail VALUES( 9,'sv-456' );
INSERT INTO ShoeCareSizeDetail VALUES( 7,'sv-587' );
INSERT INTO ShoeCareSizeDetail VALUES( 6,'sv-921' );
INSERT INTO ShoeCareSizeDetail VALUES( 4,'sv-638' );


/*#######:::REPORTS:::#########*/
/*#######:::SELECT WITHOUT JOIN:::#########*/
SELECT FName "First Name",LName "Last Name",Position "Staff Position" FROM Staff;
SELECT SCareID "Shoe Care ID",SCareName "Shoe Care Name" FROM ShoeCare;
SELECT * FROM Shoe WHERE  Price>=2000;
SELECT ShoeID"Shoe ID",Brand "Shoe Brand",Category "Shoe Category",Price "Shoe Price" FROM Shoe WHERE Brand='LIZA' ;
SELECT FName "First Name", Position "Staff Position" From Staff ;
SELECT * From ShoeCare;
SELECT DISTINCT Brand "Sock Brand" FROM Sock WHERE Price>300;
SELECT DISTINCT postalCode "Customer Postal Code" FROM CustomerAddressDetail;

/*#######:::SELECT WITH JOIN:::#########*/
SELECT Customer.CustID AS Customer_ID ,Customer.FName AS First_Name, ShoeCarePurchasingDetail.Payment AS ShoeCare_Payment,ShoeCarePurchasingDetail.CID AS Customer_ID FROM Customer,ShoeCarePurchasingDetail WHERE Customer.CustID=ShoeCarePurchasingDetail.CID;
SELECT Customer.FName AS First_Name,ShoePurchasingDetail.Payment AS Shoe_Payment FROM Customer,ShoePurchasingDetail WHERE (Customer.CustID=ShoePurchasingDetail.CID) AND (ShoePurchasingDetail.Payment>1500);
SELECT BagColorDetail.Color AS Bag_Color,Bag.Brand AS Bag_Brand FROM BagColorDetail, Bag WHERE Bag.BagID=BagColorDetail.BID AND BagColorDetail.Color='Black';
SELECT SockManagingDetail.SID AS Staff_ID, Staff.FName AS First_Name FROM Staff, SockManagingDetail WHERE SockManagingDetail.SID=Staff.StaffID;
SELECT Shoe.ShoeID AS Shoe_ID,Shoe.Brand AS Shoe_Brand,ShoeSizeDetail.Size AS Shoe_Size FROM Shoe,ShoeSizeDetail WHERE Shoe.ShoeID=ShoeSizeDetail.SID;
SELECT ShoeCareColorDetail.Color AS ShoeCare_Color,ShoeCare.SCareName AS ShoeCare_Name FROM ShoeCareColorDetail, ShoeCare WHERE ShoeCare.SCareID=ShoeCareColorDetail.SID AND ShoeCareColorDetail.Color ='Red';
SELECT CustomerAddressDetail.postalCode "Customer Postal Code",Customer.FName AS First_Name FROM Customer,CustomerAddressDetail WHERE Customer.CustID=CustomerAddressDetail.CID;
SELECT BagManagingDetail.SID AS Staff_ID , Staff.FName AS First_Name FROM Staff, BagManagingDetail WHERE BagManagingDetail.SID=Staff.StaffID;


/*#######:::QUERIES:::#########*/

/*#######:::MAX:::#########*/
SELECT MAX(Salary) AS MaximumSalary FROM Staff;
SELECT MAX(Payment) AS MaximumPayment FROM BagPurchasingDetail;
SELECT MAX(Price) AS MaximumPrice FROM Shoe WHERE Type='Sandles';
SELECT MAX(Price) AS MaximumPrice FROM Bag WHERE Category='Women';
SELECT MAX(Price) AS MaximumPrice FROM Sock WHERE Brand='Marie Claire';
SELECT MAX(Payment) AS MaximumPayment FROM ShoePurchasingDetail WHERE Payment=1499;
SELECT MAX(Payment) AS MaximumPayment FROM SockPurchasingDetail ;
SELECT MAX(Size) AS MaximumSize FROM BagSizeDetail WHERE BID='B101';
SELECT MAX(Size) AS MaximumPrice FROM SockSizeDetail WHERE SID='SC903';

/*#######:::MIN:::#########*/
SELECT MIN(Salary) AS MinimumSalary FROM Staff;
SELECT MIN(Payment) AS MinimumPayment FROM BagPurchasingDetail;
SELECT MIN(Price) AS MinimumPrice FROM Shoe WHERE  Brand='Blite' AND Type='Shoes';
SELECT MIN(Price) AS MinimumPrice FROM Bag;
SELECT MIN(Price) AS MinimumPrice FROM Sock WHERE  Brand='BFirst' AND Category='Kids';
SELECT MIN(Payment) AS MinimumPayment FROM ShoePurchasingDetail WHERE Payment=1406;
SELECT MIN(Payment) AS MinimumPayment FROM ShoePurchasingDetail ;
SELECT MIN(Size) AS MinimumSize FROM BagSizeDetail;
SELECT MIN(Size) AS MinimumSize FROM SockSizeDetail ;

/*#######:::SUM:::#########*/
SELECT SUM(Salary) AS SalarySum FROM Staff WHERE FName='hassan' OR FName='Ali' ;
SELECT SUM(Payment) AS PaymentSum FROM BagPurchasingDetail WHERE CID='C4' ;
SELECT SUM(Price) AS PriceSum FROM Shoe WHERE  Type='Sandles';
SELECT SUM(Price) AS PriceSum FROM Bag;
SELECT SUM(Price) AS PriceSum FROM Bag;
SELECT SUM(Price) AS PriceSum FROM Sock WHERE Brand='Marie Claire';
SELECT SUM(Payment) AS SumOfPayment FROM ShoePurchasingDetail ;
SELECT SUM(Payment) AS SumOfPayment FROM SockPurchasingDetail ;

/*#######:::COUNT:::#########*/
SELECT COUNT(*) AS SupervisorCount FROM Staff WHERE Position='supervisor' ;
SELECT COUNT(DISTINCT StaffID) AS IDCount FROM Staff;
SELECT COUNT(BID) AS BagCount FROM  BagPurchasingDetail;
SELECT COUNT(*) AS LizaCount FROM Shoe WHERE Brand='LIZA';
SELECT COUNT(DISTINCT ShoeID) AS IDCount FROM Shoe;
SELECT COUNT(*) AS WomenCount FROM Bag WHERE Category='Women';
SELECT COUNT(*) AS KidsCount FROM Bag WHERE Category='Kids';
SELECT COUNT(*) AS KidsCount FROM Sock WHERE Category='Kids';
SELECT COUNT(DISTINCT ShoeID) AS IDCount FROM Shoe;
SELECT COUNT(*) AS ColorCount FROM SockColorDetail WHERE Color='Orange'
SELECT COUNT(*) AS SizeCount FROM SockSizeDetail Where Size=5;
SELECT COUNT(DISTINCT Size) AS SizeCount FROM SockSizeDetail;
SELECT COUNT(*) AS SockCount FROM SockPurchasingDetail Where Payment='100';
SELECT COUNT(DISTINCT BID) AS IDCount FROM BagSizeDetail;

/*#######:::UPDATE:::#########*/
UPDATE Staff SET LName='Qamar' WHERE StaffID ='S3';
UPDATE BagPurchasingDetail SET OrderNumber ='O#1900' WHERE OrderNumber ='O#16';
UPDATE Shoe SET Price=3100 WHERE ShoeID ='S805';
UPDATE Bag SET Price=3100 WHERE BagID ='B100';
UPDATE Sock SET Price='200' WHERE SockID ='SC900';
UPDATE ShoePurchasingDetail SET Payment='1500' WHERE Payment='1900';
UPDATE SockColorDetail SET Color='Red' WHERE Color='Black';
UPDATE SockSizeDetail SET Size='8' WHERE Size='7';
UPDATE SockPurchasingDetail SET Payment='300' WHERE Payment='200';

/*#######:::DELETE:::#########*/
DELETE FROM Bag WHERE BagID='B105';
DELETE FROM BagSizeDetail  where BID='B100';
DELETE FROM CustomerAddressDetail WHERE CID='C5';
DELETE FROM SockColorDetail WHERE Color='Red';
DELETE FROM ShoeCareSizeDetail WHERE Size=4;

/*#######:::VIEWS:::#########*/
/*EXECUTE ONE BY ONE*/
CREATE VIEW ShoeReport AS SELECT ShoeID FROM Shoe;
CREATE VIEW CustomerReport  AS SELECT CustID  FROM  Customer WHERE CustID='C1'OR CustID='C2';
CREATE VIEW ShoeCareReport  AS SELECT SCareID FROM  ShoeCare;
CREATE VIEW SocksReport  AS SELECT SockID  FROM  Sock;
CREATE VIEW SockSizeDetailReport  AS SELECT Size  FROM  SockSizeDetail WHERE Size>5;

/*#######:::COMMANDS:::#########*/
ALTER TABLE Bag ADD Dscription text;
ALTER TABLE Bag ALTER COLUMN Dscription nvarchar(50);
ALTER TABLE Bag DROP COLUMN Dscription;
ALTER TABLE Customer ADD CNIC varchar(15);
ALTER TABLE Customer ALTER COLUMN CNIC char(20);
ALTER TABLE Customer DROP COLUMN CNIC;


TRUNCATE TABLE BagSizeDetail;
DROP TABLE BagSizeDetail;

/*###################################*/
