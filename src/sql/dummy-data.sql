-- Dummy data for Billing table
INSERT INTO Billing ("Card Number", "Expiry", "First Name", "Last Name", "Monthly Amount", "Billing Date")
VALUES ('1234567890123456', '2024-12-31', 'John', 'Doe', 100.00, '2024-03-29'),
       ('9876543210987654', '2024-11-30', 'Jane', 'Smith', 150.00, '2024-03-30');

-- Dummy data for User table
INSERT INTO "User" ("Username", "Email", "First Name", "Last Name", "Phone Number", "User Type", "Password", "Billing ID")
VALUES ('john_doe', 'john@example.com', 'John', 'Doe', '123456789', 'Customer', 'password123', 1),
       ('jane_smith', 'jane@example.com', 'Jane', 'Smith', '987654321', 'Staff', 'password456', 2);

-- Dummy data for Role table
INSERT INTO Role ("Role Name") VALUES ('Admin'), ('Manager'), ('Employee');

-- Dummy data for Package table
INSERT INTO Package ("Price", "Package Name")
VALUES (50.00, 'Basic'), (100.00, 'Standard'), (150.00, 'Premium');

-- Dummy data for Customer table
INSERT INTO Customer ("User ID", "Membership ID")
VALUES (1, 1), (1, NULL), (2, NULL);

-- Dummy data for Membership table
INSERT INTO Membership ("Customer ID", "Package ID", "Date Started")
VALUES (1, 2, '2024-01-01'), (3, 1, '2024-02-01');

-- Dummy data for Staff table
INSERT INTO Staff ("User ID", "Role ID", "Branch ID")
VALUES (2, 3, 1), (2, 2, 2);

-- Dummy data for Equipment Type table
INSERT INTO "Equipment Type" ("Equipment Name") VALUES ('Treadmill'), ('Dumbbell'), ('Stationary Bike');

-- Dummy data for Branch table
INSERT INTO Branch ("Address", "Manager ID")
VALUES ('123 Main St', 2), ('456 Elm St', 3);

-- Dummy data for Equipment table
INSERT INTO Equipment ("Name", "Purchase Date", "Company ID", "Equipment Details", "Equipment Type", "Branch ID")
VALUES ('Treadmill 1', '2023-01-01', 1, 'Model XYZ', 'Treadmill', 1),
       ('Dumbbell Set', '2023-02-01', 2, 'Set of 10 dumbbells', 'Dumbbell', 2);

-- Dummy data for Equipment Company table
INSERT INTO "Equipment Company" ("Name", "Phone Number")
VALUES ('Fitness Equipment Co', '123-456-7890'), ('Gym Supply Inc', '987-654-3210');