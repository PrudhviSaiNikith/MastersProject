/* 
Name of the project - Northwind Technology Database
Course number - ISMG 6080
Title - Database Maganement System
Semester - First
Year - First
Group Name - Server and Inventory
Group Number - 11
Name - Tom Jose Kattuparambil
Oracle Account User Id - ORA34PRJ
Database - Windows Server Database
*/



Drop table Vendor cascade constraints;
Drop table Department cascade constraints;
Drop table OperatingSystem cascade constraints;
Drop table Customer cascade constraints;
Drop table Applications cascade constraints;
Drop table CustomerApplication cascade constraints;

Purge RecycleBin; 

CREATE TABLE Vendor (
 VendorName          VARCHAR2(20) NOT NULL,
 AcctRepName         VARCHAR2(14),
 AcctRepPhone        NUMBER(20),
 SupportPhone        NUMBER(20),
 SupportEmail        VARCHAR2(20),
CONSTRAINT Vendor_PRIMARY_KEY PRIMARY KEY (VendorName));

INSERT INTO Vendor VALUES ('Amazon','Sunil',' 7412589635',' 3695525814','slp@gmail.com');
INSERT INTO Vendor VALUES ('Enlyft','Sravani',' 5697654892',' 7755556669','tps@gmail.com');
INSERT INTO Vendor VALUES ('Fox','Srikanth','7206536671',' 7654987568','Vu3tom@gmail.com');
INSERT INTO Vendor VALUES ('Google','Vamsi',' 7563214568',' 9637415978','ste@gmail.com');
INSERT INTO Vendor VALUES ('Lorven','Rahul',' 7369864198',' 7775986663','tse@gmail.com');
INSERT INTO Vendor VALUES ('Walmart','Nikith',' 4893564795',' 7459863145','sop@gmail.com');
INSERT INTO Vendor VALUES ('Zendesk','Adepu','  7586874658',' 4587598756','swe@gmail.com');

------------------------------------------------------------------------------------------------
/*
Vendor: (VendorName, AcctRepName, AcctRepPhone, SupportPhone, SupportEmail)
           i. Primary key: VendorName
*/

---------------------------------------------------------------------------------------------------


CREATE TABLE Department ( 
DeptName  VARCHAR2(20) NOT NULL,
OnCallName VARCHAR2(20),
OnCallPhone NUMBER(12),
CONSTRAINT Department_PRIMARY_KEY PRIMARY KEY (DeptName));



INSERT INTO Department VALUES ('Accounting','Lokesh','  6541674189');
INSERT INTO Department VALUES ('Admin','Sai','  5614510651');
INSERT INTO Department VALUES ('Desingning','Raj','  5649519519');
INSERT INTO Department VALUES ('Development','Albin','  1564165146');
INSERT INTO Department VALUES ('Finance','Rachel','  3426496415');
INSERT INTO Department VALUES ('HR ','Raymond','  6464161564');
INSERT INTO Department VALUES ('Marketing','Noel','  7891665659');
INSERT INTO Department VALUES ('Operations','James','  5616516520');
INSERT INTO Department VALUES ('Product','Naomi','  4565419854');
INSERT INTO Department VALUES ('Production','Ricky','  8946156515');
INSERT INTO Department VALUES ('Purchasing','Arvind','  6541651515');
INSERT INTO Department VALUES ('Research','Gokul','  5654198542');
INSERT INTO Department VALUES ('Sales','Haveela','  2123165465');
INSERT INTO Department VALUES ('Security','Jose','  5649655105');

----------------------------------------------------------------------------------------------
/*
 Department: (DeptName, OnCallName, OnCallPhone)
           i.	Primary key: DeptName
*/
-----------------------------------------------------------------------------------------------


CREATE TABLE OperatingSystem ( 
OSName       VARCHAR2(20) NOT NULL,
LicenseCount NUMBER(20),
LicenseKey   NUMBER(12),
VendorName   VARCHAR2(20),
CONSTRAINT OperatingSystem_VendorName_FK FOREIGN KEY (VendorName) REFERENCES Vendor (VendorName),
CONSTRAINT OperatingSystem_PRIMARY_KEY PRIMARY KEY (OSName));

