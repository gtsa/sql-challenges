-- Create your SELECT statement here
SELECT p.*, c.name as company_name
FROM products p LEFT JOIN companies c
ON p.company_id = c.id;
