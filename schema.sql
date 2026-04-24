-- ============================================================
-- General Hospital Keffi — Relational Database Schema
-- DP-900 Capstone | Microsoft Elevate AI Developers Program
-- Author: Oluwabukunmi Akinmi 
-- ============================================================

-- Table 1: Patients
CREATE TABLE patients (
    patient_id    INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name    TEXT NOT NULL,
    last_name     TEXT NOT NULL,
    gender        TEXT,
    date_of_birth TEXT,
    phone_number  TEXT UNIQUE,
    address       TEXT
);

-- Table 2: Wards
CREATE TABLE wards (
    ward_id    INTEGER PRIMARY KEY AUTOINCREMENT,
    ward_name  TEXT NOT NULL,
    capacity   INTEGER
);

-- Table 3: Staff
CREATE TABLE staff (
    staff_id     INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name   TEXT NOT NULL,
    last_name    TEXT NOT NULL,
    role         TEXT NOT NULL,
    phone_number TEXT
);

-- Table 4: Diagnoses
-- Uses standardized WHO ICD-10 codes instead of free-text names
CREATE TABLE diagnoses (
    diagnosis_id INTEGER PRIMARY KEY AUTOINCREMENT,
    icd10_code   TEXT NOT NULL UNIQUE,
    description  TEXT NOT NULL
);

-- Table 5: Visits
-- Core transactional table — one row per patient attendance
CREATE TABLE visits (
    visit_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    patient_id INTEGER NOT NULL REFERENCES patients(patient_id),
    staff_id   INTEGER NOT NULL REFERENCES staff(staff_id),
    ward_id    INTEGER REFERENCES wards(ward_id),
    visit_date TEXT NOT NULL,
    reason     TEXT
);

-- Table 6: Visit_Diagnoses
-- Bridge table resolving the many-to-many between visits and diagnoses
-- A single visit can have multiple diagnoses (e.g. malaria + anaemia)
CREATE TABLE visit_diagnoses (
    visit_id     INTEGER NOT NULL REFERENCES visits(visit_id),
    diagnosis_id INTEGER NOT NULL REFERENCES diagnoses(diagnosis_id),
    PRIMARY KEY (visit_id, diagnosis_id)
);
