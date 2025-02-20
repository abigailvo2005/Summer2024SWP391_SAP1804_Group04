USE recsSystem;

INSERT INTO AccountRole(roleId,roleName) VALUES ('ROLE_ADMIN','Admin');
INSERT INTO AccountRole(roleId,roleName) VALUES ('ROLE_SELLER','Seller');
INSERT INTO AccountRole(roleId,roleName) VALUES ('ROLE_STAFF','Staff');
INSERT INTO AccountRole(roleId,roleName) VALUES ('ROLE_MANAGER','Manager');
INSERT INTO AccountRole(roleId,roleName) VALUES ('ROLE_AGENCY','Agency');
INSERT INTO AccountRole(roleId,roleName) VALUES ('ROLE_MEMBER','Member');

INSERT INTO Account (username, password, roleId, fullName, gender, email, phone, address, idCard, status, birthDate) VALUES
('admin.user', '$2a$10$fWhqL7BWTvVkZl6CyMNPTegbrSM7IJVQLpVgcKXocXiCI1IKU8wnq', 'ROLE_ADMIN', 'Admin User', 1, 'admin@example.com', '1234567890', '123 Admin St', 'ID123456789', 'ACTIVE', '1980-01-01'),
('seller.user', '$2a$10$fWhqL7BWTvVkZl6CyMNPTegbrSM7IJVQLpVgcKXocXiCI1IKU8wnq', 'ROLE_SELLER', 'Seller User', 1, 'seller@example.com', '1234567891', '456 Seller St', 'ID123456788', 'ACTIVE', '1985-02-02'),
('staff.user', '$2a$10$fWhqL7BWTvVkZl6CyMNPTegbrSM7IJVQLpVgcKXocXiCI1IKU8wnq', 'ROLE_STAFF', 'Staff User', 0, 'staff@example.com', '1234567892', '789 Staff St', 'ID123456787', 'APPROVING', '1990-03-03'),
('manager.user', '$2a$10$fWhqL7BWTvVkZl6CyMNPTegbrSM7IJVQLpVgcKXocXiCI1IKU8wnq', 'ROLE_MANAGER', 'Manager User', 1, 'manager@example.com', '1234567893', '101 Manager St', 'ID123456786', 'ACTIVE', '1982-04-04'),
('agency.user', '$2a$10$fWhqL7BWTvVkZl6CyMNPTegbrSM7IJVQLpVgcKXocXiCI1IKU8wnq', 'ROLE_AGENCY', 'Agency User', 1, 'agency@example.com', '1234567894', '102 Agency St', 'ID123456785', 'ACTIVE', '1983-05-05'),
('member.user', '$2a$10$fWhqL7BWTvVkZl6CyMNPTegbrSM7IJVQLpVgcKXocXiCI1IKU8wnq', 'ROLE_MEMBER', 'Member User', 0, 'member@example.com', '1234567895', '103 Member St', 'ID123456784', 'APPROVING', '1991-06-06');

SELECT * FROM Account;

INSERT INTO Seller (sellerId, accountId, company) VALUES
(UUID(), (SELECT accountId FROM Account WHERE username = 'seller.user'), 'Seller Company');

INSERT INTO Manager (managerId, accountId, yearsOfExperience) VALUES
(UUID(), (SELECT accountId FROM Account WHERE username = 'manager.user'), 10);

INSERT INTO Staff (staffId, accountId, managerId) VALUES
(UUID(), (SELECT accountId FROM Account WHERE username = 'staff.user'), (SELECT managerId FROM Manager WHERE accountId = (SELECT accountId FROM Account WHERE username = 'manager.user')));

INSERT INTO Agency (agencyId, accountId, company, yearsOfExperience, completedProject, description) VALUES
(UUID(), (SELECT accountId FROM Account WHERE username = 'agency.user'), 'Agency Company', 5, 50, 'Agency Description');

INSERT INTO Members (memberId, accountId, companyId, agencyId) VALUES
(UUID(), (SELECT accountId FROM Account WHERE username = 'member.user'), 'CompanyID', (SELECT agencyId FROM Agency WHERE accountId = (SELECT accountId FROM Account WHERE username = 'agency.user')));


