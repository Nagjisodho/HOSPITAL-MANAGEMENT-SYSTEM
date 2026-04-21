BEGIN;

CREATE TABLE departments (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
    location_block VARCHAR(20)
);

CREATE TABLE doctors (
    doctor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    specialization VARCHAR(50),
    email VARCHAR(50) UNIQUE,
    dept_id INTEGER REFERENCES departments(dept_id)
);

CREATE TABLE staff (
    staff_id SERIAL PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    job_role VARCHAR(30),
    salary NUMERIC(8,2) CHECK (salary > 0),
    dept_id INTEGER REFERENCES departments(dept_id)
);

CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M', 'F', 'O')),
    dob DATE NOT NULL,
    contact_number VARCHAR(20)
);

CREATE TABLE appointments (
    appointment_id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL REFERENCES patients(patient_id),
    doctor_id INTEGER NOT NULL REFERENCES doctors(doctor_id),
    appointment_date DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'Scheduled' CHECK (status IN ('Scheduled', 'Completed', 'Cancelled'))
);

CREATE TABLE medical_records (
    record_id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL REFERENCES patients(patient_id),
    doctor_id INTEGER NOT NULL REFERENCES doctors(doctor_id),
    diagnosis TEXT NOT NULL,
    recorded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE lab_tests (
    test_id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL REFERENCES patients(patient_id),
    test_name VARCHAR(50) NOT NULL,
    test_date DATE DEFAULT CURRENT_DATE,
    test_result TEXT,
    test_cost NUMERIC(7,2)
);

CREATE TABLE pharmacy_inventory (
    medicine_id SERIAL PRIMARY KEY,
    medicine_name VARCHAR(100) NOT NULL,
    stock_quantity INTEGER DEFAULT 0 CHECK (stock_quantity >= 0),
    unit_price NUMERIC(8, 2),
    expiry_date DATE
);

CREATE TABLE prescriptions (
    prescription_id SERIAL PRIMARY KEY,
    record_id INTEGER NOT NULL REFERENCES medical_records(record_id),
    medicine_id INTEGER NOT NULL REFERENCES pharmacy_inventory(medicine_id),
    dosage_instruction VARCHAR(100)
);

CREATE TABLE billing (
    bill_id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL REFERENCES patients(patient_id),
    total_amount NUMERIC(10, 2) NOT NULL,
    payment_status VARCHAR(20) DEFAULT 'Unpaid' CHECK (payment_status IN ('Paid', 'Unpaid', 'Pending')),
    billing_date DATE DEFAULT CURRENT_DATE
);

COMMIT;
