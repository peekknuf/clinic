SELECT p.patient_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    MIN(a.admission_date) AS first_admission_date,
    MAX(a.admission_date) AS last_admission_date
FROM Patients p
    JOIN Admissions a ON p.patient_id = a.patient_id
GROUP BY p.patient_id,
    patient_name
HAVING COUNT(*) >= 2;