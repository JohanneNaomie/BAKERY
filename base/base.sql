CREATE DATABASE bakery;
\c bakery;

CREATE TABLE bakery_unit(
    id_unit SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE bakery_ingredient (
    id_ingredient SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    id_unit int NOT NULL , 
    FOREIGN KEY (id_unit) REFERENCES bakery_unit(id_unit) 
);


