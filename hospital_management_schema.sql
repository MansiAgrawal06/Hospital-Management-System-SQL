CREATE DATABASE HospitalDB;
USE HospitalDB;
CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);
INSERT INTO Departments (department_name)
VALUES 
('Cardiology'),
('Neurology'),
('Orthopedics');

CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    phone VARCHAR(15),
    department_id INT,
    FOREIGN KEY (department_id) 
    REFERENCES Departments(department_id)
    ON DELETE SET NULL
);
INSERT INTO Doctors (name, specialization, phone, department_id)
VALUES
('Dr. Sharma', 'Cardiologist', '9456463210', 1),
('Dr. Mehta', 'Neurologist', '9877643211', 2);

CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    date_of_birth DATE,
    phone VARCHAR(15),
    address VARCHAR(200)
);
INSERT INTO Patients (name, gender, date_of_birth, phone, address)
VALUES
('Riya Singh', 'Female', '2000-05-12', '9876500000', 'Aligarh'),
('Aman Verma', 'Male', '1998-03-22', '9876511111', 'Delhi');

CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATETIME NOT NULL,
    status VARCHAR(50),
    FOREIGN KEY (patient_id) 
    REFERENCES Patients(patient_id)
    ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) 
    REFERENCES Doctors(doctor_id)
    ON DELETE CASCADE
);
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status)
VALUES
(1, 1, '2026-02-10 10:30:00', 'Completed'),
(2, 2, '2026-02-11 12:00:00', 'Scheduled');

CREATE TABLE Treatments (
    treatment_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT UNIQUE,
    diagnosis VARCHAR(255),
    prescription TEXT,
    treatment_cost DECIMAL(10,2),
    FOREIGN KEY (appointment_id) 
    REFERENCES Appointments(appointment_id)
    ON DELETE CASCADE
);
INSERT INTO Treatments (appointment_id, diagnosis, prescription, treatment_cost)
VALUES
(1, 'Heart Pain', 'Medicine A - 5 days', 2000.00);

CREATE TABLE Bills (
    bill_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    total_amount DECIMAL(10,2),
    bill_date DATE,
    payment_status VARCHAR(50),
    FOREIGN KEY (patient_id) 
    REFERENCES Patients(patient_id)
    ON DELETE CASCADE
);
INSERT INTO Bills (patient_id, total_amount, bill_date, payment_status)
VALUES
(1, 2000.00, '2026-02-10', 'Paid');

