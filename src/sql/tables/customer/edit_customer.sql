CREATE OR REPLACE PROCEDURE "edit_customer"(
    customer_id INT,
    new_user_id INT,
    new_membership_id INT
)
AS
$$
BEGIN
    UPDATE public."Customer"
    SET
        "Membership ID" = new_membership_id,
        "User ID" = new_user_id
    WHERE "Customer ID" = customer_id;
    COMMIT;
END;
$$ LANGUAGE PLPGSQL;

SELECT select_all_customer();
CALL edit_customer(2,1,2);
SELECT select_all_customer();
