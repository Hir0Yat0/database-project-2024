CREATE OR REPLACE PROCEDURE "create_billing_details"(
    card_number VARCHAR(16),
    expiry TIMESTAMP,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    monthly_amount NUMERIC,
    billing_date TIMESTAMP
    )
AS
$$
BEGIN
    INSERT INTO public."Billing"(
        "Card Number",
        "Expiry",
        "First Name",
        "Last Name",
        "Monthly Amount",
        "Billing Date"
    )
    VALUES(
        card_number,
        expiry,
        first_name,
        last_name,
        monthly_amount,
        billing_date
    );
    COMMIT;
END;
$$ LANGUAGE PLPGSQL;

CALL create_billing_details('123-456-789-0','2023-01-01 00:00:00.000000','firstname1','lastname1',69.690,'2023-01-01 00:00:00.000000');
SELECT select_all_billing();
