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
(UUID(), (SELECT accountId FROM Account WHERE username = 'staff.user2'), (SELECT managerId FROM Manager WHERE accountId = (SELECT accountId FROM Account WHERE username = 'manager.user'))),
(UUID(), (SELECT accountId FROM Account WHERE username = 'staff.user3'), (SELECT managerId FROM Manager WHERE accountId = (SELECT accountId FROM Account WHERE username = 'manager.user'))),
(UUID(), (SELECT accountId FROM Account WHERE username = 'staff.user4'), (SELECT managerId FROM Manager WHERE accountId = (SELECT accountId FROM Account WHERE username = 'manager.user'))),
(UUID(), (SELECT accountId FROM Account WHERE username = 'staff.user5'), (SELECT managerId FROM Manager WHERE accountId = (SELECT accountId FROM Account WHERE username = 'manager.user'))),
(UUID(), (SELECT accountId FROM Account WHERE username = 'staff.user6'), (SELECT managerId FROM Manager WHERE accountId = (SELECT accountId FROM Account WHERE username = 'manager.user')));

INSERT INTO Agency (agencyId, accountId, company, yearsOfExperience, completedProject, description) VALUES
(UUID(), (SELECT accountId FROM Account WHERE username = 'agency.user2'), 'Agency Company 2', 6, 55, 'Agency Description 2'),
(UUID(), (SELECT accountId FROM Account WHERE username = 'agency.user3'), 'Agency Company 3', 7, 60, 'Agency Description 3'),
(UUID(), (SELECT accountId FROM Account WHERE username = 'agency.user4'), 'Agency Company 4', 8, 65, 'Agency Description 4'),
(UUID(), (SELECT accountId FROM Account WHERE username = 'agency.user5'), 'Agency Company 5', 9, 70, 'Agency Description 5'),
(UUID(), (SELECT accountId FROM Account WHERE username = 'agency.user6'), 'Agency Company 6', 10, 75, 'Agency Description 6');



