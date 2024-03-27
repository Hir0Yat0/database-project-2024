CREATE TABLE "Billing" (
  "Billing ID" INT AUTO_INCREMENT,
  "Card Number" VARCHAR(16),
  "Expiry" DATETIME,
  "First Name" VARCHAR(255),
  "Last Name" VARCHAR(255),
  "Monthly Amount" DECIMAL(10, 2),
  "Billing Date" DATETIME,
  PRIMARY KEY ("Billing ID")
);

CREATE TABLE "User" (
  "User ID" INT AUTO_INCREMENT,
  "Username" VARCHAR(255),
  "Email" VARCHAR(255),
  "First Name" VARCHAR(255),
  "Last Name" VARCHAR(255),
  "Phone Number" VARCHAR(15),
  "User Type" ENUM (Customer, Staff),
  "Password" VARCHAR(255),
  "Billing ID" INT,
  PRIMARY KEY ("User ID"),
  CONSTRAINT "FK_User.Billing ID" 
    FOREIGN KEY ("Billing ID")
    REFERENCES "Billing" ("Billing ID")
);

CREATE TABLE "Role" (
  "Role ID" INT AUTO_INCREMENT,
  "Role Name" VARCHAR(255),
  PRIMARY KEY ("Role ID")
);

CREATE TABLE "Branch" (
  "Branch ID" TINYINT AUTO_INCREMENT,
  "Address" VARCHAR(255),
  PRIMARY KEY ("Branch ID")
);

CREATE TABLE "Package" (
  "Package ID" TINYINT AUTO_INCREMENT,
  "Price" DECIMAL (10,2),
  "Package Tier" ENUM (Gold, Silver, Bronze, Wood),
  PRIMARY KEY ("Package ID")
);

CREATE TABLE "Customer" (
  "Customer ID" INT AUTO_INCREMENT,
  "User ID" INT,
  "Membership ID" INT Default NULL,
  PRIMARY KEY ("Customer ID"),
  CONSTRAINT "FK_Customer.User ID"
    Foreign Key ("User ID") 
    REFERENCES "User"("User ID"),
  CONSTRAINT "FK_Customer.Membership ID"
    Foreign Key ("Membership ID") 
    REFERENCES "Membership"("Membership ID")
);

CREATE TABLE "Membership" (
  "Customer ID" INT,
  "Package ID" TINYINT,
  "Date Started" DATETIME,
  PRIMARY KEY ("Customer ID"),
  CONSTRAINT "FK_Membership.Customer ID"
    Foreign Key ("Customer ID") 
    REFERENCES "Customer"("Customer ID"),
  CONSTRAINT "FK_Membership.Package ID"
    Foreign Key ("Package ID") 
    REFERENCES "Package"("Package ID"),
);

CREATE TABLE "Staff" (
  "Staff ID" INT AUTO_INCREMENT,
  "User ID" INT,
  "Role ID" INT,
  "Branch ID" TINYINT,
  PRIMARY KEY ("Staff ID"),
  CONSTRAINT "FK_Staff.User ID"
    Foreign Key ("User ID") 
    REFERENCES "User"("User ID"),
  CONSTRAINT "FK_Staff.Role ID"
    Foreign Key ("Role ID") 
    REFERENCES "Role"("Role ID"),
  CONSTRAINT "FK_Staff.Branch ID"
    Foreign Key ("Branch ID") 
    REFERENCES "Branch"("Branch ID"),
);

CREATE TABLE "Equipment" (
  "Equipment ID" INT AUTO_INCREMENT,
  "Name" VARCHAR(255),
  "Purchase Date" DATETIME,
  "Company ID" INT,
  "Equipment Details" VARCHAR(255),
  "Equipment Type" ENUM (Legs, Arms, Chest, Cardio, Back, Deltoids),
  "Branch ID" TINYINT,
  PRIMARY KEY ("Equipment ID"),
  CONSTRAINT "FK_Equipment.Branch ID"
    FOREIGN KEY ("Branch ID")
    REFERENCES "Branch"("Branch ID"),
  CONSTRAINT "FK_Equipment.Company ID"
    FOREIGN KEY ("Company ID")
    REFERENCES "Company"("Company ID")
);

CREATE TABLE "Equipment Company" (
  "Company ID" INT AUTO_INCREMENT,
  "Name" VARCHAR(255),
  "Phone Number" VARCHAR(15),
  PRIMARY KEY ("Company ID")
);
