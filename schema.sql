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

-- PROJECT 04

-- Create vets table
CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(150),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY(id)
);

-- Create join tables 'specializations'(species & vets) & 'visits'(animals & vets)
CREATE TABLE specializations (
    species_id INT,
    vet_id INT,
    PRIMARY KEY (species_id, vet_id),
    CONSTRAINT fk_specializations_species FOREIGN KEY (species_id) REFERENCES species(id),
    CONSTRAINT fk_specializations_vets FOREIGN KEY (vet_id) REFERENCES vets(id)
);

CREATE TABLE visits (
    animal_id INT,
    vet_id INt,
    date_of_visit DATE,
    CONSTRAINT fk_visits_animal FOREIGN KEY (animal_id) REFERENCES animals(id),
    CONSTRAINT fk_visits_vets FOREIGN KEY (vet_id) REFERENCES vets(id)
);

-- ALTER TABLE visits
-- DROP CONSTRAINT visits_pkey;


-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);


-- CREATE INDEX for the tables
-- SELECT COUNT(*) FROM visits where animal_id = 4;
CREATE INDEX animal_id_index ON visits(animal_id);

--  SELECT * FROM visits where vet_id = 2;
CREATE INDEX vet_id_index ON visits(vet_id)

--  SELECT * FROM owners where email = 'owner_18327@mail.com';



