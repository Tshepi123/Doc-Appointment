Use master

	IF EXISTS(SELECT name FROM master.dbo.sysdatabases
			  WHERE name = 'medical_consulting_db1')
	BEGIN
		DROP DATABASE medical_consulting_db1
		PRINT 'The database has been deleted'
	END

	CREATE DATABASE medical_consulting_db1
	ON Primary
		(NAME = 'medical_consulting_db1_Data',
		 FILENAME = 'C:\medConsult\medical_consulting_db1_data.mdf',
		 SIZE = 5MB,
		 FILEGROWTH = 10%)

	LOG ON
		(NAME = 'medical_consulting_db1_Log',
		 FILENAME = 'C:\medConsult\medical_consulting_db1_Log.ldf',
		 SIZE = 5MB,
		 FILEGROWTH = 10%)
GO

USE medical_consulting_db1
GO

CREATE TABLE registration (
	id INT IDENTITY(1, 3) NOT NULL,
	name VARCHAR(50),
	surname VARCHAR(50),
	middleName VARCHAR(50),
	birthDate VARCHAR(50),
	tel VARCHAR(50),
	address VARCHAR(50),
	email VARCHAR(50),													
	password VARCHAR(50),						
	PRIMARY KEY(id), 	 						
) 
GO 

PRINT 'The registration table has been created'
GO

CREATE TABLE booking (
	id INT IDENTITY(1, 3) NOT NULL,
	bookingDate VARCHAR(50),
	bookingTime VARCHAR(50),							
	reason VARCHAR(50),	
	regid INT NOT NULL,
	PRIMARY KEY(id), 
	FOREIGN KEY (regid) REFERENCES registration(id),
) 
GO

PRINT 'The booking table has been created'
GO