/* Populate database with sample data. */

-- Project 01

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Agumon', 'Feb 3, 2020', 10.23, true, 0);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Gabumon', 'Nov 15, 2018', 8.0, true, 2);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Pikachu', 'Jan 7, 2021', 15.04, false, 1);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Devimon', 'May 12, 2017', 11.0, true, 5);

-- Project 02

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Charmander', 'Feb 08, 2020', -11.0, false, 0),
('Plantmon', 'Nov 15, 2021', -5.7, true, 2),
('Squirtle', 'Apr 02, 1993', -12.13, false, 3),
('Angemon', 'Jun 12, 2005', -45, true, 1),
('Boarmon', 'Jun 07, 2005', 20.4, true, 7),
('Blossom', 'Oct 13, 1998', 17, true, 3),
('Ditto', 'May 14, 2022', 22, true, 4);

-- Project 03

-- Insert data into Owners Table
INSERT INTO owners (full_name, age) 
VALUES ('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

-- Insert data into species
INSERT INTO species(name) VALUES('Pokemon'), ('Digimon');

-- Update data in animals by modifying specied_id
-- UPDATE animals SET specied_id = (SELECT id FROM species WHERE )

