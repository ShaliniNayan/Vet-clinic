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
