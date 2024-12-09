SELECT
    id,
    CASE
        WHEN desired_height <= up_speed THEN 1
        ELSE CAST((CEILING((desired_height - up_speed) * 1.0 / (up_speed - down_speed)) + 1) as int)
    END AS num_days
FROM growing_plant;
