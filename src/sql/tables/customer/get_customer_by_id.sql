CREATE OR REPLACE FUNCTION "get_customer_by_id"(customer_id INT)
RETURNS SETOF "Customer" AS
$$
BEGIN
    RETURN QUERY SELECT * FROM "Customer" WHERE "Customer ID" = customer_id;
END;
$$ LANGUAGE PLPGSQL;

SELECT select_all_customer();
SELECT get_customer_by_id(2);
SELECT select_all_customer();
