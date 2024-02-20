SELECT patient_id,
    CONCAT(patient_id, LENGTH(last_name), YEAR(birth_date)) AS temp_password
FROM patients
WHERE patient_id IN (
        SELECT DISTINCT patient_id
        FROM admissions
    );