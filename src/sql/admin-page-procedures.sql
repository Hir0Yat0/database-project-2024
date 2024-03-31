CREATE OR REPLACE FUNCTION getAllBranches()
RETURNS SETOF "Branch" AS
$$
    SELECT * FROM "Branch";
$$ LANGUAGE SQL;

SELECT getAllBranches();

CREATE OR REPLACE FUNCTION getAllUsers()
RETURNS SETOF "User" AS
$$
    SELECT * FROM "User";
$$ LANGUAGE SQL;

SELECT getAllUsers();

CREATE OR REPLACE PROCEDURE add_branch(
    IN address VARCHAR(255),
    INOUT status_code INT
) AS
$$
BEGIN
    INSERT INTO public."Branch"("Address") VALUES (address);
    COMMIT;
    -- Set status_code to 0 indicating success
    status_code := 0;
END;
$$ LANGUAGE plpgsql;

CALL add_branch('Test Address', 0);

CREATE OR REPLACE PROCEDURE delete_branch(
    IN branch_id INT,
    INOUT status_code INT
) AS
$$
BEGIN
    -- Delete from Equipment Type table
    DELETE FROM public."Branch"
    WHERE "Branch ID" = branch_id;
    COMMIT;
    -- Set status_code to 0 indicating success
    status_code := 0;
END;
$$ LANGUAGE plpgsql;

CALL delete_branch(4, 0);

CREATE OR REPLACE PROCEDURE edit_branch(
    IN branch_id INT,
    IN address VARCHAR(255),
    INOUT status_code INT
) AS
$$
BEGIN
    -- Update Branch table
    UPDATE public."Branch"
    SET "Address" = address
    WHERE "Branch ID" = branch_id;
    COMMIT;

    -- Set status_code to 0 indicating success
    status_code := 0;
END;
$$ LANGUAGE plpgsql;

CALL edit_branch(1, '123 Main St', 0);

