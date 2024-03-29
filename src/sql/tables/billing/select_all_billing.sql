CREATE OR REPLACE FUNCTION "select_all_billing"()
RETURNS SETOF "Billing" AS
$$
BEGIN
    RETURN QUERY SELECT * FROM "Billing";
END;
$$ LANGUAGE PLPGSQL;

SELECT select_all_billing();
