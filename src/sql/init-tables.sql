CREATE TABLE Billing (
  "Billing ID" SERIAL PRIMARY KEY,
  "Card Number" VARCHAR(16),
  "Expiry" TIMESTAMP,
  "First Name" VARCHAR(255),
  "Last Name" VARCHAR(255),
  "Monthly Amount" DECIMAL(10, 2),
  "Billing Date" TIMESTAMP
);

CREATE TABLE "User" (
  "User ID" SERIAL PRIMARY KEY,
  "Username" VARCHAR(255),
  "Email" VARCHAR(255),
  "First Name" VARCHAR(255),
  "Last Name" VARCHAR(255),
  "Phone Number" VARCHAR(15),
  "User Type" VARCHAR(10),
  "Password" VARCHAR(255),
  "Billing ID" INT REFERENCES Billing ("Billing ID")
);

CREATE TABLE Role (
  "Role ID" SERIAL PRIMARY KEY,
  "Role Name" VARCHAR(255)
);

CREATE TABLE Branch (
  "Branch ID" SERIAL PRIMARY KEY,
  "Address" VARCHAR(255)
);

CREATE TABLE Package (
  "Package ID" SERIAL PRIMARY KEY,
  "Price" DECIMAL(10, 2),
  "Package Tier" VARCHAR(10)
);

CREATE TABLE Customer (
  "Customer ID" SERIAL PRIMARY KEY,
  "User ID" INT REFERENCES "User" ("User ID"),
  "Membership ID" INT,
  CONSTRAINT "FK_Customer.Membership ID" FOREIGN KEY ("Membership ID") REFERENCES Membership ("Membership ID")
);

CREATE TABLE Membership (
  "Membership ID" SERIAL PRIMARY KEY,
  "Customer ID" INT REFERENCES Customer ("Customer ID"),
  "Package ID" INT REFERENCES Package ("Package ID"),
  "Date Started" TIMESTAMP
);

CREATE TABLE Staff (
  "Staff ID" SERIAL PRIMARY KEY,
  "User ID" INT REFERENCES "User" ("User ID"),
  "Role ID" INT REFERENCES Role ("Role ID"),
  "Branch ID" INT REFERENCES Branch ("Branch ID")
);

CREATE TABLE Equipment (
  "Equipment ID" SERIAL PRIMARY KEY,
  "Name" VARCHAR(255),
  "Purchase Date" TIMESTAMP,
  "Company ID" INT REFERENCES "Equipment Company" ("Company ID"),
  "Equipment Details" VARCHAR(255),
  "Equipment Type" VARCHAR(10),
  "Branch ID" INT REFERENCES Branch ("Branch ID")
);

CREATE TABLE "Equipment Company" (
  "Company ID" SERIAL PRIMARY KEY,
  "Name" VARCHAR(255),
  "Phone Number" VARCHAR(15)
);
