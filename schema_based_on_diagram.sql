-- Create database
CREATE DATABASE clinic;

-- Create table patients
CREATE TABLE patients (
  id INT GENERATED ALWAYS AS IDENTITY,
  name varchar(100),
  date_of_birth DATE,
  PRIMARY KEY (id)
);



