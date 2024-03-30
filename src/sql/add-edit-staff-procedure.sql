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

CREATE OR REPLACE PROCEDURE edit_staff(
    IN user_id INT,
    IN staff_id INT,
    IN username VARCHAR(255),
    IN email VARCHAR(255),
    IN first_name VARCHAR(255),
    IN last_name VARCHAR(255),
    IN phone_number VARCHAR(15),
    IN password VARCHAR(255),
    IN role_id INT,
    IN branch_id INT,
    INOUT status_code INT
) AS
$$
BEGIN
    -- Update user details
    UPDATE public."User"
    SET
        "Username" = username,
        "Email" = email,
        "First Name" = first_name,
        "Last Name" = last_name,
        "Phone Number" = phone_number,
        "Password" = password
    WHERE
        "User ID" = user_id;

    -- Update staff details
    UPDATE public."Staff"
    SET
        "Role ID" = role_id,
        "Branch ID" = branch_id
    WHERE
        "Staff ID" = staff_id;

    -- Set status_code to 0 indicating success
    status_code := 0;
END;
$$ LANGUAGE plpgsql;

CALL edit_staff(3, 6, 'Anish again', 'anish@anish.anish', 'anish', 'anish', '000-000-0000', 'hardpassword', 1, 1, 0);


