CREATE OR REPLACE PROCEDURE "edit_billing_details"(
    billing_id INT,
    new_card_number VARCHAR(16),
    new_expiry TIMESTAMP,
    new_first_name VARCHAR(255),
    new_last_name VARCHAR(255),
    new_monthly_amount NUMERIC,
    new_billing_date TIMESTAMP
)
AS
$$
BEGIN
    UPDATE "Billing"
    SET
        "Card Number" = new_card_number,
        "Expiry" = new_expiry,
        "First Name" = new_first_name,
        "Last Name" = new_last_name,
        "Monthly Amount" = new_monthly_amount,
        "Billing Date" = new_billing_date
    WHERE "Billing ID" = billing_id;
    COMMIT;
END;
$$ LANGUAGE PLPGSQL;

SELECT select_all_billing();
CALL edit_billing_details(3,'123-456-789-0','2023-01-01 00:00:00','firstname1','lastname1',69.69,'2023-01-01 00:00:01');
SELECT select_all_billing();
