/* Database schema to keep the structure of entire database. */

-- Project 01

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL,
    PRIMARY KEY(id)
);

-- Project 02

ALTER TABLE animals ADD species varchar(100); 
