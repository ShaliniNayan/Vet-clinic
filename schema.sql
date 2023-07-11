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
