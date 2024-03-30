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

CREATE OR REPLACE PROCEDURE delete_company(
    IN company_id INT,
    INOUT status_code INT
) AS
$$
BEGIN
    -- Delete from Equipment Company table
    DELETE FROM public."Equipment Company"
    WHERE "Company ID" = company_id;
    COMMIT;
    -- Set status_code to 0 indicating success
    status_code := 0;
END;
$$ LANGUAGE plpgsql;

CALL delete_company(3, 0);
