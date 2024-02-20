SELECT d.doctor_id,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
    COUNT(DISTINCT a.diagnosis) AS num_diagnoses
FROM Doctors d
    JOIN Admissions a ON d.doctor_id = a.attending_doctor_id
GROUP BY d.doctor_id,
    doctor_name
HAVING COUNT(DISTINCT a.diagnosis) >= 3;