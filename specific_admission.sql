SELECT CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
    a.admission_date,
    a.diagnosis
FROM Patients p
    JOIN Admissions a ON p.patient_id = a.patient_id
    JOIN Doctors d ON a.attending_doctor_id = d.doctor_id
WHERE a.admission_date = (
        SELECT MIN(a2.admission_date)
        FROM Admissions a2
        WHERE a2.patient_id = a.patient_id
    )
    AND d.specialty = (
        SELECT d2.specialty
        FROM Admissions a2
            JOIN Doctors d2 ON a2.attending_doctor_id = d2.doctor_id
        WHERE a2.patient_id = a.patient_id
        ORDER BY a2.admission_date
        LIMIT 1
    );