/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg NUMERIC NOT NULL );

ALTER TABLE animals ADD COLUMN species VARCHAR(50);

CREATE TABLE owners(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    full_name VARCHAR(100),
    age INT 
);

CREATE TABLE species(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(100)
)

ALTER TABLE animals 
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INT;

ALTER TABLE animals
ADD COLUMN owner_id INT;

ALTER TABLE animals
ADD FOREIGN KEY(species_id) REFERENCES species(species_id);

ALTER TABLE animals
ADD FOREIGN KEY(owner_id) REFERENCES owners(owner_id);
