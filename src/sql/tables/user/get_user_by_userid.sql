CREATE OR REPLACE FUNCTION "get_user_by_userid"(userid INT)
RETURNS SETOF "User" AS
$$
BEGIN
    RETURN QUERY SELECT * FROM "User" WHERE "User ID" = userid;
END;
$$ LANGUAGE PLPGSQL;

SELECT get_user_by_userid(1);
SELECT get_user_by_userid(2);
SELECT get_user_by_userid(3);
SELECT get_user_by_userid(4);
SELECT get_user_by_userid(5);
