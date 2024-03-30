CREATE OR REPLACE FUNCTION "get_all_user_info_except_password"()
RETURNS TABLE("User ID" INT,
            "Username" VARCHAR, 
            "Email" VARCHAR, 
            "First Name" VARCHAR, 
            "Last Name" VARCHAR, 
            "Phone Number" VARCHAR, 
            "User Type" VARCHAR, 
            "Billing ID" INT) 
            AS
$$
BEGIN
    RETURN QUERY 
    SELECT "User"."User ID","User"."Username", "User"."Email", "User"."First Name", "User"."Last Name", "User"."Phone Number", "User"."User Type", "User"."Billing ID" 
    FROM "User";
END;
$$ LANGUAGE PLPGSQL;

SELECT get_all_user_info_except_password();
