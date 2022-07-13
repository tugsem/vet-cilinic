/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
    animal_id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg NUMERIC NOT NULL );

ALTER TABLE animals ADD COLUMN species VARCHAR(50);

CREATE TABLE owners(
    owner_id BIGSERIAL NOT NULL PRIMARY KEY,
    full_name VARCHAR(100),
    age INT 
);

CREATE TABLE species(
    species_id BIGSERIAL NOT NULL PRIMARY KEY,
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

CREATE TABLE vets(
 id BIGSERIAL NOT NULL PRIMARY KEY,
 name VARCHAR(100),
 age INT,
 date_of_graduation DATE );

CREATE TABLE specializations (
 species_id INT,
 vet_id INT );

CREATE TABLE visits (
animal_id INT,
vet_id INT,
visit_date DATE );

ALTER TABLE specializations
ADD FOREIGN KEY(species_id) REFERENCES species(species_id);

ALTER TABLE specializations
ADD FOREIGN KEY(vet_id) REFERENCES vets(id);

/*performance audit*/

ALTER TABLE owners ADD COLUMN email VARCHAR(120);
CREATE INDEX animal_id_asc ON visits(animal_id ASC);
CREATE INDEX vets_index ON visits(vet_id);
CREATE INDEX email_asc ON owners(email ASC);