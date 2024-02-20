SELECT CASE
        WHEN patient_id % 2 = 0 THEN 'Yes'
        ELSE 'No'
    END AS has_insurance,
    SUM(
        CASE
            WHEN patient_id % 2 = 0 THEN 10
            ELSE 50
        END
    ) AS admission_total_cost
FROM admissions
GROUP BY has_insurance;