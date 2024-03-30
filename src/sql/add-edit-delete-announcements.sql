CREATE OR REPLACE PROCEDURE add_announcement(IN details VARCHAR(255), INOUT status_code INT) AS
$$
BEGIN
    INSERT INTO public."Announcements"("Details") VALUES (details);
    COMMIT;
    status_code := 0; -- Assigning 0 to status_code
END;
$$ LANGUAGE plpgsql;

CALL add_announcement('New announcement', 0);

CREATE OR REPLACE PROCEDURE edit_announcement(
    IN announcement_id INT,
    IN details VARCHAR(255),
    INOUT status_code INT
) AS
$$
BEGIN
    UPDATE public."Announcements"
    SET "Details" = details
    WHERE "ID" = announcement_id;
    COMMIT;
    -- Set status_code to 0 indicating success
    status_code := 0;
END;
$$ LANGUAGE plpgsql;

CALL edit_announcement(4, 'Updated announcement', 0);

CREATE OR REPLACE PROCEDURE delete_announcement(
    IN announcement_id INT,
    INOUT status_code INT
) AS
$$
BEGIN
    DELETE FROM public."Announcements"
    WHERE "ID" = announcement_id;
    COMMIT;
    -- Set status_code to 0 indicating success
    status_code := 0;
END;
$$ LANGUAGE plpgsql;

CALL delete_announcement(4, 0);

CREATE OR REPLACE FUNCTION get_all_announcements()
RETURNS SETOF "Announcements" AS
$$
    SELECT * FROM "Announcements";
$$ LANGUAGE SQL;

SELECT get_all_announcements();