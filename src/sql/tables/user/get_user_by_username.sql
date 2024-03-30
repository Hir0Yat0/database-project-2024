CREATE OR REPLACE FUNCTION "get_user_by_username"(username VARCHAR(255))
RETURNS SETOF "User" AS
$$
BEGIN
    RETURN QUERY SELECT * FROM "User" WHERE "Username" LIKE username;
END;
$$ LANGUAGE PLPGSQL;

SELECT get_user_by_username('user1');
