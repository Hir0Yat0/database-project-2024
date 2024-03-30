CREATE OR REPLACE FUNCTION "get_user_by_username_and_password"(username_passed VARCHAR,password_passed VARCHAR)
RETURNS SETOF "User" AS
$$
BEGIN
    RETURN QUERY 
    SELECT * FROM "User"
    WHERE "Username" LIKE username_passed
    AND "Password" LIKE password_passed;
END;
$$ LANGUAGE PLPGSQL;

SELECT get_user_by_username_and_password('john_doe','password123');
