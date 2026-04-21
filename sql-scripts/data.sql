BEGIN;

INSERT INTO departments (dept_name, location_block) VALUES 
('Cardiology', 'A-Block, Level 1'),
('Radiology', 'B-Block, Level 2'),
('Pediatrics', 'C-Block, Level 1');

INSERT INTO doctors (first_name, last_name, specialization, email, dept_id) VALUES 
('John', 'Smith', 'Cardiologist', 'jsmith@hospital.com', 1),
('Sarah', 'Khan', 'Radiologist', 'skhan@hospital.com', 2);

INSERT INTO patients (first_name, last_name, gender, dob, contact_number) VALUES 
('Michael', 'Scott', 'M', '1975-03-15', '555-0101'),
('Pam', 'Beesly', 'F', '1980-05-20', '555-0202');

INSERT INTO lab_tests (patient_id, test_name, test_result, test_cost) VALUES 
(1, 'ECG', 'Normal Heart Rhythm', 150.00),
(2, 'Blood Count', 'Normal', 45.00);

INSERT INTO billing (patient_id, total_amount, payment_status) VALUES 
(1, 155.00, 'Paid'),
(2, 45.00, 'Unpaid');

COMMIT;
