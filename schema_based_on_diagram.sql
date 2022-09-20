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

--create table invoices
CREATE TABLE invoices (
  id INT GENERATED ALWAYS AS IDENTITY,
  PRIMARY KEY(id),
  total_amount DECIMAL,
  genereate_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history__id INT,
  CONSTRAINT fk_medical_history_id FOREIGN KEY medical_history__id REFERENCES medical_histories(id)
);

--create table invoice_items
CREATE TABLE invoice_items (
  id INT GENERATED ALWAYS AS IDENTITY,
  PRIMARY KEY(id),
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT,
  CONSTRAINT fk_invoice_id FOREIGN KEY invoice_id REFERENCES invoices(id),
  treatment_id INT
);


