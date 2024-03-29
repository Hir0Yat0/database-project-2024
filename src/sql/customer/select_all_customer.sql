CREATE OR REPLACE FUNCTION "select_all_customer"()
RETURNS SETOF "Customer" AS
$$
BEGIN
    RETURN QUERY SELECT * FROM "Customer";
END;
$$ LANGUAGE PLPGSQL;

SELECT "select_all_customer"();
