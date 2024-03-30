CREATE OR REPLACE FUNCTION getAllRoles()
RETURNS TABLE("Role ID" int, "Role Name" varchar)
AS
$$
BEGIN
    RETURN QUERY
    SELECT * FROM public."Role";
END;
$$ LANGUAGE plpgsql;

SELECT getAllRoles();


CREATE OR REPLACE PROCEDURE add_staff(IN username VARCHAR(255), IN email VARCHAR(255),
                                      IN first_name VARCHAR(255), IN last_name VARCHAR(255), IN phone_number VARCHAR(15),
                                      password IN VARCHAR(255), IN role_id INT, IN branch_id INT, INOUT status_code INT) AS
$$
DECLARE
    temp_user_id INT; -- Temporary variable to hold the new user id
BEGIN
    INSERT INTO public."User"("Username", "Email", "First Name", "Last Name", "Phone Number", "User Type",
                              "Password", "Billing ID") VALUES (username, email, first_name, last_name, phone_number,
                                                                'Staff', password, NULL)
    RETURNING "User ID" INTO temp_user_id;
    INSERT INTO public."Staff"("User ID", "Role ID", "Branch ID") VALUES (temp_user_id, role_id, branch_id);
    COMMIT;

    status_code := 0; -- Assigning 0 to status_code
END;
$$ LANGUAGE plpgsql;

CALL add_staff('anish', 'anish@anish.anish', 'anish', 'anish', '000-000-0000', 'hardpassword', 1, 1, 0);

CREATE OR REPLACE PROCEDURE add_company(IN name VARCHAR(255), IN phone_number VARCHAR(15), INOUT status_code INT) AS
$$
BEGIN
    INSERT INTO public."Equipment Company"("Name", "Phone Number") VALUES (name, phone_number);
    COMMIT;

    status_code := 0; -- Assigning 0 to status_code
END;
$$ LANGUAGE plpgsql;

CALL add_company('Cool Company', '555-555-6666', 0);

CREATE OR REPLACE PROCEDURE edit_company(IN company_id INT, IN name VARCHAR(255), IN phone_number VARCHAR(15), INOUT status_code INT) AS
$$
BEGIN
    UPDATE public."Equipment Company"
        SET "Name" = name,
            "Phone Number" = phone_number
        WHERE "Company ID" = company_id;
    COMMIT;
    status_code := 0; -- Assigning 0 to status_code
END;
$$ LANGUAGE plpgsql;

CALL edit_company(3, 'Cooler Company', '555-555-6666', 0);
