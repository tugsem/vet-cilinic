/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon%';
SELECT name FROM animals WHERE date_of_birth '2016-01-01' AND '2019-01-01';
SELECT * FROM animals WHERE neutered = 'true' AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = 'true';
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) AS escapes FROM animals GROUP BY neutered ORDER BY escapes DESC LIMIT 1;
SELECT MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01' GROUP BY species;

SELECT name FROM animals A JOIN owners O ON A.owner_id = O.owner_id AND O.full_name = 'Melody Pond';
SELECT * FROM animals A JOIN species S ON A.species_id = S.species_id AND S.species_id = 1;
SELECT O.full_name, A.name FROM owners O LEFT JOIN animals A ON A.owner_id = O.owner_id;
SELECT species.name, COUNT(*) FROM animals FULL JOIN species ON animals.species_id = species.species_id GROUP BY species.species_id;
SELECT A.name FROM animals A JOIN owners O ON O.owner_id = A.owner_id AND O.full_name = 'Jennifer Orwell'AND A.species_id = 1;
SELECT A.name, A.escape_attempts FROM animals A JOIN owners O ON A.owner_id = O.owner_id WHERE A.escape_attempts = 0 AND O.full_name = 'Dean Winchester';
SELECT O.full_name, COUNT(A.name) AS total_animals FROM owners O JOIN animals A ON A.owner_id = O.owner_id GROUP BY O.full_name ORDER BY total_animals DESC LIMIT 1;

SELECT a.name FROM visits JOIN animals a ON a.animal_id = visits.animal_id WHERE vet_id = 1 ORDER BY visit_date DESC LIMIT 1;
SELECT COUNT(DISTINCT animal_id) FROM visits WHERE vet_id = 2;

SELECT v.name, p.name FROM vets v
LEFT JOIN specializations s ON s.vet_id = v.id
LEFT JOIN species p ON p.species_id = s.species_id;

SELECT a.name FROM animals a
JOIN visits v ON a.animal_id = v.animal_id
JOIN vets t ON t.id = v.vet_id 
WHERE visit_date BETWEEN '2020-04-01' AND '2020-08-30' AND t.name = 'Stephanie Mendez';

SELECT a.name, COUNT(v.animal_id) AS visit_count FROM visits v
JOIN animals a ON a.animal_id = v.animal_id
GROUP BY a.name
ORDER BY visit_count DESC LIMIT 1;

SELECT a.name, v.visit_date FROM animals a 
JOIN visits v ON v.animal_id = a.animal_id 
JOIN vets p ON p.id = v.vet_id
WHERE p.name = 'Maisy Smith'
ORDER BY v.visit_date LIMIT 1;

SELECT * FROM animals a
JOIN visits v ON a.animal_id = v.animal_id
JOIN vets p ON p.id = v.vet_id
ORDER BY v.visit_date DESC LIMIT 1;

SELECT COUNT(visits.visit_date) FROM visits
JOIN vets v ON v.id = visits.vet_id
JOIN animals a ON a.animal_id = visits.animal_id
JOIN specializations s ON s.vet_id = v.id
WHERE s.species_id <> a.species_id;

SELECT s.name, COUNT(v.animal_id) AS count FROM visits v
JOIN vets ON vets.id = v.vet_id
JOIN animals a ON a.animal_id = v.animal_id
JOIN species s ON s.species_id = a.species_id
WHERE vets.name = 'Maisy Smith'
GROUP BY s.name
ORDER BY count DESC LIMIT 1;