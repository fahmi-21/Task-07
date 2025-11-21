use task
GO 

CREATE SCHEMA TASK2
GO


--1. Create a table named Employees with columns for ID (integer),
-- Name (varchar), and Salary (decimal).
CREATE TABLE TASK2.EMPLOYEES(
	E_ID INT,
	NAME VARCHAR(50),
	SALARY DECIMAL
)

--2.Add a new column named Department to the Employees table with data type
--varchar(50).
ALTER TABLE [TASK2].[EMPLOYEES]
ADD DEPARTMENT VARCHAR(50);

--3.Remove the Salary column from the Employees table.
ALTER TABLE [TASK2].[EMPLOYEES]
DROP COLUMN SALARY;

--Rename the Department column in the Employees table to DeptName;.
EXEC SP_RENAME 'TASK2.EMPLOYEES.DEPARTMENT','DEPTNAME','COLUMN'

--4.Create Projects table
CREATE TABLE TASK2.PROJECTS(
	PROJECT_ID INT ,
	PROJECT_NAME VARCHAR(50)  
)

--6. Add Primary Key to Employees (ID)
ALTER TABLE [TASK2].[EMPLOYEES]
ADD CONSTRAINT PK_EMPLOYEES_ID PRIMARY KEY (E_ID);

--7. Create Foreign Key Employees → Projects
ALTER TABLE TASK2.EMPLOYEES
ADD CONSTRAINT FK_E_P FOREIGN KEY (E_ID)
REFERENCES TASK2.PROJECTS(PROJECT_ID);


--8. Remove the foreign key relationship between Employees and Projects
ALTER TABLE [TASK2].[EMPLOYEES]
DROP CONSTRAINT FK_E_P;

--9. Add a unique constraint to the Name column in the Employees table.
ALTER TABLE [TASK2].[EMPLOYEES]
ADD CONSTRAINT UQ_E_NAME UNIQUE (NAME);

--10. Create a table named Customers with columns for CustomerID (integer), FirstName
--(varchar), LastName (varchar), and Email (varchar), and Status (varchar).
CREATE TABLE TASK2.CUSTOMERS(
	C_ID INT ,
	F_NAME VARCHAR(50),
	L_NAME VARCHAR(50),
	E_MAIL VARCHAR(50),
	STATUS VARCHAR(50)
)

--11. Add a unique constraint to the combination of FirstName and LastName columns in
--the Customers table.
ALTER TABLE [TASK2].[CUSTOMERS]
ADD CONSTRAINT UQ_C_NAME UNIQUE (F_NAME,L_NAME);

--12. Add a default value of Active for the Status column in the Customers Table, where
--the default value should be applied when a new record is inserted.
ALTER TABLE [TASK2].[CUSTOMERS]
ADD CONSTRAINT DF_C_STATUS DEFAULT ('ACTIVE') FOR STATUS;

--13. Create a table named Orders with columns for OrderID (integer), CustomerID
--(integer), OrderDate (datetime), and TotalAmount (decimal).
CREATE TABLE TASK2.ORDERS(
	O_ID INT,
	C_ID INT,
	O_DATE DATETIME,
	TOTALAMOUNT DECIMAL
)

--14. Add a check constraint to the TotalAmount column in the Orders table to ensure
--that it is greater than zero.
ALTER TABLE [TASK2].[ORDERS]
ADD CONSTRAINT CK_O_TOTALAMOUNT CHECK (TOTALAMOUNT > 0);


--15. Create a schema named Sales and move the Orders; table into this schema.
GO
CREATE SCHEMA SALES;
GO

ALTER SCHEMA SALES TRANSFER TASK2.ORDERS;

--16. Rename the Orders table to SalesOrders.
EXEC SP_RENAME 'SALES.ORDERS','SalesOrders'