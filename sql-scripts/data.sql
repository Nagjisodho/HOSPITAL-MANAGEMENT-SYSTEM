BEGIN;

INSERT INTO departments (dept_name, location_block) VALUES 
('Cardiology', 'A-Block, Level 1'),
('Radiology', 'B-Block, Level 2'),
('Pediatrics', 'C-Block, Level 1'),
('Neurology', 'A-Block, Level 3'),
('General Surgery', 'D-Block, Level 2');

INSERT INTO doctors (first_name, last_name, specialization, email, dept_id) VALUES 
('John', 'Smith', 'Cardiologist', 'jsmith@hospital.com', 1),
('Sarah', 'Khan', 'Radiologist', 'skhan@hospital.com', 2),
('Emily', 'Chen', 'Pediatrician', 'echen@hospital.com', 3),
('Robert', 'Wilson', 'Neurologist', 'rwilson@hospital.com', 4);

INSERT INTO staff (first_name, last_name, job_role, salary, dept_id) VALUES 
('Alice', 'Johnson', 'Head Nurse', 55000.00, 1),
('Mark', 'Davis', 'Receptionist', 32000.00, 3),
('Jessica', 'Taylor', 'Lab Technician', 45000.00, 2),
('David', 'Miller', 'Medical Assistant', 38000.00, 5);

INSERT INTO patients (first_name, last_name, gender, dob, contact_number) VALUES 
('Michael', 'Scott', 'M', '1975-03-15', '555-0101'),
('Pam', 'Beesly', 'F', '1980-05-20', '555-0202'),
('Jim', 'Halpert', 'M', '1979-10-01', '555-0303'),
('Dwight', 'Schrute', 'M', '1970-01-20', '555-0404');

INSERT INTO appointments (patient_id, doctor_id, appointment_date, status) VALUES 
(1, 1, '2026-05-10', 'Completed'),
(2, 3, '2026-05-12', 'Scheduled'),
(3, 4, '2026-05-15', 'Scheduled');

INSERT INTO medical_records (patient_id, doctor_id, diagnosis) VALUES 
(1, 1, 'Mild Hypertension. Recommended low sodium diet.'),
(3, 4, 'Frequent Migraines. Needs further observation.');

INSERT INTO lab_tests (patient_id, test_name, test_result, test_cost) VALUES 
(1, 'ECG', 'Normal Heart Rhythm', 150.00),
(2, 'Blood Count', 'Pending', 45.00),
(3, 'MRI Scan', 'Clear', 500.00);

INSERT INTO pharmacy_inventory (medicine_name, stock_quantity, unit_price, expiry_date) VALUES 
('Paracetamol', 1000, 5.00, '2027-12-31'),
('Amoxicillin', 250, 25.00, '2026-09-15'),
('Lisinopril', 150, 12.50, '2028-01-20'),
('Ibuprofen', 500, 8.00, '2027-05-10');

INSERT INTO prescriptions (record_id, medicine_id, dosage_instruction) VALUES 
(1, 3, '10mg once daily in the morning'),
(1, 1, '500mg as needed for headache');

INSERT INTO billing (patient_id, total_amount, payment_status) VALUES 
(1, 155.00, 'Paid'),
(2, 45.00, 'Unpaid'),
(3, 500.00, 'Pending');

COMMIT;
