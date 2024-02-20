SELECT pn.province_name
FROM patients p
    JOIN province_names pn ON p.province_id = pn.province_id
GROUP BY province_name
HAVING SUM(
        CASE
            WHEN gender = 'M' THEN 1
            ELSE 0
        END
    ) > SUM(
        CASE
            WHEN gender = 'F' THEN 1
            ELSE 0
        END
    );