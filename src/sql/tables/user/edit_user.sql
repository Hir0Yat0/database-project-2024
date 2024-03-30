CREATE OR REPLACE PROCEDURE "edit_user"(
    userid INT,
    new_username VARCHAR(255),
    new_email VARCHAR(255),
    new_first_name VARCHAR(255),
    new_last_name VARCHAR(255),
    new_phone_number VARCHAR(15),
    new_user_type VARCHAR(20)
)
AS
$$
BEGIN
    UPDATE public."User"
    SET
        "Username" = new_username,
        "Email" = new_email,
        "First Name" = new_first_name,
        "Last Name" = new_last_name,
        "Phone Number" = new_phone_number,
        "User Type" = new_user_type
    WHERE "User ID" = userid;
    COMMIT;
END;
$$ LANGUAGE PLPGSQL;

SELECT get_user_by_userid(4);
CALL edit_user(4,'user11','user11@gmail.com','user11@firstname','user11@lastname','012356789','Customer');
SELECT get_user_by_userid(4);