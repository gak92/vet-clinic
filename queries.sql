/*Queries that provide answers to the questions from all projects.*/

-- Project 01

SELECT * FROM animals WHERE name LIKE '%mon';

SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name FROM animals WHERE neutered = 'true' AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = true;

SELECT * FROM animals WHERE name != 'Gabumon';

SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

-- Project 02
-- UPDATE AND ROLLBACK
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

-- UPDATE
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT * FROM animals;
COMMIT;

-- DELETE
BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

-- SAVEPOINT AND ROLLBACK
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg * -1;
SELECT * FROM animals;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
SELECT * FROM animals;
COMMIT;

-- Question Queries
SELECT COUNT(*) FROM animals;
SELECT COUNT(escape_attempts) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, COUNT(escape_attempts) AS escape_count FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg) AS MIN_WEIGHT, MAX(weight_kg) AS MAX_WEIGHT FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals 
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;

-- Project 03

-- What animals belong to Melody Pond?
SELECT name FROM animals
INNER JOIN owners
ON owners.full_name='Melody Pond' AND animals.owner_id = owners.id;

-- List of all animals that are pokemon (their type is Pokemon).
SELECT * FROM animals
INNER JOIN species
ON species.name = 'Pokemon' AND animals.species_id = species.id;

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT name, full_name FROM animals
RIGHT JOIN owners
ON animals.owner_id = owners.id;

-- How many animals are there per species?
SELECT species.name, COUNT(*) FROM animals
INNER JOIN species
ON animals.species_id = species.id
GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT * FROM animals
INNER JOIN owners
ON owners.full_name='Jennifer Orwell' AND animals.owner_id = owners.id
INNER JOIN species
ON species.name='Digimon' AND animals.species_id=species.id;

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT * FROM animals
INNER JOIN owners
ON owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0 AND animals.owner_id = owners.id;

-- Who owns the most animals?
SELECT owners.full_name, COUNT(owner_id)
FROM animals
INNER JOIN owners
ON animals.owner_id=owners.id
GROUP BY owners.full_name
ORDER BY count DESC LIMIT 1;


-- PROJECT 04

-- •	Who was the last animal seen by William Tatcher?
SELECT animals.name AS Animal_Name, vets.name AS Vet_Name, visits.date_of_visit FROM animals
INNER JOIN visits ON animals.id = visits.animal_id
INNER JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'William Tatcher'
ORDER BY date_of_visit DESC
LIMIT 1;

-- •	How many different animals did Stephanie Mendez see?
SELECT animals.name AS animal_name, vets.name AS vet_name FROM animals
INNER JOIN visits ON visits.animal_id = animals.id
INNER JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Stephanie Mendez'; 

-- •	List all vets and their specialties, including vets with no specialties.
SELECT vets.name AS vet_name, species.name AS species_name FROM vets
LEFt JOIN specializations ON specializations.vet_id = vets.id
LEFT JOIN species ON species.id = specializations.species_id;


-- •	List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name AS animal_name, vets.name as vet_name, date_of_visit FROM animals
INNER JOIN visits ON animals.id = visits.animal_id
INNER JOIN vets ON vets.id = visits.vet_id
WHERE date_of_visit BETWEEN '2020-04-01' AND '2020-08-30'
AND vets.name='Stephanie Mendez';

-- •	What animal has the most visits to vets?
SELECT animals.name AS animal_name, COUNT(*) AS number_of_visit FROM animals
INNER JOIN visits ON animals.id = visits.animal_id
GROUP BY animals.name
ORDER BY number_of_visit DESC
LIMIT 1;

-- •	Who was Maisy Smith's first visit?
SELECT animals.name AS animal_name, vets.name AS vet_name, date_of_visit FROM animals
INNER JOIN visits ON animals.id = visits.animal_id
INNER JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Maisy Smith'
ORDER BY date_of_visit
LIMIT 1;

-- •	Details for most recent visit: animal information, vet information, and date of visit.
SELECT * FROM animals
FULL OUTER JOIN visits ON animals.id = visits.animal_id
FULL OUTER JOIN vets ON vets.id = visits.vet_id
ORDER BY date_of_visit DESC
LIMIT 1; 

-- •	How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*) AS number_of_visit_did_not_specialize FROM vets
LEFT JOIN specializations ON specializations.vet_id = vets.id
INNER JOIN visits ON visits.vet_id = vets.id
INNER JOIN animals ON animals.id = visits.animal_id
WHERE animals.species_id != specializations.species_id OR specializations.species_id IS NULL;


-- •	What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name, COUNT(*) FROM species
INNER JOIN animals ON animals.species_id = species.id
INNER JOIN visits ON visits.animal_id = animals.id
INNER JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name
ORDER BY COUNT(species.id) DESC
LIMIT 1;
