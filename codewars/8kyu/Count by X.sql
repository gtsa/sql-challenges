-- # write your SQL statement here:
-- you are given a table 'counter' with columns 'x' (int) and 'n' (int)
-- return a query with columns 'x', 'n' and your result in a column named 'res' (array)
-- sort results by column 'x' ascending, then by 'n' ascending
-- note that each pair of 'x' and 'n' in 'counter' is unique
SELECT
    x,
    n,
    ARRAY(select x * generate_series(1, n)) AS res
FROM counter
ORDER BY x, n;
