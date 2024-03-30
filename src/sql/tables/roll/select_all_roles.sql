CREATE OR REPLACE FUNCTION "select_all_roles"()
RETURNS SETOF "Role" AS
$$
BEGIN
    RETURN QUERY SELECT * FROM "Role";
END;
$$ LANGUAGE PLPGSQL;

SELECT select_all_roles();

