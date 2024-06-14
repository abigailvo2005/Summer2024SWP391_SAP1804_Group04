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
	password VARCHAR(128) NOT NULL,
	roleId VARCHAR(16) NOT NULL,
	fullName NVARCHAR(32) NOT NULL,
	gender INT,
	email VARCHAR(64),
	phone VARCHAR(10),
	address NVARCHAR(128),
	idCard VARCHAR(16),
	status VARCHAR(16)
	);

ALTER TABLE Account ADD COLUMN birthDate DATE;
ALTER TABLE Account ADD FOREIGN KEY (roleId) REFERENCES AccountRole(roleId);

-- Seller Table
CREATE TABLE Seller(
    sellerId VARCHAR(36) PRIMARY KEY,
    accountId INT,
    company NVARCHAR(64),
    FOREIGN KEY (accountId) REFERENCES Account(accountId)
);

-- Manager Table
CREATE TABLE Manager(
    managerId VARCHAR(36) PRIMARY KEY NOT NULL,
    accountId INT,
    yearsOfExperience INT,
    FOREIGN KEY (accountId) REFERENCES Account(accountId)
);

-- Staff Table
CREATE TABLE Staff(
    staffId VARCHAR(36) PRIMARY KEY,
    accountId INT,
    managerId VARCHAR(36) NOT NULL,
    FOREIGN KEY (accountId) REFERENCES Account(accountId),
    FOREIGN KEY (managerId) REFERENCES Manager(managerId)
);

-- Agency Table
CREATE TABLE Agency(
    agencyId VARCHAR(36) PRIMARY KEY,
    accountId INT,
    company NVARCHAR(36),
    yearsOfExperience INT,
    completedProject INT,
    description NVARCHAR(256),
    FOREIGN KEY (accountId) REFERENCES Account(accountId)
);

-- Members Table
CREATE TABLE Members(
    memberId VARCHAR(36) PRIMARY KEY,
    accountId INT,
    agencyId VARCHAR(36),
    FOREIGN KEY (accountId) REFERENCES Account(accountId),
    FOREIGN KEY (agencyId) REFERENCES Agency(agencyId)
);

-- Real Estate Table
CREATE TABLE RealEstate(
    realEstateId VARCHAR(64) PRIMARY KEY NOT NULL,
    name NVARCHAR(128) NOT NULL,
    realEstateType TINYINT(1),
    description NVARCHAR(256),
    address NVARCHAR(128),
    area FLOAT,
    price BIGINT,
    status VARCHAR(32),
    displayable TINYINT(1),
    createTimestamp BIGINT,
    updateTimestamp BIGINT,
    sellerId VARCHAR(36) NOT NULL,
    managerId VARCHAR(36) NOT NULL,
    FOREIGN KEY (sellerId) REFERENCES Seller(sellerId),
    FOREIGN KEY (managerId) REFERENCES Manager(managerId)
);

ALTER TABLE RealEstate ADD noteMsg NVARCHAR(255)

-- PropertyHouse Table
CREATE TABLE PropertyHouse(
    houseId VARCHAR(64) NOT NULL,
    realEstateId VARCHAR(64) NOT NULL,
    bedroom INT,
    bath INT,
    houseType VARCHAR(16),
    builtIn INT,
    CONSTRAINT PK_House PRIMARY KEY (houseId, realEstateId),
    FOREIGN KEY (realEstateId) REFERENCES RealEstate(realEstateId)
);

-- PropertyLand Table
CREATE TABLE PropertyLand(
    landId VARCHAR(64) NOT NULL,
    realEstateId VARCHAR(64) NOT NULL,
    landType VARCHAR(16),
    CONSTRAINT PK_Land PRIMARY KEY (landId, realEstateId),
    FOREIGN KEY (realEstateId) REFERENCES RealEstate(realEstateId)
);

-- PropertyImages Table
CREATE TABLE PropertyImages(
    realEstateId VARCHAR(64) PRIMARY KEY,
    url VARCHAR(512),
    FOREIGN KEY (realEstateId) REFERENCES RealEstate(realEstateId)
);

-- Paperworks Table
CREATE TABLE Paperworks(
    realEstateId VARCHAR(64) PRIMARY KEY,
    name NVARCHAR(128) NOT NULL,
    url VARCHAR(512) NOT NULL,
    FOREIGN KEY (realEstateId) REFERENCES RealEstate(realEstateId)
);

-- Business Tables

CREATE TABLE JobAssignStaff(
    jobId VARCHAR(64) NOT NULL PRIMARY KEY,
    createTimestamp BIGINT,
    priority INT,
    status VARCHAR(16),
    managerId VARCHAR(36) NOT NULL,
    staffId VARCHAR(36) NOT NULL,
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
    agencyId VARCHAR(36) NOT NULL,
    memberId VARCHAR(36) NOT NULL,
    realEstateId VARCHAR(64) NOT NULL,
    FOREIGN KEY (agencyId) REFERENCES Agency(agencyId),
    FOREIGN KEY (memberId) REFERENCES Members(memberId),
    FOREIGN KEY (realEstateId) REFERENCES RealEstate(realEstateId)
);

ALTER TABLE PropertyDeal RENAME DealAssignMember;

CREATE TABLE AgencyRequest(
    requestId VARCHAR(64) NOT NULL PRIMARY KEY,
    createTimestamp BIGINT,
    status VARCHAR(16),
    agencyId VARCHAR(36),
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
    memberId VARCHAR(36),
    realEstateId VARCHAR(64) NOT NULL,
    FOREIGN KEY (realEstateId) REFERENCES RealEstate(realEstateId),
    FOREIGN KEY (memberId) REFERENCES Members(memberId)
);


