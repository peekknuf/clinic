SELECT patient_id,
    weight,
    height,
    CASE
        WHEN weight / POWER(height / 100.0, 2) >= 30 THEN 1
        ELSE 0
    END AS isObese
FROM patients;