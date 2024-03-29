CREATE OR REPLACE FUNCTION select_all_branch()
RETURNS SETOF "Branch" AS
$$
BEGIN
    RETURN QUERY SELECT * FROM "Branch";
END;
$$ LANGUAGE PLPGSQL;

SELECT select_all_branch();
