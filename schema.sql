/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id integer primary key generated always as identity,
    name varchar(100),
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal,
);

ALTER TABLE animals ADD COLUMN species varchar(40);


CREATE TABLE owners (
	id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	full_name VARCHAR (50) NOT NULL,
	age INT NOT NULL
);

CREATE TABLE species(
		id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
		name VARCHAR(50) NOT NULL
);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD CONSTRAINT species_id FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE animals ADD CONSTRAINT owner_id FOREIGN KEY (owner_id) REFERENCES owners(id);

