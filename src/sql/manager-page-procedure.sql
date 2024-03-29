CREATE OR REPLACE FUNCTION getAllEmployeesForBranch("branch id" INT)
RETURNS TABLE("Staff ID" int, "User ID" int, "Role ID" int,
              "Branch ID" int, "Username" varchar, "Email" varchar,
              "First Name" varchar, "Last Name" varchar, "Phone Number" varchar,
              "User Type" varchar, Password varchar, "Billing ID" int)
AS
$$
BEGIN
    RETURN QUERY
    SELECT a."Staff ID", b."User ID", a."Role ID", a."Branch ID",
           b."Username", b."Email", b."First Name", b."Last Name",
           b."Phone Number", b."User Type", b."Password", b."Billing ID"
    FROM public."Staff" a
    INNER JOIN public."User" b ON a."User ID" = b."User ID"
    WHERE a."Branch ID" = "branch id";
END;
$$ LANGUAGE plpgsql;


SELECT getAllEmployeesForBranch(1);

CREATE OR REPLACE FUNCTION getAllEquipmentForBranch("branch id" INT)
RETURNS TABLE("Equipment ID" int, "Equipment Name" varchar, "Purchase Date" timestamp,
              "Equipment Details" varchar, "Equipment Type Name" varchar, "Company Name" varchar,
              "Company Phone Number" varchar)
AS
$$
BEGIN
    RETURN QUERY
    SELECT c."ID", c."Equipment Name", c."Purchase Date", c."Equipment Details", c."Equipment Type Name",
           d."Name" as "Company Name", "Phone Number"
    FROM (
        SELECT *, b."Name" as "Equipment Type Name", a."Name" as "Equipment Name"
        FROM public."Equipment" a
        INNER JOIN public."Equipment Type" b ON a."Equipment Type ID" = b."ID"
         ) c
    INNER JOIN "Equipment Company" d ON c."Company ID" = d."Company ID"
    WHERE c."Branch ID" = "branch id";
END;
$$ LANGUAGE plpgsql;

SELECT getAllEquipmentForBranch(1);

CREATE OR REPLACE FUNCTION getAllCompaniesForBranch("branch id" INT)
RETURNS TABLE("Company Name" varchar, "Phone Number" varchar)
AS
$$
BEGIN
    RETURN QUERY
    SELECT d."Name" as "Company Name", d."Phone Number"
    FROM (
        SELECT *, b."Name" as "Equipment Type Name", a."Name" as "Equipment Name"
        FROM public."Equipment" a
        INNER JOIN public."Equipment Type" b ON a."Equipment Type ID" = b."ID"
         ) c
    INNER JOIN "Equipment Company" d ON c."Company ID" = d."Company ID"
    WHERE c."Branch ID" = "branch id";
END;
$$ LANGUAGE plpgsql;

SELECT getAllCompaniesForBranch(1);