INSERT INTO Account (username, password, roleId, fullName, gender, email, phone, address, idCard, status, birthDate) VALUES
('staff.user2', '$2a$10$fWhqL7BWTvVkZl6CyMNPTegbrSM7IJVQLpVgcKXocXiCI1IKU8wnq', 'ROLE_STAFF', 'Staff User 2', 1, 'staff2@example.com', '1234567896', '110 Staff St', 'ID123456781', 'APPROVING', '1992-07-07'),
('staff.user3', '$2a$10$fWhqL7BWTvVkZl6CyMNPTegbrSM7IJVQLpVgcKXocXiCI1IKU8wnq', 'ROLE_STAFF', 'Staff User 3', 0, 'staff3@example.com', '1234567897', '111 Staff St', 'ID123456782', 'APPROVING', '1993-08-08'),
('staff.user4', '$2a$10$fWhqL7BWTvVkZl6CyMNPTegbrSM7IJVQLpVgcKXocXiCI1IKU8wnq', 'ROLE_STAFF', 'Staff User 4', 1, 'staff4@example.com', '1234567898', '112 Staff St', 'ID123456783', 'APPROVING', '1994-09-09'),
('staff.user5', '$2a$10$fWhqL7BWTvVkZl6CyMNPTegbrSM7IJVQLpVgcKXocXiCI1IKU8wnq', 'ROLE_STAFF', 'Staff User 5', 0, 'staff5@example.com', '1234567899', '113 Staff St', 'ID123456780', 'APPROVING', '1995-10-10'),
('staff.user6', '$2a$10$fWhqL7BWTvVkZl6CyMNPTegbrSM7IJVQLpVgcKXocXiCI1IKU8wnq', 'ROLE_STAFF', 'Staff User 6', 1, 'staff6@example.com', '1234567890', '114 Staff St', 'ID123456799', 'APPROVING', '1996-11-11'),
('agency.user2', '$2a$10$fWhqL7BWTvVkZl6CyMNPTegbrSM7IJVQLpVgcKXocXiCI1IKU8wnq', 'ROLE_AGENCY', 'Agency User 2', 1, 'agency2@example.com', '1234567890', '120 Agency St', 'ID123456798', 'APPROVING', '1984-12-12'),
('agency.user3', '$2a$10$fWhqL7BWTvVkZl6CyMNPTegbrSM7IJVQLpVgcKXocXiCI1IKU8wnq', 'ROLE_AGENCY', 'Agency User 3', 0, 'agency3@example.com', '1234567890', '121 Agency St', 'ID123456797', 'APPROVING', '1985-01-01'),
('agency.user4', '$2a$10$fWhqL7BWTvVkZl6CyMNPTegbrSM7IJVQLpVgcKXocXiCI1IKU8wnq', 'ROLE_AGENCY', 'Agency User 4', 1, 'agency4@example.com', '1234567890', '122 Agency St', 'ID123456796', 'APPROVING', '1986-02-02'),
('agency.user5', '$2a$10$fWhqL7BWTvVkZl6CyMNPTegbrSM7IJVQLpVgcKXocXiCI1IKU8wnq', 'ROLE_AGENCY', 'Agency User 5', 0, 'agency5@example.com', '1234567890', '123 Agency St', 'ID123456795', 'APPROVING', '1987-03-03'),
('agency.user6', '$2a$10$fWhqL7BWTvVkZl6CyMNPTegbrSM7IJVQLpVgcKXocXiCI1IKU8wnq', 'ROLE_AGENCY', 'Agency User 6', 1, 'agency6@example.com', '1234567890', '124 Agency St', 'ID123456794', 'APPROVING', '1988-04-04');

INSERT INTO Staff (staffId, accountId, managerId) VALUES
(UUID(), (SELECT accountId FROM Account WHERE username = 'staff.user2'), '1229dfa1-22f1-11ef-99c9-2c4d54675fbe'),
(UUID(), (SELECT accountId FROM Account WHERE username = 'staff.user3'), '1229dfa1-22f1-11ef-99c9-2c4d54675fbe'),
(UUID(), (SELECT accountId FROM Account WHERE username = 'staff.user4'), '1229dfa1-22f1-11ef-99c9-2c4d54675fbe'),
(UUID(), (SELECT accountId FROM Account WHERE username = 'staff.user5'), '1229dfa1-22f1-11ef-99c9-2c4d54675fbe'),
(UUID(), (SELECT accountId FROM Account WHERE username = 'staff.user6'), '1229dfa1-22f1-11ef-99c9-2c4d54675fbe');

