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

-- Project 03
-- Create new tables
CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name varchar(250),
    age INT,
    PRIMARY KEY(id)
);

CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    PRIMARY KEY(id)
);

-- Alter animals table to add species_id as foreign key
ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD species_id INT;

ALTER TABLE animals
ADD CONSTRAINT fk_animal_species
FOREIGN KEY (species_id)
REFERENCES species(id);

-- Alter animals table to add owner_id as foreign key
ALTER TABLE animals ADD owner_id INT;

ALTER TABLE animals
ADD CONSTRAINT fk_animal_owner
FOREIGN KEY (owner_id)
REFERENCES owners(id);