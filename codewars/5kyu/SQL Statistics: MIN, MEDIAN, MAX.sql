-- Create your SELECT statement here
SELECT
  MIN(score),
  (SELECT AVG(score)::FLOAT
   FROM
    (SELECT score
    FROM result
    ORDER BY score
    LIMIT (CASE
            WHEN (SELECT COUNT(1) FROM result) % 2 = 0 THEN 2
            ELSE 1
          END)
    OFFSET ((SELECT COUNT(1) FROM result)/2 - 1)) as meds) as median,
  MAX(score)
FROM result;
