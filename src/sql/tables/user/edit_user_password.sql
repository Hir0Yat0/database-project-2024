CREATE OR REPLACE PROCEDURE "edit_user_password"(userid INT, new_password VARCHAR(255))
AS
$$
BEGIN
    UPDATE public."User"
    SET 
        "Password" = new_password
    WHERE "User ID" = userid;
    COMMIT;
END;
$$ LANGUAGE PLPGSQL;

edit
