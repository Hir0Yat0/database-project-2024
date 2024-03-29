<<<<<<< HEAD
=======
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
>>>>>>> 1401ac7231f4dbdb64331a9249005059b05b6ecd
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

<<<<<<< HEAD
=======
-- Create Role table

CREATE TABLE "Role" (
>>>>>>> 1401ac7231f4dbdb64331a9249005059b05b6ecd
  "Role ID" SERIAL PRIMARY KEY,
  "Role Name" VARCHAR(255)
);

<<<<<<< HEAD
=======
-- Create Package table
CREATE TABLE "Package" (
>>>>>>> 1401ac7231f4dbdb64331a9249005059b05b6ecd
  "Package ID" SERIAL PRIMARY KEY,
  "Price" DECIMAL(10,2),
  "Package Name" VARCHAR(255)
);

<<<<<<< HEAD
=======
-- Create Customer table
CREATE TABLE "Customer" (
>>>>>>> 1401ac7231f4dbdb64331a9249005059b05b6ecd
  "Customer ID" SERIAL PRIMARY KEY,
  "User ID" INT,
  "Membership ID" INT DEFAULT NULL,
  FOREIGN KEY ("User ID") REFERENCES "User" ("User ID")
);

<<<<<<< HEAD
=======
-- Create Membership table
CREATE TABLE "Membership" (
>>>>>>> 1401ac7231f4dbdb64331a9249005059b05b6ecd
  "Membership ID" SERIAL PRIMARY KEY,
  "Customer ID" INT,
  "Package ID" INT,
  "Date Started" TIMESTAMP,
  FOREIGN KEY ("Customer ID") REFERENCES "Customer" ("Customer ID"),
  FOREIGN KEY ("Package ID") REFERENCES "Package" ("Package ID")
);

<<<<<<< HEAD
CREATE TABLE "Staff" (
  "Staff ID" SERIAL PRIMARY KEY,
  "User ID" INT,
  "Role ID" INT,
  "Branch ID" INT,
  FOREIGN KEY ("User ID") REFERENCES "User" ("User ID"),
  FOREIGN KEY ("Role ID") REFERENCES Role ("Role ID"),
  FOREIGN KEY ("Branch ID") REFERENCES "Branch" ("Branch ID")
=======

-- Create Equipment Type table
CREATE TABLE "Equipment Type" (
  "ID" SERIAL PRIMARY KEY,
  "Name" VARCHAR(255) UNIQUE
);

<<<<<<< HEAD
=======
-- Create Branch table
CREATE TABLE "Branch" (
>>>>>>> 1401ac7231f4dbdb64331a9249005059b05b6ecd
  "Branch ID" SERIAL PRIMARY KEY,
  "Address" VARCHAR(255),
  "Manager ID" INT,
  FOREIGN KEY ("Manager ID") REFERENCES "Staff" ("Staff ID")
);

<<<<<<< HEAD
=======
-- Create Equipment Company table
CREATE TABLE "Equipment Company" (
  "Company ID" SERIAL PRIMARY KEY,
  "Name" VARCHAR(255),
  "Phone Number" VARCHAR(15)
);

-- Create Equipment table
CREATE TABLE "Equipment" (
>>>>>>> 1401ac7231f4dbdb64331a9249005059b05b6ecd
  "Equipment ID" SERIAL PRIMARY KEY,
  "Name" VARCHAR(255),
  "Purchase Date" TIMESTAMP,
  "Company ID" INT,
  "Equipment Details" VARCHAR(255),
  "Equipment Type ID" VARCHAR(255),
  "Branch ID" INT,
  FOREIGN KEY ("Company ID") REFERENCES "Equipment Company" ("Company ID"),
<<<<<<< HEAD
  FOREIGN KEY ("Equipment Type ID") REFERENCES "Equipment Type" ("ID"),
  FOREIGN KEY ("Branch ID") REFERENCES "Branch" ("Branch ID")
=======
>>>>>>> 1401ac7231f4dbdb64331a9249005059b05b6ecd
);
