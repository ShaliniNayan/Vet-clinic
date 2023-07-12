CREATE DATABASE vet_clinic;

create table animals (
id int GENERATED ALWAYS AS IDENTITY,
 name varchar(250),
 date_of_birth date,
escape_attempts int,
neutered boolean,
weight_kg decimal,
);

ALTER TABLE animals ADD species varchar(255);

ALTER TABLE animals
    DROP COLUMN species,
    ADD COLUMN species_id INT REFERENCES species(id),
    ADD COLUMN owner_id INT REFERENCES owners(id),
    ADD PRIMARY KEY (id);

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255),
    age INT
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    age INT,
    date_of_graduation DATE
);

CREATE TABLE specializations (
    vet_id INT REFERENCES vets(id),
    species_id INT REFERENCES species(id),
    PRIMARY KEY (vet_id, species_id)
);

CREATE TABLE visits (
    vet_id INT REFERENCES vets(id),
    animal_id INT REFERENCES animals(id),
    visit_date DATE,
    PRIMARY KEY (vet_id, animal_id, visit_date)
);
