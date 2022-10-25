/*Queries that provide answers to the questions from all projects.*/

SELECT name FROM animals WHERE name LIKE '%mon';
SELECT name,date_of_birth FROM animals WHERE date_of_birth BETWEEN '2016-01-01' and '2019-01-01';
SELECT name,neutered FROM animals WHERE neutered=TRUE AND escape_attempts < 3 ;
SELECT date_of_birth FROM animals WHERE name='Agumon' OR name='Pikachu' ;
SELECT name,escape_attempts FROM animals WHERE weight_kg > 10.5 ;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3 ;



BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
SELECT * FROM animals;
UPDATE animals SET species = 'pokemon' WHERE name NOT LIKE '%mon';
SELECT * FROM animals;
COMMIT;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
SAVEPOINT SAVEPOINT1;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
ROLLBACK TO SAVEPOINT1;
SAVEPOINT SAVEPOINT2;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT2;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) AS total_animals FROM animals;
SELECT COUNT(*) AS not_escaped FROM animals WHERE escape_attempts=0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;
SELECT neutered, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY neutered;
SELECT neutered, AVG(escape_attempts) FROM animals WHERE date_of_birth >= '1990-1-1' AND date_of_birth <= '2000-12-31' GROUP BY neutered;


SELECT animals.name, owners.full_name FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE animals.owner_id = 4;

SELECT animals.name, species.name FROM animals INNER JOIN species ON animals.species_id = species.id WHERE species.name='Pokemon';

SELECT animals.name, owners.full_name FROM animals LEFT JOIN owners ON animals.owner_id = owners.id;

SELECT species.name, COUNT(animals.species_id) FROM animals JOIN species ON species.id = animals.species_id GROUP BY species.name;

SELECT animals.name AS animal_name , owners.full_name AS owner_name FROM animals INNER JOIN owners ON owners.id = 2 AND species_id = 2;

SELECT animals.name, owners.full_name FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE owners.id = 5 AND animals.escape_attempts = 0;

SELECT full_name, COUNT(owner_id) FROM owners JOIN animals on owners.id = animals.owner_id GROUP BY full_name ORDER BY COUNT (owner_id) desc limit 1;


SELECT animals.name, vets.name, visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animal_id JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'William Tatcher' ORDER BY visits.date_of_visit DESC LIMIT 1;
SELECT count(animals.name) AS visited_by_Stephanie FROM animals INNER JOIN visits ON animals.id = visits.animal_id INNER JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'Stephanie Mendez';
SELECT vets.name, species.name AS specialization FROM vets LEFT JOIN specializations ON vets.id = specializations.vets_id LEFT JOIN species ON species.id = specializations.species_id;
SELECT animals.name AS animal, vets.name AS vet, visits.date_of_visit AS date FROM animals INNER JOIN visits ON animals.id = visits.animal_id INNER JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit >= '2020-04-01' AND visits.date_of_visit <= '2020-08-30';
SELECT animals.name, count(*) FROM animals INNER JOIN visits ON animals.id = visits.animal_id GROUP BY animals.name ORDER BY count DESC LIMIT 1;
SELECT animals.name AS animal, vets.name AS vet, visits.date_of_visit AS date FROM animals INNER JOIN visits ON animals.id = visits.animal_id INNER JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'Maisy Smith' ORDER BY visits.date_of_visit LIMIT 1;
SELECT visits.date_of_visit, animals.name AS animal, vets.name AS vet FROM animals INNER JOIN visits ON animals.id = visits.animal_id INNER JOIN vets ON vets.id = visits.vets_id ORDER BY visits.date_of_visit DESC LIMIT 1;
SELECT count(visits.animal_id), vets.name AS vet FROM animals INNER JOIN visits ON animals.id = visits.animal_id INNER JOIN vets ON visits.vets_id = vets.id INNER JOIN specializations ON vets.id = specializations.vets_id INNER JOIN species ON species.id = specializations.species_id WHERE animals.species_id != specializations.species_id GROUP BY vets.name;
SELECT species.name AS species, COUNT(*) FROM visits JOIN vets ON vets.id = visits.vets_id JOIN animals ON animals.id = visits.animal_id JOIN species ON species.id = animals.species_id WHERE vets.name = 'Maisy Smith' GROUP BY species.name ORDER BY count DESC LIMIT 1;

EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 4;
EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2;
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';

EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 4;
EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2;
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';
