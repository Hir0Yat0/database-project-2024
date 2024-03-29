CREATE OR REPLACE FUNCTION "select_all_users" () 
RETURNS SETOF "User" AS
$$
    BEGIN

        RETURN QUERY SELECT * FROM "User";

    END;
$$ LANGUAGE PLPGSQL;

SELECT select_all_users();
