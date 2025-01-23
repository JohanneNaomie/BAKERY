-- Create Database
CREATE DATABASE bakery;

-- Connect to Database
\c bakery;

-- Create Tables

-- Unite Table MODIFc
CREATE TABLE bakery_units (
    id_unit SERIAL PRIMARY KEY,
    name_unit VARCHAR(50) NOT NULL
);

-- Ingredient Table MODIF --5 ingredients per product
CREATE TABLE bakery_ingredients (
    id_ingredient SERIAL PRIMARY KEY,
    name_ingredient VARCHAR(100) NOT NULL,
    id_unit INT REFERENCES bakery_units(id_unit),
    stock DECIMAL(10, 2) NOT NULL,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Ingredient Prices Table --one data per product
CREATE TABLE bakery_ingredient_prices (
    id_price SERIAL PRIMARY KEY,
    id_ingredient INT REFERENCES bakery_ingredients(id_ingredient),
    date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    price DECIMAL(12, 3) NOT NULL
);

-- Product Table 
CREATE TABLE bakery_products (
    id_product SERIAL PRIMARY KEY,
    name_product VARCHAR(100) NOT NULL,
    conservation_time_h DECIMAL(10, 2)
);

-- Product Prices Table --one line per product
CREATE TABLE bakery_product_prices (
    id_price SERIAL PRIMARY KEY,
    id_product INT REFERENCES bakery_products(id_product),
    price DECIMAL(12, 3) NOT NULL,
    date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Product Composition Table --- 5 lines corresponding to the 5 ingredients per product
CREATE TABLE bakery_composition_products (
    id_composition SERIAL PRIMARY KEY,
    id_product INT REFERENCES bakery_products(id_product),
    id_ingredient INT REFERENCES bakery_ingredients(id_ingredient),
    quantity DECIMAL(10, 2) NOT NULL
);

-- Production Table --make 5 porductions per product
CREATE TABLE bakery_productions (
    id_production SERIAL PRIMARY KEY,
    id_product INT REFERENCES bakery_products(id_product),
    quantity DECIMAL(10, 2) NOT NULL,
    date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);




CREATE TABLE bakery_categories (
    id_category SERIAL PRIMARY KEY,
    name_category VARCHAR(100) NOT NULL
);

-- Product Category Relationship Table
CREATE TABLE bakery_product_categories (
    id_relation SERIAL PRIMARY KEY,
    id_product INT REFERENCES bakery_products(id_product),
    id_category INT REFERENCES bakery_categories(id_category)
);

CREATE TABLE bakery_sales (
    id_sale SERIAL PRIMARY KEY,
    id_product INT REFERENCES bakery_products(id_product),
    quantity DECIMAL(10, 2) NOT NULL,
    total_price DECIMAL(12, 3) NOT NULL,
    date_sales TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
