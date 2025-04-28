/*****   PATIENTS   *************************************************************/

INSERT INTO Patients VALUES (DEFAULT, 'John', 'Doe', TO_DATE('1990-06-15','YYYY-MM-DD'), 'Male', '555-123-4567', 'john.doe@example.com', '123 Main St, Springfield');
INSERT INTO Patients VALUES (DEFAULT, 'Jane', 'Smith', TO_DATE('1985-02-20','YYYY-MM-DD'), 'Female', '555-234-5678', 'jane.smith@example.com', '456 Elm St, Springfield');
INSERT INTO Patients VALUES (DEFAULT, 'Alice', 'Johnson', TO_DATE('1992-09-05','YYYY-MM-DD'), 'Female', '555-345-6789', 'alice.johnson@example.com', '789 Oak St, Springfield');
INSERT INTO Patients VALUES (DEFAULT, 'Robert', 'Brown', TO_DATE('1978-11-12','YYYY-MM-DD'), 'Male', '555-456-7890', 'robert.brown@example.com', '321 Pine St, Springfield');
INSERT INTO Patients VALUES (DEFAULT, 'Michael', 'Davis', TO_DATE('2000-01-22','YYYY-MM-DD'), 'Male', '555-567-8901', 'michael.davis@example.com', '654 Cedar St, Springfield');
INSERT INTO Patients VALUES (DEFAULT, 'Olivia', 'White', TO_DATE('1995-03-18','YYYY-MM-DD'), 'Female', '555-678-9012', 'olivia.white@example.com', '987 Maple St, Springfield');
INSERT INTO Patients VALUES (DEFAULT, 'Daniel', 'Green', TO_DATE('1988-07-29','YYYY-MM-DD'), 'Male', '555-789-0123', 'daniel.green@example.com', '159 Walnut St, Springfield');
INSERT INTO Patients VALUES (DEFAULT, 'Sophia', 'King', TO_DATE('1993-12-11','YYYY-MM-DD'), 'Female', '555-890-1234', 'sophia.king@example.com', '753 Birch St, Springfield');

-- SELECT * FROM Patients;

/*****   DOCTORS   *************************************************************/

INSERT INTO Doctors VALUES (DEFAULT, 'Emily', 'Clark', 'Cardiology', '555-111-2222', 'emily.clark@hospital.com', 'Cardiology');
INSERT INTO Doctors VALUES (DEFAULT, 'David', 'Miller', 'Dermatology', '555-222-3333', 'david.miller@hospital.com', 'Dermatology');
INSERT INTO Doctors VALUES (DEFAULT, 'Sarah', 'Wilson', 'Neurology', '555-333-4444', 'sarah.wilson@hospital.com', 'Neurology');
INSERT INTO Doctors VALUES (DEFAULT, 'James', 'Taylor', 'Pediatrics', '555-444-5555', 'james.taylor@hospital.com', 'Pediatrics');
INSERT INTO Doctors VALUES (DEFAULT, 'Laura', 'Anderson', 'Orthopedics', '555-555-6666', 'laura.anderson@hospital.com', 'Orthopedics');
INSERT INTO Doctors VALUES (DEFAULT, 'Brian', 'Lee', 'Gastroenterology', '555-666-7777', 'brian.lee@hospital.com', 'Gastroenterology');
INSERT INTO Doctors VALUES (DEFAULT, 'Grace', 'Martinez', 'Oncology', '555-777-8888', 'grace.martinez@hospital.com', 'Oncology');

-- SELECT * FROM Doctors;

/*****   APPOINTMENTS   *************************************************************/

INSERT INTO Appointments VALUES (DEFAULT, 1, 1, TO_TIMESTAMP('2024-04-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Completed');
INSERT INTO Appointments VALUES (DEFAULT, 2, 2, TO_TIMESTAMP('2024-04-02 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Completed');
INSERT INTO Appointments VALUES (DEFAULT, 3, 3, TO_TIMESTAMP('2024-04-05 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Canceled');
INSERT INTO Appointments VALUES (DEFAULT, 4, 4, TO_TIMESTAMP('2024-04-08 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Scheduled');
INSERT INTO Appointments VALUES (DEFAULT, 5, 5, TO_TIMESTAMP('2024-04-10 13:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Canceled');
INSERT INTO Appointments VALUES (DEFAULT, 6, 6, TO_TIMESTAMP('2024-04-12 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Completed');
INSERT INTO Appointments VALUES (DEFAULT, 7, 7, TO_TIMESTAMP('2024-04-14 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Completed');
INSERT INTO Appointments VALUES (DEFAULT, 8, 1, TO_TIMESTAMP('2024-04-16 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Scheduled');

-- SELECT * FROM Appointments;

/*****   TREATMENT_HISTORY   *************************************************************/

INSERT INTO Treatment_History VALUES (DEFAULT, 1, 'High blood pressure', 'Prescribed medication and advised diet changes', 'Lisinopril', 'Y');
INSERT INTO Treatment_History VALUES (DEFAULT, 2, 'Severe acne', 'Prescribed topical treatment', 'Benzoyl Peroxide Gel', 'N');
INSERT INTO Treatment_History VALUES (DEFAULT, 6, 'Stomach pain', 'Advised endoscopy and prescribed antacids', 'Omeprazole', 'Y');
INSERT INTO Treatment_History VALUES (DEFAULT, 7, 'Lung nodule', 'Referred to oncology and started chemotherapy', 'Cisplatin', 'Y');

-- SELECT * FROM Treatment_History;

/*****   PRESCRIPTIONS   *************************************************************/

INSERT INTO Prescriptions VALUES (DEFAULT, 1, 'Lisinopril', '10mg', 'Once daily', '30 days');
INSERT INTO Prescriptions VALUES (DEFAULT, 2, 'Benzoyl Peroxide Gel', '5%', 'Apply twice daily', '60 days');
INSERT INTO Prescriptions VALUES (DEFAULT, 3, 'Omeprazole', '20mg', 'Twice daily', '14 days');
INSERT INTO Prescriptions VALUES (DEFAULT, 4, 'Cisplatin', '50mg/m2', 'Every 3 weeks', '6 cycles');

-- SELECT * FROM Prescriptions;

/********************************************************************************/
