/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-02-03' , 0, TRUE, 10.23 );
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15' , 2, TRUE, 8 );
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-01-7', 1, FALSE, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-05-12', 5, TRUE, 11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', '2020-02-08', 0, false, -11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', '2021-11-15', 2, true, -5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', '1993-04-02', 3, false, -12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', '2005-06-12', 1, true, -45);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', '2005-06-07', 7, true, 20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', '1998-10-13', 3, true, 17);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', '2022-05-14', 4, true, 22);


INSERT INTO owners (full_name, age)
VALUES
  ('Sam Smith', '34'),
  ('Jennifer Orwell', '19'),
	('Bob', '45'),
	('Melody Pond', '77'),
	('Dean Winchester', '14'),
	('Jodie Whittaker', '38');

INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');

BEGIN;
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';
COMMIT;

BEGIN;
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon', 'Boarmon');
COMMIT;

INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-7-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-1-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-3-4');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-5-8');

INSERT INTO specializations ( vets_id, species_id ) VALUES (1, 1);
INSERT INTO specializations ( vets_id, species_id ) VALUES (3, 1);
INSERT INTO specializations ( vets_id, species_id ) VALUES (3, 2);
INSERT INTO specializations ( vets_id, species_id ) VALUES (4, 2);

INSERT INTO visits (animal_id, vets_id, date_of_visit ) VALUES (12, 3, '2020-6-22');
INSERT INTO visits (animal_id, vets_id, date_of_visit ) VALUES (13, 4, '2021-2-2');
INSERT INTO visits (animal_id, vets_id, date_of_visit ) VALUES (14, 2, '2020-1-5');
INSERT INTO visits (animal_id, vets_id, date_of_visit ) VALUES (14, 2, '2020-3-8');
INSERT INTO visits (animal_id, vets_id, date_of_visit ) VALUES (14, 2, '2020-5-14');
INSERT INTO visits (animal_id, vets_id, date_of_visit ) VALUES (15, 3, '2021-5-4');
INSERT INTO visits (animal_id, vets_id, date_of_visit ) VALUES (16, 4, '2021-2-24');
INSERT INTO visits (animal_id, vets_id, date_of_visit ) VALUES (17, 2, '2019-12-21');
INSERT INTO visits (animal_id, vets_id, date_of_visit ) VALUES (17, 1, '2020-5-10');
INSERT INTO visits (animal_id, vets_id, date_of_visit ) VALUES (17, 2, '2021-7-7');
INSERT INTO visits (animal_id, vets_id, date_of_visit ) VALUES (18, 3, '2019-9-29');
INSERT INTO visits (animal_id, vets_id, date_of_visit ) VALUES (19, 4, '2020-10-3');
INSERT INTO visits (animal_id, vets_id, date_of_visit ) VALUES (19, 4, '2020-11-4');
INSERT INTO visits (animal_id, vets_id, date_of_visit ) VALUES (20, 2, '2019-1-24');
INSERT INTO visits (animal_id, vets_id, date_of_visit ) VALUES (20, 2, '2019-3-15');
INSERT INTO visits (animal_id, vets_id, date_of_visit ) VALUES (20, 2, '2020-2-27');
INSERT INTO visits (animal_id, vets_id, date_of_visit ) VALUES (20, 2, '2020-7-3');



