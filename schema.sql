/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name CHARVAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg NUMERIC NOT NULL );

ALTER TABLE animals ADD COLUMN species VARCHAR(50);