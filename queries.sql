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