INSERT INTO Agency (agencyId, accountId, company, yearsOfExperience, completedProject, description) VALUES
(UUID(), (SELECT accountId FROM Account WHERE username = 'agency.user2'), 'Agency Company 2', 6, 55, 'Agency Description 2'),
(UUID(), (SELECT accountId FROM Account WHERE username = 'agency.user3'), 'Agency Company 3', 7, 60, 'Agency Description 3'),
(UUID(), (SELECT accountId FROM Account WHERE username = 'agency.user4'), 'Agency Company 4', 8, 65, 'Agency Description 4'),
(UUID(), (SELECT accountId FROM Account WHERE username = 'agency.user5'), 'Agency Company 5', 9, 70, 'Agency Description 5'),
(UUID(), (SELECT accountId FROM Account WHERE username = 'agency.user6'), 'Agency Company 6', 10, 75, 'Agency Description 6');


INSERT INTO Account (username, password, roleId, fullName, gender, email, phone, address, idCard, status, birthDate) VALUES
('seller1', '$2a$10$fWhqL7BWTvVkZl6CyMNPTegbrSM7IJVQLpVgcKXocXiCI1IKU8wnq', 'ROLE_SELLER', 'Seller One', 0, 'seller1@example.com', '1234567890', '123 Seller St', 'S123456', 'ACTIVE', '1990-01-01'),
('seller2', '$2a$10$fWhqL7BWTvVkZl6CyMNPTegbrSM7IJVQLpVgcKXocXiCI1IKU8wnq', 'ROLE_SELLER', 'Seller Two', 1, 'seller2@example.com', '1234567891', '124 Seller St', 'S123457', 'ACTIVE', '1991-02-02'),
('manager1', '$2a$10$fWhqL7BWTvVkZl6CyMNPTegbrSM7IJVQLpVgcKXocXiCI1IKU8wnq', 'ROLE_MANAGER', 'Manager One', 0, 'manager1@example.com', '1234567892', '125 Manager St', 'M123456', 'ACTIVE', '1992-03-03'),
('manager2', '$2a$10$fWhqL7BWTvVkZl6CyMNPTegbrSM7IJVQLpVgcKXocXiCI1IKU8wnq', 'ROLE_MANAGER', 'Manager Two', 1, 'manager2@example.com', '1234567893', '126 Manager St', 'M123457', 'ACTIVE', '1993-04-04');



INSERT INTO Seller (sellerId, accountId, company) VALUES
(UUID(), 23, 'Company One'),
(UUID(), 24, 'Company Two');

INSERT INTO Manager (managerId, accountId, yearsOfExperience) VALUES
(UUID(), 25, 10),
(UUID(), 26, 15);


-- Insert data into RealEstate table with status
INSERT INTO RealEstate (realEstateId, name, realEstateType, description, address, area, price, status, displayable, createTimestamp, updateTimestamp, sellerId, managerId) VALUES
(UUID(), 'Villa with Garden', 1, 'Luxurious villa with beautiful garden', '123 Main St', 3500.00, 1000000, 'reviewing', 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), '15c25832-22f1-11ef-99c9-2c4d54675fbe', '1229dfa1-22f1-11ef-99c9-2c4d54675fbe'),
(UUID(), 'Downtown Apartment', 2, 'Modern apartment in the heart of the city', '456 Elm St', 1000.00, 500000, 'reviewing', 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), '15c25832-22f1-11ef-99c9-2c4d54675fbe', '1229dfa1-22f1-11ef-99c9-2c4d54675fbe'),
(UUID(), 'Country Mansion', 1, 'Grand mansion in the countryside', '789 Oak St', 8000.00, 2000000, 'reviewing', 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), '15c25832-22f1-11ef-99c9-2c4d54675fbe', '1229dfa1-22f1-11ef-99c9-2c4d54675fbe'),
(UUID(), 'Cottage by the Lake', 2, 'Charming cottage with lake view', '101 Pine St', 800.00, 300000, 'validating', 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), '15c25832-22f1-11ef-99c9-2c4d54675fbe', '1229dfa1-22f1-11ef-99c9-2c4d54675fbe'),
(UUID(), 'Beach Condo', 2, 'Stylish condo by the beach', '321 Beach Blvd', 1500.00, 700000, 'validating', 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), '15c25832-22f1-11ef-99c9-2c4d54675fbe', '1229dfa1-22f1-11ef-99c9-2c4d54675fbe'),
(UUID(), 'Green Acres', 1, 'Scenic land for agriculture', '10 Farm Rd', 5000.00, 500000, 'validating', 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), '15c25832-22f1-11ef-99c9-2c4d54675fbe', '1229dfa1-22f1-11ef-99c9-2c4d54675fbe'),
(UUID(), 'Commercial Plot', 2, 'Prime commercial land', '15 Business Ave', 2000.00, 1000000, 'success', 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), '15c25832-22f1-11ef-99c9-2c4d54675fbe', '1229dfa1-22f1-11ef-99c9-2c4d54675fbe'),
(UUID(), 'Forest Retreat', 1, 'Serene land amidst the forest', '20 Woods Ln', 7000.00, 800000, 'success', 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), '15c25832-22f1-11ef-99c9-2c4d54675fbe', '1229dfa1-22f1-11ef-99c9-2c4d54675fbe'),
(UUID(), 'Rural Farm', 2, 'Farm land with countryside views', '25 Country Rd', 6000.00, 400000, 'fail', 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), '15c25832-22f1-11ef-99c9-2c4d54675fbe', '1229dfa1-22f1-11ef-99c9-2c4d54675fbe'),
(UUID(), 'Lakefront Property', 2, 'Beautiful land by the lake', '30 Lakeview Dr', 2000.00, 600000, 'fail', 1, UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), '15c25832-22f1-11ef-99c9-2c4d54675fbe', '1229dfa1-22f1-11ef-99c9-2c4d54675fbe');

