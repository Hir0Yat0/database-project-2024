CREATE OR REPLACE FUNCTION "select_package_by_id"(package_id INT)
RETURNS SETOF "Package" AS
$$
BEGIN
    RETURN QUERY SELECT * FROM "Package" WHERE "Package ID" = package_id;
END;
$$ LANGUAGE PLPGSQL;
