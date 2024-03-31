CREATE OR REPLACE FUNCTION get_all_companies()
RETURNS SETOF "Equipment Company" AS
$$
    SELECT * FROM "Equipment Company";
$$ LANGUAGE SQL;

SELECT get_all_companies();

CREATE OR REPLACE FUNCTION get_all_equipment_types()
RETURNS SETOF "Equipment Type" AS
$$
    SELECT * FROM "Equipment Type";
$$ LANGUAGE SQL;

SELECT get_all_equipment_types();

CREATE OR REPLACE PROCEDURE add_equipment(
    IN equipment_name VARCHAR(255),
    IN purchase_date TIMESTAMP,
    IN company_id INT,
    IN equipment_details VARCHAR(255),
    IN equipment_type_id INT,
    IN branch_id INT,
    INOUT status_code INT
) AS
$$
BEGIN
    INSERT INTO public."Equipment"("Name", "Purchase Date", "Company ID", "Equipment Details",
                                   "Equipment Type ID", "Branch ID") VALUES (equipment_name, purchase_date, company_id,
                                                                             equipment_details, equipment_type_id,
                                                                             branch_id);
    -- Set status_code to 0 indicating success
    COMMIT;
    status_code := 0;
END;
$$ LANGUAGE plpgsql;

CALL add_equipment('Treadmill 2','2023-01-01 00:00:00.000000',1,
                   'High-quality treadmill',
                   1,1, 0);

CREATE OR REPLACE PROCEDURE edit_equipment(
    IN equipment_id INT,
    IN equipment_name VARCHAR(255),
    IN purchase_date TIMESTAMP,
    IN company_id INT,
    IN equipment_details VARCHAR(255),
    IN equipment_type_id INT,
    IN branch_id INT,
    INOUT status_code INT
) AS
$$
BEGIN
    UPDATE public."Equipment"
    SET "Name" = equipment_name,
        "Purchase Date" = purchase_date,
        "Company ID" = company_id,
        "Equipment Details" = equipment_details,
        "Equipment Type ID" = equipment_type_id,
        "Branch ID" = branch_id
    WHERE "Equipment ID" = equipment_id;
    COMMIT;
    -- Set status_code to 0 indicating success
    status_code := 0;
END;
$$ LANGUAGE plpgsql;

CALL edit_equipment(5, 'Treadmill 2','2023-01-01 00:00:00.000000',1,
                   'Highest-quality treadmill',
                   1,1, 0);

CREATE OR REPLACE PROCEDURE delete_equipment(
    IN equipment_id INT,
    INOUT status_code INT
) AS
$$
BEGIN
    DELETE FROM public."Equipment"
    WHERE "Equipment ID" = equipment_id;
    COMMIT;
    -- Set status_code to 0 indicating success
    status_code := 0;
END;
$$ LANGUAGE plpgsql;

CALL delete_equipment(5, 0);

CREATE OR REPLACE PROCEDURE add_equipment_type(
    IN name VARCHAR(255),
    INOUT status_code INT
) AS
$$
BEGIN
    INSERT INTO public."Equipment Type"("Name") VALUES (name);
    COMMIT;
    -- Set status_code to 0 indicating success
    status_code := 0;
END;
$$ LANGUAGE plpgsql;

CALL add_equipment_type('Cardio', 0);

CREATE OR REPLACE PROCEDURE delete_equipment_type(
    IN type_id INT,
    INOUT status_code INT
) AS
$$
BEGIN
    -- Delete from Equipment Type table
    DELETE FROM public."Equipment Type"
    WHERE "ID" = type_id;
    COMMIT;
    -- Set status_code to 0 indicating success
    status_code := 0;
END;
$$ LANGUAGE plpgsql;

CALL delete_equipment_type(5, 0);