-- Insert data into PropertyHouse table
INSERT INTO PropertyHouse (houseId, realEstateId, bedroom, bath, houseType, builtIn) VALUES
(UUID(), (SELECT realEstateId FROM RealEstate WHERE name = 'Villa with Garden'), 5, 4, 'Villa', 2005),
(UUID(), (SELECT realEstateId FROM RealEstate WHERE name = 'Downtown Apartment'), 2, 2, 'Apartment', 2010),
(UUID(), (SELECT realEstateId FROM RealEstate WHERE name = 'Country Mansion'), 8, 6, 'Mansion', 1990),
(UUID(), (SELECT realEstateId FROM RealEstate WHERE name = 'Cottage by the Lake'), 3, 2, 'Cottage', 1985),
(UUID(), (SELECT realEstateId FROM RealEstate WHERE name = 'Beach Condo'), 4, 3, 'Condo', 2015);

-- Insert data into PropertyLand table
INSERT INTO PropertyLand (landId, realEstateId, landType) VALUES
(UUID(), (SELECT realEstateId FROM RealEstate WHERE name = 'Green Acres'), 'Agricultural'),
(UUID(), (SELECT realEstateId FROM RealEstate WHERE name = 'Commercial Plot'), 'Commercial'),
(UUID(), (SELECT realEstateId FROM RealEstate WHERE name = 'Forest Retreat'), 'Residential'),
(UUID(), (SELECT realEstateId FROM RealEstate WHERE name = 'Rural Farm'), 'Agricultural'),
(UUID(), (SELECT realEstateId FROM RealEstate WHERE name = 'Lakefront Property'), 'Residential');

UPDATE JobAssignStaff SET status = 'Assigned' WHERE status = 'validating';
UPDATE RealEstate SET status = 'Reviewing' WHERE status = 'reviewing';
UPDATE RealEstate SET status = 'Displayed' WHERE status = 'success';
UPDATE RealEstate SET status = 'Validating' WHERE status = 'validating';
UPDATE RealEstate SET status = 'Unqualified' WHERE status = 'UNQUALIFIED';

INSERT INTO DealAssignMember (
    dealId, createTimestamp, priority, status, agencyId, memberId, realEstateId
) VALUES (
    UUID(), 1622547800000, 1, 'active', '99d39b8f-285a-11ef-b7aa-2c4d54675fbe', '549c6a5c-2990-11ef-99d0-2c4d54675fbe', 'e5d4700c-0c9a-4e66-a667-80415ea7bd3c'
);

INSERT INTO DealAssignMember (
    dealId, createTimestamp, priority, status, agencyId, memberId, realEstateId
) VALUES (
    UUID(), 1622547800000, 1, 'active', '99d39b8f-285a-11ef-b7aa-2c4d54675fbe', '549c6a5c-2990-11ef-99d0-2c4d54675fbe', 'bd45c3aa-a5a2-4a9b-ad53-40e21cc2aaa0'
),
  (
    UUID(), 1622547800000, 1, 'active', '99d39b8f-285a-11ef-b7aa-2c4d54675fbe', '549c6a5c-2990-11ef-99d0-2c4d54675fbe', '7589e3b2-73d3-47d4-9eaf-49cfe350b3d6'
);
















