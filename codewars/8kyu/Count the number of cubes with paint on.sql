--# write your SQL statement here:
-- you are given a table 'squares' with column 'n' (numer of cubes).
-- return a table with:
--   this column and your result in a column named 'res'
SELECT n,
CAST (POWER(n+1, 3) -
CASE WHEN n = 0
THEN 0
ELSE POWER(n-1, 3)
END as int) as res
FROM squares;
