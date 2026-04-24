-- ============================================================
-- General Hospital Keffi — Seed Data
-- Matches test data used in SQLite Browser screenshots
-- ============================================================

-- Wards
INSERT INTO wards (ward_id, ward_name, capacity) VALUES
(1, 'General Ward',    30),
(2, 'Maternity Ward',  20),
(3, 'Emergency Ward',  15),
(4, 'Paediatrics',     25),
(5, 'Surgical Ward',   20);

-- Staff
INSERT INTO staff (staff_id, first_name, last_name, role, phone_number) VALUES
(101, 'Chukwuemeka', 'Obi',    'Doctor', '08011111111'),
(102, 'Fatima',      'Garba',  'Doctor', '08022222222'),
(103, 'Ngozi',       'Eze',    'Nurse',  '08033333333');

-- Patients
INSERT INTO patients (patient_id, first_name, last_name, gender, date_of_birth, phone_number, address) VALUES
(1, 'Musa',   'Abdullahi', 'Male',   '1985-06-12', '08034567891', 'Keffi, Nasarawa'),
(2, 'Chioma', 'Okeke',     'Female', '1992-03-25', '08123456789', 'Nyanya, Abuja'),
(3, 'Tunde',  'Adeyemi',   'Male',   '1978-11-02', '08087654321', 'Mararaba, Nasarawa'),
(4, 'Aisha',  'Bello',     'Female', '2000-08-14', '07012345678', 'Keffi, Nasarawa'),
(5, 'Emeka',  'Nwosu',     'Male',   '1989-01-30', '09011223344', 'Lafia, Nasarawa');

-- Diagnoses (WHO ICD-10 codes)
INSERT INTO diagnoses (diagnosis_id, icd10_code, description) VALUES
(1, 'B54', 'Unspecified malaria'),
(2, 'J11', 'Influenza, virus not identified'),
(3, 'I10', 'Essential hypertension'),
(4, 'S09', 'Head injury, unspecified'),
(5, 'A00', 'Cholera');

-- Visits
INSERT INTO visits (visit_id, patient_id, staff_id, ward_id, visit_date, reason) VALUES
(1, 1, 101, 1, '2026-03-01', 'Fever and chills'),
(2, 2, 102, 2, '2026-03-02', 'Routine antenatal check'),
(3, 3, 101, 1, '2026-03-03', 'Severe headache'),
(4, 4, 103, 3, '2026-03-03', 'Road accident injury'),
(5, 5, 101, 1, '2026-03-04', 'High fever and weakness'),
(6, 1, 101, 1, '2026-03-10', 'Recurring fever'),
(7, 2, 102, 2, '2026-03-15', 'Antenatal follow-up');

-- Visit_Diagnoses (many-to-many bridge)
INSERT INTO visit_diagnoses (visit_id, diagnosis_id) VALUES
(1, 1),  -- Musa: malaria
(2, 1),  -- Chioma: malaria (incidental)
(3, 3),  -- Tunde: hypertension
(4, 4),  -- Aisha: head injury
(4, 2),  -- Aisha: also influenza
(5, 1),  -- Emeka: malaria
(5, 3),  -- Emeka: also hypertension
(6, 1),  -- Musa (return): malaria
(6, 4),  -- Musa (return): head injury
(6, 2),  -- Musa (return): influenza
(7, 3);  -- Chioma follow-up: hypertension
