CREATE DATABASE recsSystem;

USE recsSystem;

-- Account

CREATE TABLE AccountRole(
	roleId VARCHAR(16) PRIMARY KEY NOT NULL, 
	roleName VARCHAR(16) NOT NULL	
	);

CREATE TABLE Account(
	accountId int AUTO_INCREMENT PRIMARY KEY NOT NULL,
	username VARCHAR(32) NOT NULL,
	password VARCHAR(32) NOT NULL,
	roleId VARCHAR(16) NOT NULL,
	fullName NVARCHAR(32) NOT NULL,
	gender INT,
	email VARCHAR(64),
	phone VARCHAR(10),
	address NVARCHAR(128),
	idCard VARCHAR(16),
	status VARCHAR(16)
	);
	
ALTER TABLE Account ADD FOREIGN KEY (roleId) REFERENCES AccountRole(roleId);

CREATE TABLE Seller(
	sellerId VARCHAR(32),
	accountId INT(32),
	company NVARCHAR(64),
    CONSTRAINT PK_Seller PRIMARY KEY (sellerId,accountId),
    FOREIGN KEY (accountId) REFERENCES Account(accountId)
    );

CREATE TABLE Manager(
	managerId VARCHAR(32) NOT NULL,
	accountId INT,
	yearsOfExperience INT,
    CONSTRAINT PK_Manager PRIMARY KEY (managerId,accountId),
    FOREIGN KEY (accountId) REFERENCES Account(accountId)
);

CREATE TABLE Staff(
	staffId VARCHAR(32),
	accountId INT,
    CONSTRAINT PK_Staff PRIMARY KEY (staffId,accountId),
    FOREIGN KEY (accountId) REFERENCES Account(accountId)
);

CREATE TABLE Agency(
	agencyId VARCHAR(32),
	accountId INT,
	company NVARCHAR(32),
	yearsOfExperience INT,
	completedProject INT,
	description NVARCHAR(256),
    CONSTRAINT PK_Agency PRIMARY KEY (agencyId,accountId),
    FOREIGN KEY (accountId) REFERENCES Account(accountId)
);

CREATE TABLE Members(
	memberId VARCHAR(32),
	accountId INT,
	companyId NVARCHAR(32),
    CONSTRAINT PK_Member PRIMARY KEY (memberId,accountId),
    FOREIGN KEY (accountId) REFERENCES Account(accountId)
	);

-- Real Estate

CREATE TABLE RealEstate(
	realEstateId VARCHAR(64) PRIMARY KEY NOT NULL,
	name NVARCHAR(128) NOT NULL,
	realEstateType TINYINT(1),
	description NVARCHAR(256),
	address NVARCHAR(128),
	area FLOAT,
	price BIGINT,
	status TINYINT(1),
	displayable TINYINT(1),
	createTimestamp BIGINT,
	updateTimestamp BIGINT,
	sellerId VARCHAR(32) NOT NULL,
	FOREIGN KEY (sellerId) REFERENCES Seller(sellerId)
);

CREATE TABLE PropertyHouse(
	houseId VARCHAR(64) NOT NULL,
	realEstateId VARCHAR(64) NOT NULL,
	bedroom INT,
	bath INT,
	houseType VARCHAR(16),
	builtIn INT,
	CONSTRAINT PK_House PRIMARY KEY (houseId,realestateId),
	FOREIGN KEY (realEstateId) REFERENCES RealEstate(realEstateId)
	);

CREATE TABLE PropertyLand(
	landId VARCHAR(64) NOT NULL,
	realEstateId VARCHAR(64) NOT NULL,
	landType VARCHAR(16),
	CONSTRAINT PK_Land PRIMARY KEY (landId,realestateId),
	FOREIGN KEY (realEstateId) REFERENCES RealEstate(realEstateId)
	);

CREATE TABLE landImages(
	landId VARCHAR(64) NOT NULL PRIMARY KEY,
	url VARCHAR(512),
	FOREIGN KEY (landId) REFERENCES PropertyLand(landId)
);

CREATE TABLE houseImages(
	houseId VARCHAR(64) NOT NULL PRIMARY KEY,
	url VARCHAR(512),
	FOREIGN KEY (houseId) REFERENCES PropertyHouse(houseId)
);

CREATE TABLE landPaperworks(
	landpwId VARCHAR(64) NOT NULL PRIMARY KEY,
	name NVARCHAR(128) NOT NULL,
	url VARCHAR(512) NOT NULL,
	landId VARCHAR(64) NOT NULL,
	FOREIGN KEY (landId) REFERENCES PropertyLand(landId)
);

CREATE TABLE housePaperworks(
	housepwId VARCHAR(64) NOT NULL PRIMARY KEY,
	name NVARCHAR(128) NOT NULL,
	url VARCHAR(512) NOT NULL,
	houseId VARCHAR(64) NOT NULL,
	FOREIGN KEY (houseId) REFERENCES PropertyHouse(houseId)
);

-- Business

CREATE TABLE JobAssignStaff(
	jobId VARCHAR(64) NOT NULL PRIMARY KEY,
	createTimestamp BIGINT,
	priority INT,
	status VARCHAR(16),
	managerId VARCHAR(32) NOT NULL,
	staffId VARCHAR(32) NOT NULL,
	realEstateId VARCHAR(64) NOT NULL,
	FOREIGN KEY (managerId) REFERENCES Manager(managerId),
	FOREIGN KEY (staffId) REFERENCES Staff(staffId),
	FOREIGN KEY (realEstateId) REFERENCES RealEstate(realEstateId)
);

CREATE TABLE JobAssignMember(
	jobId VARCHAR(64) NOT NULL PRIMARY KEY,
	createTimestamp BIGINT,
	priority INT,
	status VARCHAR(16),
	agencyId VARCHAR(32) NOT NULL,
	memberId VARCHAR(32) NOT NULL,
	realEstateId VARCHAR(64) NOT NULL,
	FOREIGN KEY (agencyId) REFERENCES Agency(agencyId),
	FOREIGN KEY (memberId) REFERENCES Members(memberId),
	FOREIGN KEY (realEstateId) REFERENCES RealEstate(realEstateId)
);


CREATE TABLE AgencyRequest(
	requestId VARCHAR(64) NOT NULL PRIMARY KEY,
	createTimestamp BIGINT,
	status VARCHAR(16),
	agencyId VARCHAR(32),
	realEstateId VARCHAR(64) NOT NULL,
	FOREIGN KEY (agencyId) REFERENCES Agency(agencyId),
	FOREIGN KEY (realEstateId) REFERENCES RealEstate(realEstateId)
);

CREATE TABLE BuyerRequest(
	requestId VARCHAR(64) NOT NULL PRIMARY KEY,
	buyerFirstName NVARCHAR(16),
	buyerLastName NVARCHAR(16),
	message NVARCHAR(512),
	createTimestamp BIGINT,
	status VARCHAR(16),
	memberId VARCHAR(32), 
	realEstateId VARCHAR(64) NOT NULL,
	FOREIGN KEY (realEstateId) REFERENCES RealEstate(realEstateId),
	FOREIGN KEY (memberId) REFERENCES Members(memberId)
	);


