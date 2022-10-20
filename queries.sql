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
SELECT neutered, AVG(escape_attempts) FROM animals WHERE date_of_birth >= '1990-1-1' AND date_of_birth <= '2000-12-1' GROUP BY neutered;

