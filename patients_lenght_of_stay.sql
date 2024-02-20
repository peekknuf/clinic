WITH LoS AS (
  SELECT patient_id, 
         province_id, 
         AVG(discharge_date - admission_date) AS avg_LoS
  FROM Admissions
  GROUP BY patient_id, province_id
)

SELECT province_name, 
       ROUND(AVG(avg_LoS), 1) AS avg_LoS
FROM LoS
JOIN province_names pn ON length_of_stay.province_id = pn.province_id
GROUP BY province_name
ORDER BY avg_LoS DESC;