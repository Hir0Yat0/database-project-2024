CREATE OR REPLACE FUNCTION "get_membership_by_customer_id"(customer_id INT)
RETURNS SETOF "Membership" AS
$$
BEGIN
    RETURN QUERY SELECT * FROM "Membership" WHERE "Customer ID" = customer_id;
END;
$$ LANGUAGE PLPGSQL;
