CREATE OR REPLACE PROCEDURE "create_user"(IN username VARCHAR(255), IN email VARCHAR(255),
                                      IN first_name VARCHAR(255), IN last_name VARCHAR(255), IN phone_number VARCHAR(15),
                                      IN user_type VARCHAR(20),
                                      IN password VARCHAR(255), IN billing_id INT) AS
$$

BEGIN
    INSERT INTO public."User"("Username", "Email", "First Name", "Last Name", "Phone Number", "User Type",
                              "Password", "Billing ID") VALUES (username, email, first_name, last_name, phone_number,
                                                                user_type, password, billing_id);
    COMMIT;
END;
$$ LANGUAGE PLPGSQL;

CALL create_user('user1','user1@gmail.com','user1firstname','user1lastname','0123456789','Customer','$pass1:hashed:salted^$',1);
SELECT select_all_users();
