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
UPDATE animals SET species_id = (SELECT id FROM species WHERE name='Digimon') WHERE name LIKE '%mon';
UPDATE animals SET species_id = (SELECT id FROM species WHERE name='Pokemon') WHERE species_id IS NULL;

-- Update animals table by adding owner_id
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name='Sam Smith') WHERE name='Agumon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name='Jennifer Orwell') WHERE name='Gabumon' OR name='Pikachu';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name='Bob') WHERE name='Devimon' OR name='Plantmon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name='Melody Pond') WHERE name='Charmander' OR name='Squirtle' OR name='Blossom';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name='Dean Winchester') WHERE name='Angemon' OR name='Boarmon';


-- PROJECT 04

INSERT INTO vets (name, age, date_of_graduation)
VALUES('William Tatcher', 45, 'Apr 23, 2000'),
('Maisy Smith', 26, 'Jan 17, 2019'),
('Stephanie Mendez', 64, 'May 04, 1981'),
('Jack Harkness', 38, 'Jun 08, 2008');

INSERT INTO specializations (species_id, vet_id)
VALUES((SELECT id FROM species WHERE name='Pokemon'),(SELECT id FROM vets WHERE name='William Tatcher')),
((SELECT id FROM species WHERE name='Digimon'),(SELECT id FROM vets WHERE name='Stephanie Mendez')),
((SELECT id FROM species WHERE name='Pokemon'),(SELECT id FROM vets WHERE name='Stephanie Mendez')),
((SELECT id FROM species WHERE name='Digimon'),(SELECT id FROM vets WHERE name='Jack Harkness'));

INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES((SELECT id FROM animals WHERE name='Agumon'), (SELECT id FROM vets WHERE name='William Tatcher'), 'May 24, 2020'),
((SELECT id FROM animals WHERE name='Agumon'), (SELECT id FROM vets WHERE name='Stephanie Mendez'), 'Jul 22, 2020'),
((SELECT id FROM animals WHERE name='Gabumon'), (SELECT id FROM vets WHERE name='Jack Harkness'), 'Feb 02, 2021'),
((SELECT id FROM animals WHERE name='Pikachu'), (SELECT id FROM vets WHERE name='Maisy Smith'), 'Jan 05, 2020'),
((SELECT id FROM animals WHERE name='Pikachu'), (SELECT id FROM vets WHERE name='Maisy Smith'), 'Mar 08, 2020'),
((SELECT id FROM animals WHERE name='Pikachu'), (SELECT id FROM vets WHERE name='Maisy Smith'), 'May 14, 2020'),
((SELECT id FROM animals WHERE name='Devimon'), (SELECT id FROM vets WHERE name='Stephanie Mendez'), 'May 04, 2021'),
((SELECT id FROM animals WHERE name='Charmander'), (SELECT id FROM vets WHERE name='Jack Harkness'), 'Feb 24, 2021'),
((SELECT id FROM animals WHERE name='Plantmon'), (SELECT id FROM vets WHERE name='Maisy Smith'), 'Dec 21, 2019'),
((SELECT id FROM animals WHERE name='Plantmon'), (SELECT id FROM vets WHERE name='William Tatcher'), 'Aug 10, 2020'),
((SELECT id FROM animals WHERE name='Plantmon'), (SELECT id FROM vets WHERE name='Maisy Smith'), 'Apr 07, 2021'),
((SELECT id FROM animals WHERE name='Squirtle'), (SELECT id FROM vets WHERE name='Stephanie Mendez'), 'Sep 29, 2019'),
((SELECT id FROM animals WHERE name='Angemon'), (SELECT id FROM vets WHERE name='Jack Harkness'), 'Oct 03, 2020'),
((SELECT id FROM animals WHERE name='Angemon'), (SELECT id FROM vets WHERE name='Jack Harkness'), 'Nov 04, 2020'),
((SELECT id FROM animals WHERE name='Boarmon'), (SELECT id FROM vets WHERE name='Maisy Smith'), 'Jan 24, 2019'),
((SELECT id FROM animals WHERE name='Boarmon'), (SELECT id FROM vets WHERE name='Maisy Smith'), 'May 15, 2019'),
((SELECT id FROM animals WHERE name='Boarmon'), (SELECT id FROM vets WHERE name='Maisy Smith'), 'Feb 27, 2020'),
((SELECT id FROM animals WHERE name='Boarmon'), (SELECT id FROM vets WHERE name='Maisy Smith'), 'Aug 03, 2020'),
((SELECT id FROM animals WHERE name='Blossom'), (SELECT id FROM vets WHERE name='Stephanie Mendez'), 'May 24, 2020'),
((SELECT id FROM animals WHERE name='Blossom'), (SELECT id FROM vets WHERE name='William Tatcher'), 'Jan 11, 2021');

