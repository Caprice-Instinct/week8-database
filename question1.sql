CREATE DATABASE clinic;

USE clinic;

CREATE TABLE departments (
 department_id INT auto_increment PRIMARY KEY,
 department_name VARCHAR(100)
); 

CREATE TABLE doctors (
doctor_id INT auto_increment PRIMARY KEY,
doctor_name VARCHAR(100) not null,
email VARCHAR(100) NOT NULL,
department_id INT,
FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE patients (
patient_id INT auto_increment PRIMARY KEY,
patient_first_name VARCHAR(50) NOT NULL,
patient_last_name VARCHAR(50) NOT NULL,
phone VARCHAR(20),
email VARCHAR(100) NOT NULL
);

CREATE TABLE appointments (
appointment_id INT PRIMARY KEY auto_increment,
patient_id INT,
FOREIGN KEY (patient_id) REFERENCES patients (patient_id),
doctor_id INT,
FOREIGN KEY (doctor_id) REFERENCES doctors (doctor_id),
reason VARCHAR(255),
appointment_date DATETIME NOT NULL
);

CREATE TABLE prescriptions (
prescription_id INT PRIMARY KEY AUTO_INCREMENT,
appointment_id INT,
FOREIGN KEY (appointment_id) REFERENCES appointments (appointment_id),
medicine_name VARCHAR(100) NOT NULL,
dosage VARCHAR(50) NOT NULL,
instructions TEXT
);

INSERT INTO departments (department_name) VALUES 
('General Medicine'),
('Pediatrics'),
('Dermatology'),
('Dental'),
('Cardiology');


INSERT INTO doctors (doctor_name, email, department_id) VALUES
('James Kariuki', 'j.kariuki@cliniccare.com', 1),
('Grace Mwende', 'g.mwende@cliniccare.com', 2),
('Brian Otieno', 'b.otieno@cliniccare.com', 3),
('Cynthia Wambui', 'c.wambui@cliniccare.com', 4),
('Michael Mutua', 'm.mutua@cliniccare.com', 5);

INSERT INTO patients (patient_first_name, patient_last_name, phone, email) VALUES
('Aisha', 'Njeri', '0722123456', 'aisha.njeri@gmail.com'),
('David', 'Kamau', '0733112233', 'david.kamau@yahoo.com'),
('Mercy', 'Kilonzo', '0711223344', 'mercyk@gmail.com'),
('Kevin', 'Otieno', '0700998877', 'kevin.otieno@gmail.com'),
('Rose', 'Mwikali', '0744123456', 'rose.mwikali@hotmail.com');

INSERT INTO appointments (patient_id, doctor_id, appointment_date, reason) VALUES
(1, 1, '2025-04-26 09:30:00', 'Routine check-up'),
(2, 2, '2025-04-26 11:00:00', 'Child fever and rash'),
(3, 3, '2025-04-27 14:15:00', 'Skin irritation on arms'),
(4, 5, '2025-04-28 08:45:00', 'Chest pain and fatigue'),
(5, 4, '2025-04-28 16:00:00', 'Toothache and swelling');

SELECT * FROM departments;
SELECT * FROM doctors;
SELECT * FROM patients;
SELECT * FROM prescriptions;
SELECT * FROM appointments;