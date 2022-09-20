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
  treatment_id INT,
  CONSTRAINT fk_treatment_id FOREIGN KEY treatment_id REFERENCES treatments(id)
);

--create table treatments
CREATE TABLE treatments (
  id INT GENERATED ALWAYS AS IDENTITY,
  PRIMARY KEY(id),
  type VARCHAR(250),
  name VARCHAR(250)
);

-- Create JOIN table for medical_histories and treatments
CREATE TABLE history_treatment (
  history_id INT,
  treatment_id INT,
  CONSTRAINT fk_history_id FOREIGN KEY history_id REFERENCES medical_histories(id),
  CONSTRAINT fk_treatment_id FOREIGN KEY treatment_id REFERENCES treatments(id)
);

-- Create INDEX for the foreign keys
CREATE INDEX patient_id_index ON medical_histories(patient_id);

CREATE INDEX medical_history__id_index ON invoices(medical_history__id);

CREATE INDEX invoice_id_index ON invoice_items(invoice_id);

CREATE INDEX treatment_id_index ON invoice_items(treatment_id);

CREATE INDEX history_id_index ON history_treatment(history_id);

CREATE INDEX treatment_id_index ON history_treatment(treatment_id);
