-- Data Entries for Animals
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Agumon', '2020-02-
03', 0, true, 10.23);
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Gabumon', '2018-11-15', 2, true, 8);
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Pikachu', '2021-01-07', 2, false, 15.04);
 insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Devimon', '2017-05-12', 5, true, 11);
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Charmander', '2020-02-08', 0, false, -11);
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Plantmon', '2021-11-15', 2, true, -5.7);
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Squirtle', '1993-04-02', 3, false, -12.13);
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Angemon', '2005-06-12', 1, true, -45);
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Boarmon', '2005-06-07', 7, true, 20);
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Blossom', '1998-10-13', 3, true, 17);
insert into animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values ('Ditto', '2022-05-14', 4, true, 22);

-- Data Entries for Owners
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

--Date Entries for species
INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

-- Update Data Animals
UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE name LIKE '%mon';
SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE species_id IS NULL;

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name IN ('Angemon', 'Boarmon');

-- Data for vets
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Vet William Tatcher', 45, '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Vet Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Vet Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Vet Jack Harkness', 38, '2008-06-08');

-- Data for specialties
INSERT INTO specializations (vet_id, species_id) VALUES ((SELECT id FROM vets WHERE name = 'Vet William Tatcher'), (SELECT id FROM species WHERE name = 'Pokemon'));
INSERT INTO specializations (vet_id, species_id) VALUES ((SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'), (SELECT id FROM species WHERE name = 'Digimon'));
INSERT INTO specializations (vet_id, species_id) VALUES ((SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'), (SELECT id FROM species WHERE name = 'Pokemon'));
INSERT INTO specializations (vet_id, species_id) VALUES ((SELECT id FROM vets WHERE name = 'Vet Jack Harkness'), (SELECT id FROM species WHERE name = 'Digimon'));

-- Data for visits
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Vet William Tatcher'), (SELECT id FROM animals WHERE name = 'Agumon'), '2020-05-24');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'), (SELECT id FROM animals WHERE name = 'Agumon'), '2020-07-22');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Vet Jack Harkness'), (SELECT id FROM animals WHERE name = 'Gabumon'), '2021-02-02');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), (SELECT id FROM animals WHERE name = 'Pikachu'), '2020-01-05');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), (SELECT id FROM animals WHERE name = 'Pikachu'), '2020-03-08');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), (SELECT id FROM animals WHERE name = 'Pikachu'), '2020-05-14');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'), (SELECT id FROM animals WHERE name = 'Devimon'), '2021-05-04');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Vet Jack Harkness'), (SELECT id FROM animals WHERE name = 'Charmander'), '2021-02-24');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), (SELECT id FROM animals WHERE name = 'Plantmon'), '2019-12-21');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Vet William Tatcher'), (SELECT id FROM animals WHERE name = 'Plantmon'), '2020-08-10');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), (SELECT id FROM animals WHERE name = 'Plantmon'), '2021-04-07');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'), (SELECT id FROM animals WHERE name = 'Squirtle'), '2019-09-29');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Vet Jack Harkness'), (SELECT id FROM animals WHERE name = 'Angemon'), '2020-10-03');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Vet Jack Harkness'), (SELECT id FROM animals WHERE name = 'Angemon'), '2020-11-04');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), (SELECT id FROM animals WHERE name = 'Boarmon'), '2019-01-24');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), (SELECT id FROM animals WHERE name = 'Boarmon'), '2019-05-15');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), (SELECT id FROM animals WHERE name = 'Boarmon'), '2020-02-27');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Vet Maisy Smith'), (SELECT id FROM animals WHERE name = 'Boarmon'), '2020-08-03');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Vet Stephanie Mendez'), (SELECT id FROM animals WHERE name = 'Blossom'), '2020-05-24');
INSERT INTO visits (vet_id, animal_id, visit_date) VALUES ((SELECT id FROM vets WHERE name = 'Vet William Tatcher'), (SELECT id FROM animals WHERE name = 'Blossom'), '2021-01-11');

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
