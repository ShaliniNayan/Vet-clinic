/*Queries that provide answers to the questions from all projects.*/

select name from animals where name like '%mon';
select name from animals where date_of_birth between '2016-01-01' and '2019-12-31';
select name from animals where neutered = true and escape_attempts < 3;
select date_of_birth from animals where name in ('Agumon', 'Pikachu');
select name, escape_attempts from animals where weight_kg > 10.5;
select * from animals where neutered = true;
select * from animals where name != 'Gabumon';
select * from animals where weight_kg BETWEEN 10.4 AND 17.3;
begin;
update animals
set species = 'unspecified';
rollback;
select * from animals;
update animals
set species = 'digimon' where name like '%mon';
commit;
update animals set species = 'pokemon' where species is null;
commit;
start transaction;
delete from animals where date_of_birth > '2022-01-01';
savepoint my_savepoint;
update animals set weight_kg = weight_kg * -1;
rollback to savepoint my_savepoint;
update animals set weight_kg = weight_kg * -1 where weight_kg < 0;
commit;
select count(*) from animals;
select count(*) from animals where escape_attempts = 0;
select avg(weight_kg) from animals;
select neutered, max(escape_attempts) as max_escape_attempts from animals group by neutered;
select species, avg(escape_attempts) as avg_escape_attempts from animals where date_of_birth between '1990-01-01' and '2000-12-31' group by species;
select species, min(weight_kg) AS min_weight, max(weight_kg) as max_weight from animals group by species;

SELECT * FROM animals a JOIN owners o ON a.owner_id = o.id WHERE o.full_name = 'Melody Pond';
SELECT * FROM animals a JOIN species s ON a.species_id = s.id WHERE s.name = 'Pokemon';
SELECT o.full_name, a.name FROM owners o LEFT JOIN animals a ON o.id = a.owner_id;
SELECT s.name, COUNT(a.id) AS animal_count FROM species s LEFT JOIN animals a ON s.id = a.species_id GROUP BY s.name;
SELECT a.name FROM animals a JOIN species s ON a.species_id = s.id JOIN owners o ON a.owner_id = o.id WHERE s.name = 'Digimon' AND o.full_name = 'Jennifer Orwell';
SELECT a.name FROM animals a JOIN owners o ON a.owner_id = o.id WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;
SELECT o.full_name, COUNT(a.id) AS animal_count FROM owners o LEFT JOIN animals a ON o.id = a.owner_id GROUP BY o.full_name ORDER BY animal_count DESC LIMIT 1;

SELECT a.name FROM animals a JOIN visits v ON a.id = v.animal_id JOIN vets vt ON vt.id = v.vet_id WHERE vt.name = 'Vet William Tatcher' ORDER BY v.visit_date DESC LIMIT 1;
SELECT COUNT(DISTINCT v.animal_id) AS animal_count FROM visits v JOIN vets vt ON vt.id = v.vet_id WHERE vt.name = 'Vet Stephanie Mendez';
SELECT vt.name, s.name AS specialization FROM vets vt LEFT JOIN specializations sp ON vt.id = sp.vet_id LEFT JOIN species s ON s.id = sp.species_id;
SELECT a.name FROM animals a JOIN visits v ON a.id = v.animal_id JOIN vets vt ON vt.id = v.vet_id WHERE vt.name = 'Vet Stephanie Mendez' AND v.visit_date BETWEEN '2020-04-01' AND '2020-08-30';
SELECT a.name, COUNT(*) AS visit_count FROM animals a JOIN visits v ON a.id = v.animal_id GROUP BY a.name ORDER BY visit_count DESC LIMIT 1;
SELECT vt.name AS vet_name FROM vets vt JOIN visits v ON v.vet_id = vt.id JOIN animals a ON a.id = v.animal_id JOIN owners o ON o.id = a.owner_id WHERE o.full_name = 'Maisy Smith' ORDER BY v.visit_date ASC LIMIT 1;
SELECT a.name AS animal_name, vt.name AS vet_name, v.visit_date FROM animals a JOIN visits v ON a.id = v.animal_id JOIN vets vt ON vt.id = v.vet_id ORDER BY v.visit_date DESC LIMIT 1; 
SELECT COUNT(*) AS mismatched_visits FROM visits v JOIN vets vt ON vt.id = v.vet_id JOIN animals a ON a.id = v.animal_id LEFT JOIN specializations sp ON sp.vet_id = vt.id AND sp.species_id = a.species_id WHERE sp.vet_id IS NULL;
SELECT s.name AS potential_specialty FROM animals a JOIN visits v ON a.id = v.animal_id JOIN vets vt ON vt.id = v.vet_id JOIN owners o ON o.id = a.owner_id JOIN species s ON s.id = a.species_id WHERE o.full_name = 'Maisy Smith' GROUP BY s.name ORDER BY COUNT(*) DESC LIMIT 1;

-- Vet clinic database: database performance audit
explain analyze SELECT COUNT(*) FROM visits where animals_id = 4;
explain analyze SELECT * FROM visits where vets_id = 2;
explain analyze SELECT * FROM owners where email = 'owner_18327@mail.com';
