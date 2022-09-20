-- Create database
CREATE DATABASE clinic;

-- Create table patients
CREATE TABLE patients (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100),
  date_of_birth DATE,
  PRIMARY KEY (id)
);

-- Create table medical histories
CREATE TABLE medical_histories (
  id INT GENERATED ALWAYS AS IDENTITY,
  admitted_at TIMESTAMP,
  status VARCHAR(250),
  patient_id INT,
  PRIMARY KEY (id),
  CONSTRAINT fk_patient_id FOREIGN KEY patient_id REFERENCES patients(id)
);