INSERT INTO OperatingSystem VALUES ('Windows server 2012','5','7229865','Fox');
INSERT INTO OperatingSystem VALUES ('Windows server 2014','2','6597637','Fox');
INSERT INTO OperatingSystem VALUES ('Windows server 2015','5','1234568','Google');
INSERT INTO OperatingSystem VALUES ('Windows server 2016','8','1597763','Amazon');
INSERT INTO OperatingSystem VALUES ('Windows server 2017','3','4569128','Lorven');
INSERT INTO OperatingSystem VALUES ('Windows Server 2020','9','7391564','Zendesk');

-----------------------------------------------------------------------------------------------------
/*
 OperatingSystem: (OSName, LicenseCount, LicenseKey, VendorName)
           i.  Primary key: OSName
           ii. Foreign Keys: VendorName
*/
--------------------------------------------------------------------------------------------------------


CREATE TABLE Customer ( 
Customer#       VARCHAR2(20) NOT NULL,
Name            VARCHAR2(25),
Industry        VARCHAR2(20),
AcctRep         VARCHAR2(20),
AcctRepPhone    NUMBER(13),
TechRep         VARCHAR2(20),
TechRepPhone    NUMBER(13),

CONSTRAINT Customer_PRIMARY_KEY PRIMARY KEY (Customer# ));

INSERT INTO Customer VALUES ('C1','Richard','Manufacturing','Pandu','5165465598','Violet',' 5646555688');
INSERT INTO Customer VALUES ('C2','Tekky','Construction','Liam','6548954898','William','5641654165');
INSERT INTO Customer VALUES ('C3','Sneha','Retail','Oliver',' 6689512555','litte','6516516556');
INSERT INTO Customer VALUES ('C4','Sharon','Transport','Elijah',' 5645464844','John',' 5615616126');
INSERT INTO Customer VALUES ('C5','Ganesh','Insurance','Harper',' 4854968548','Mathew',' 5616516561');
INSERT INTO Customer VALUES ('C6','Lissy','Education','Emma',' 5646546524','Jacob',' 5615165165');
INSERT INTO Customer VALUES ('C7','Mary','Investment','Henry',' 5644654895','Mark',' 5161651652');

-----------------------------------------------------------------------------------------------------------
/*
Customer: (Customer#, Name, Industry, AcctRep, AcctRepPhone, TechRep, TechRepPhone)
            i.	Primary key: Customer#
*/

------------------------------------------------------------------------------------------------------------


CREATE TABLE Applications( 
AppName       VARCHAR2(20) NOT NULL,
Version      VARCHAR2(25),
LicenseCount  NUMBER(13),
LicenseKey    VARCHAR2(20),
VendorName    VARCHAR2(20),
DeptName      VARCHAR2(20),

CONSTRAINT Applications_VendorName_FK FOREIGN KEY (VendorName) REFERENCES Vendor (VendorName),
CONSTRAINT Applications_DeptName_FK FOREIGN KEY (DeptName) REFERENCES Department (DeptName),
CONSTRAINT Applications_PRIMARY_KEY PRIMARY KEY  (AppName));


INSERT INTO Applications VALUES ('Chummerly','5.1',4,'H56466','Google','Accounting');
INSERT INTO Applications VALUES ('Click Sony','5.2',6,'A15668','Walmart','Sales');
INSERT INTO Applications VALUES ('Digio','5.6',5,'G45646','Enlyft','Research');
INSERT INTO Applications VALUES ('Fun Farms','2.1',8,'U15655','Enlyft','Production');
INSERT INTO Applications VALUES ('LeanBot','4.1',1,'X56654','Amazon','Production');
INSERT INTO Applications VALUES ('Shredda','3.2',2,'T16545','Zendesk','Sales');

------------------------------------------------------------------------------------------------
/*
Application: (AppName, Version, LicenseCount, LicenseKey, VendorName, DeptName)
            i.	Primary key: AppName
            ii. Foreign Keys: VendorName, DeptName
*/
---------------------------------------------------------------------------------------------------


CREATE TABLE CustomerApplication( 
AppName       VARCHAR2(20),
Customer#     VARCHAR2(20),
MaintWindow   NUMBER(13),

CONSTRAINT CustomerApplication_AppName_FK FOREIGN KEY (AppName) REFERENCES Applications (AppName),
CONSTRAINT CustomerApplication_Customer#_FK FOREIGN KEY (Customer#) REFERENCES Customer (Customer#));




INSERT INTO CustomerApplication VALUES('LeanBot','C6',1233);
INSERT INTO CustomerApplication VALUES('Click Sony','C4',5944);
INSERT INTO CustomerApplication VALUES('Shredda','C7',6685);
INSERT INTO CustomerApplication VALUES('Digio','C4',5664);
INSERT INTO CustomerApplication VALUES('Shredda','C5',5111);
INSERT INTO CustomerApplication VALUES('Fun Farms','C1',5465);
INSERT INTO CustomerApplication VALUES('Digio','C3',5649);
INSERT INTO CustomerApplication VALUES('Shredda','C6',6454);
INSERT INTO CustomerApplication VALUES('Click Sony','C3',3549);
INSERT INTO CustomerApplication VALUES('Chummerly','C1',1651);
INSERT INTO CustomerApplication VALUES('Click Sony','C5',6548);

------------------------------------------------------------------------------------------------------------

/*
CustomerApplication: (AppName, Version, Customer#, MaintWindow)
            i. Foreign Keys: AppName,  Customer#
        */

-------------------------------------------------------------------------------------------------------------





------------------------------------------------------------------------------------------------------------
-- JOIN


--QUERY 1
-- Show customer#,appname for all customers using the application.

SELECT customer.customer#,customerapplication.appname
FROM CUSTOMER
INNER JOIN CUSTOMERAPPLICATION
ON CUSTOMER.CUSTOMER#= CUSTOMERAPPLICATION.CUSTOMER#;


--Query 2
-- Show Deptname,Appname,Vendorname for customers using the Application.

SELECT DEPARTMENT.DEPTNAME,APPLICATIONS.APPNAME,VENDOR.VENDORNAME
FROM DEPARTMENT 
INNER JOIN APPLICATIONS 
ON DEPARTMENT.DEPTNAME = APPLICATIONS.DEPTNAME
INNER JOIN VENDOR 
ON APPLICATIONS.VENDORNAME = VENDOR.VENDORNAME;

--------------------------------------------------------------------------------------------
-- AGGREGATE


--Query 3
--  show the number of customers with customer# C6

select count(customer#)
from customerapplication
where customer#= 'C6';


--Query 4
-- Show the number of customers in a descending order where having more than one customer.
SELECT COUNT(Customer#), AppName
FROM customerapplication
GROUP BY AppName
HAVING COUNT(Customer#) > 1
ORDER BY COUNT(Customer#) DESC;


--Query 5
-- show the maximum number of Licensecount

SELECT max(LicenseCount)
FROM applications;


--Query 6
--show the number of customer and Appname in an Ascending order using Group by function.

SELECT APPNAME, COUNT(*)
FROM CUSTOMERAPPLICATION
GROUP BY APPNAME
ORDER BY COUNT(*) ASC;

-----------------------------------------------------------------------------------------
--SUB



--Query 7
-- Show VendorName,AcctRepName,AcctRepPhone having more than two more than two in application.

SELECT VendorName,AcctRepName,AcctRepPhone
FROM vendor
WHERE VendorName IN (SELECT VendorName FROM applications WHERE LicenseCount>2)
ORDER BY VendorName;


--Query 8
--show Appname,VendorName,DeptName such that the license count is more than the averge of license count 

SELECT AppName, VendorName, DeptName
FROM applications
WHERE LicenseCount > (SELECT avg(LicenseCount) FROM applications);

-----------------------------------------------------------------------------------------
--CRITERIA


--Query 9
--Show Appname,Version,VendorName,DeptName with either production or sales and licensecount having more that 3 number

SELECT AppName, Version, VendorName, DeptName
FROM applications
WHERE  (DeptName  = 'Production' OR  DeptName  = 'Sales') AND LicenseCount > 3;


--Query 10
--Show Osname of windows server 201 and having more or equal to 3 or where the name of the vendor is Amazon

SELECT OsName
FROM operatingsystem
WHERE (OsName LIKE 'Windows server 201%' AND LicenseCount >= 3) OR VendorName = 'Amazon';

-------------------------------------------------------------------------------------------
--OTHERS


--Query 11
--Show the details of all the customers using the application, Show Customer#,Name,Appname 

SELECT customer.Customer#,customer.Name, customerapplication.AppName
FROM customer
LEFT JOIN customerapplication ON customer.Customer# = customerapplication.Customer#
ORDER BY customer.Name;


--Query 12
--show the number of apps having more than one application which is used by all the customers

SELECT Customer.Name, COUNT(customerapplication.Appname) AS NumberOfApps
FROM (customerapplication
INNER JOIN customer ON customer.Customer# = customerapplication.Customer#)
GROUP BY Name
HAVING COUNT(customerapplication.Appname) > 1;

--------------------------------------------------------------------------------------------


commit; 




