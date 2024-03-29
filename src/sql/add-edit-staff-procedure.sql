CREATE OR REPLACE FUNCTION getAllRoles()
RETURNS TABLE("Role ID" int, "Role Name" varchar)
AS
$$
BEGIN
    RETURN QUERY
    SELECT * FROM public."Role";
END;
$$ LANGUAGE plpgsql;

SELECT getAllRoles();