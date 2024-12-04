-- # write your SQL statement here: you are given a table 'oddcount' with column 'n', return a table with column 'n' and your result in a column named 'res'.
SELECT n,
CAST(FLOOR(n/2) as bigint) as res
FROM oddcount;
