CREATE OR REPLACE FUNCTION "get_member_ship_by_membership_id"(membership_id Int)
RETURNS SETOF "Membership" AS
$$
BEGIN
    RETURN QUERY SELECT * FROM "Membership" WHERE "Membership ID" = membership_id;
END;
$$ LANGUAGE PLPGSQL;
