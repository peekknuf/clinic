SELECT p.patient_id,
    p.first_name,
    p.last_name,
    d.specialty
FROM patients p
    JOIN admissions a ON p.patient_id = a.patient_id
    JOIN doctors d ON a.attending_doctor_id = d.doctor_id
WHERE a.diagnosis = 'Epilepsy'
    AND d.first_name = 'Lisa'