     /* ---------- 1. PATIENTS ---------- */
CREATE TABLE Patients (
    patient_id  INT AUTO_INCREMENT PRIMARY KEY,
    first_name  VARCHAR(50)  NOT NULL,
    last_name   VARCHAR(50)  NOT NULL,
    dob         DATE         NOT NULL,
    gender      ENUM('Male','Female','Other') NOT NULL,
    phone       VARCHAR(15),
    email       VARCHAR(100) UNIQUE,
    address     TEXT
);

/* ---------- 2. DOCTORS ---------- */
CREATE TABLE Doctors (
    doctor_id   INT AUTO_INCREMENT PRIMARY KEY,
    first_name  VARCHAR(50)  NOT NULL,
    last_name   VARCHAR(50)  NOT NULL,
    specialty   VARCHAR(100) NOT NULL,
    phone       VARCHAR(15),
    email       VARCHAR(100) UNIQUE,
    department  VARCHAR(50)
);

/* ---------- 3. APPOINTMENTS ---------- */
CREATE TABLE Appointments (
    appointment_id  INT AUTO_INCREMENT PRIMARY KEY,
    patient_id      INT NOT NULL,
    doctor_id       INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    status          ENUM('Scheduled','Completed','Canceled') DEFAULT 'Scheduled',
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id)  REFERENCES Doctors(doctor_id)
);

/* ---------- 4. TREATMENT_HISTORY ---------- */
CREATE TABLE Treatment_History (
    treatment_id        INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id      INT NOT NULL,
    diagnosis           TEXT NOT NULL,
    treatment_given     TEXT NOT NULL,
    prescribed_medications TEXT,
    follow_up_required  BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

/* ---------- 5. PRESCRIPTIONS ---------- */
CREATE TABLE Prescriptions (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    treatment_id    INT NOT NULL,
    medication_name VARCHAR(100) NOT NULL,
    dosage          VARCHAR(50)  NOT NULL,
    frequency       VARCHAR(50)  NOT NULL,
    duration        VARCHAR(50)  NOT NULL,
    FOREIGN KEY (treatment_id) REFERENCES Treatment_History(treatment_id)
);
