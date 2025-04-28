-- Sample Queries

/* 1. List all patients (their names and emails) */
SELECT 
    first_name || ' ' || last_name AS patient_name, 
    email
FROM  Patients;

/* 2. Find all doctors specializing in Cardiology */
SELECT * FROM Doctors
WHERE specialty = 'Cardiology';

/* 3. Upcoming appointments (after 10-Apr-2024) with names */
SELECT 
    a.appointment_id,
    p.first_name || ' ' || p.last_name  AS patient_name,
    d.first_name || ' ' || d.last_name AS doctor_name,
    a.appointment_date,
    a.status
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id
WHERE a.appointment_date > TO_DATE('10-04-2024','DD-MM-YYYY')
ORDER BY a.appointment_date;

/* 4. Number of appointments per doctor */
SELECT 
    d.first_name || ' ' || d.last_name AS doctor_name,
    COUNT(a.appointment_id) AS total_appointments
FROM Doctors d
LEFT JOIN Appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.first_name, d.last_name
ORDER BY total_appointments DESC;

/* 5. Doctors with NO upcoming appointments (after 10-Apr-2024) */
SELECT 
    d.doctor_id,
    d.first_name || ' ' || d.last_name AS doctor_name
FROM Doctors d
WHERE d.doctor_id NOT IN (
        SELECT DISTINCT a.doctor_id FROM Appointments a
        WHERE a.appointment_date > TO_DATE('10-04-2024','DD-MM-YYYY')
      );

/* 6. Patients who have never had a completed appointment */
SELECT 
    p.patient_id,
    p.first_name || ' ' || p.last_name AS patient_name
FROM Patients p
WHERE NOT EXISTS (
        SELECT 1
        FROM Appointments a
        WHERE a.patient_id = p.patient_id
        AND a.status     = 'Completed'
      );

/* 7a. View: appointment summary */
CREATE OR REPLACE VIEW Appointment_Summary AS
SELECT 
    a.appointment_id,
    p.first_name || ' ' || p.last_name AS patient_name,
    d.first_name || ' ' || d.last_name AS doctor_name,
    a.appointment_date,
    a.status
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id;

/* 7b. Example use of the view */
SELECT * FROM Appointment_Summary
WHERE status = 'Scheduled';

/* 8. Patients with EXACTLY one distinct medication prescribed */
SELECT 
    p.patient_id,
    p.first_name || ' ' || p.last_name AS patient_name,
    COUNT(DISTINCT pr.medication_name) AS distinct_medications
FROM Patients p
JOIN Appointments a ON p.patient_id = a.patient_id
JOIN Treatment_History th ON a.appointment_id = th.appointment_id
JOIN Prescriptions pr ON th.treatment_id = pr.treatment_id
GROUP BY p.patient_id, p.first_name, p.last_name
HAVING COUNT(DISTINCT pr.medication_name) = 1;

/* 9. Appointment counts by STATUS (always returns rows) */
SELECT 
    status,
    COUNT(*) AS total_appointments
FROM Appointments
GROUP BY status
ORDER BY total_appointments DESC;

/* 10. List doctors with 100% Completed Appointment Rate */
WITH Doctor_Stats AS (
    SELECT 
        d.doctor_id,
        d.first_name || ' ' || d.last_name AS doctor_name,
        SUM(CASE WHEN a.status = 'Completed' THEN 1 ELSE 0 END) AS completed_appointments,
        COUNT(*) AS total_appointments
    FROM Doctors d
    JOIN Appointments a ON d.doctor_id = a.doctor_id
    GROUP BY d.doctor_id, d.first_name, d.last_name
)
SELECT 
    doctor_id, 
    doctor_name,
    ROUND(completed_appointments / total_appointments * 100, 2) AS completed_rate_pct
FROM Doctor_Stats
WHERE completed_appointments / total_appointments = 1;

