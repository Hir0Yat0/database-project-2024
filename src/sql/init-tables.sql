
-- Drop existing tables if they exist
drop table if exists "Role" cascade;

drop table if exists membership cascade;

drop table if exists package cascade;

drop table if exists customer cascade;

drop table if exists "User" cascade;

drop table if exists billing cascade;

drop table if exists "Equipment Type" cascade;

drop table if exists branch cascade;

drop table if exists staff cascade;

drop table if exists "Equipment Company" cascade;


-- Create Billing table
CREATE TABLE "Billing" (
  "Billing ID" SERIAL PRIMARY KEY,
  "Card Number" VARCHAR(16),
  "Expiry" TIMESTAMP,
  "First Name" VARCHAR(255),
  "Last Name" VARCHAR(255),
  "Monthly Amount" DECIMAL(10, 2),
  "Billing Date" TIMESTAMP
);

-- Create User table
CREATE TABLE "User" (
  "User ID" SERIAL PRIMARY KEY,
  "Username" VARCHAR(255),
  "Email" VARCHAR(255),
  "First Name" VARCHAR(255),
  "Last Name" VARCHAR(255),
  "Phone Number" VARCHAR(15),
  "User Type" VARCHAR(20),
  "Password" VARCHAR(255),
  "Billing ID" INT,
  FOREIGN KEY ("Billing ID") REFERENCES "Billing" ("Billing ID")
);


-- Create Role table
CREATE TABLE "Role" (
  "Role ID" SERIAL PRIMARY KEY,
  "Role Name" VARCHAR(255)
);

-- Create Package table
CREATE TABLE "Package" (
  "Package ID" SERIAL PRIMARY KEY,
  "Price" DECIMAL(10,2),
  "Package Name" VARCHAR(255)
);

-- Create Customer table
CREATE TABLE "Customer" (
  "Customer ID" SERIAL PRIMARY KEY,
  "User ID" INT,
  "Membership ID" INT DEFAULT NULL,
  FOREIGN KEY ("User ID") REFERENCES "User" ("User ID")
);

-- Create Membership table
CREATE TABLE "Membership" (
  "Membership ID" SERIAL PRIMARY KEY,
  "Customer ID" INT,
  "Package ID" INT,
  "Date Started" TIMESTAMP,
  FOREIGN KEY ("Customer ID") REFERENCES "Customer" ("Customer ID"),
  FOREIGN KEY ("Package ID") REFERENCES "Package" ("Package ID")
);

CREATE TABLE "Staff" (
  "Staff ID" SERIAL PRIMARY KEY,
  "User ID" INT,
  "Role ID" INT,
  "Branch ID" INT,
  FOREIGN KEY ("User ID") REFERENCES "User" ("User ID"),
  FOREIGN KEY ("Role ID") REFERENCES "Role" ("Role ID"),
  FOREIGN KEY ("Branch ID") REFERENCES "Branch" ("Branch ID")

-- Create Equipment Type table
CREATE TABLE "Equipment Type" (
  "ID" SERIAL PRIMARY KEY,
  "Name" VARCHAR(255) UNIQUE
);

-- Create Branch table
CREATE TABLE "Branch" (
  "Branch ID" SERIAL PRIMARY KEY,
  "Address" VARCHAR(255),
);

CREATE TABLE "Manage" (
  "Branch ID" SERIAL PRIMARY KEY,
  "Manager ID" INT,
  FOREIGN KEY ("Branch ID") REFERENCES "Branch" ("Branch ID"),
  FOREIGN KEY ("Manager ID") REFERENCES "Staff" ("Staff ID")
);

-- Create Equipment Company table
CREATE TABLE "Equipment Company" (
  "Company ID" SERIAL PRIMARY KEY,
  "Name" VARCHAR(255),
  "Phone Number" VARCHAR(15)
);

-- Create Equipment table
CREATE TABLE "Equipment" (
  "Equipment ID" SERIAL PRIMARY KEY,
  "Name" VARCHAR(255),
  "Purchase Date" TIMESTAMP,
  "Company ID" INT,
  "Equipment Details" VARCHAR(255),
  "Equipment Type ID" VARCHAR(255),
  "Branch ID" INT,
  FOREIGN KEY ("Company ID") REFERENCES "Equipment Company" ("Company ID"),
  FOREIGN KEY ("Equipment Type ID") REFERENCES "Equipment Type" ("ID"),
  FOREIGN KEY ("Branch ID") REFERENCES "Branch" ("Branch ID")
);
