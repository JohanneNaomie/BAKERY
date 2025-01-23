-- Populate bakery_units
INSERT INTO bakery_units (name_unit)
VALUES
    ('kg'),
    ('liters'),
    ('grams'),
    ('pieces'),
    ('packs');

-- Populate bakery_ingredients
INSERT INTO bakery_ingredients (name_ingredient, id_unit, stock)
VALUES
    ('Flour', 1, 100.00),
    ('Sugar', 3, 50.00),
    ('Butter', 1, 30.00),
    ('Milk', 2, 20.00),
    ('Eggs', 4, 100.00);

-- Populate bakery_ingredient_prices
INSERT INTO bakery_ingredient_prices (id_ingredient, price)
VALUES
    (1, 2.50),  -- Flour price per kg
    (2, 1.20),  -- Sugar price per gram
    (3, 5.00),  -- Butter price per kg
    (4, 1.50),  -- Milk price per liter
    (5, 0.20);  -- Egg price per piece

-- Populate bakery_products
INSERT INTO bakery_products (name_product, conservation_time_h)
VALUES
    ('Chocolate Cake', 48.00),
    ('Croissant', 24.00),
    ('Milk Bread', 72.00);

-- Populate bakery_product_prices
INSERT INTO bakery_product_prices (id_product, price)
VALUES
    (1, 15.00),  -- Chocolate Cake price
    (2, 2.50),   -- Croissant price
    (3, 3.00);   -- Milk Bread price

-- Populate bakery_composition_products
INSERT INTO bakery_composition_products (id_product, id_ingredient, quantity)
VALUES
    (1, 1, 2.50),  -- Chocolate Cake: 2.5 kg Flour
    (1, 2, 0.50),  -- Chocolate Cake: 0.5 kg Sugar
    (1, 3, 1.00),  -- Chocolate Cake: 1 kg Butter
    (1, 5, 5.00),  -- Chocolate Cake: 5 Eggs
    (1, 4, 0.25),  -- Chocolate Cake: 0.25 liters Milk

    (2, 1, 0.30),  -- Croissant: 0.3 kg Flour
    (2, 3, 0.10),  -- Croissant: 0.1 kg Butter
    (2, 5, 1.00),  -- Croissant: 1 Egg

    (3, 1, 1.50),  -- Milk Bread: 1.5 kg Flour
    (3, 4, 0.50),  -- Milk Bread: 0.5 liters Milk
    (3, 3, 0.20);  -- Milk Bread: 0.2 kg Butter


-- Additional bakery_productions records with different dates
INSERT INTO bakery_productions (id_product, quantity, date_time)
VALUES
    (1, 8.00, '2025-01-01 08:30:00'),   -- 8 Chocolate Cakes
    (2, 40.00, '2025-01-02 09:00:00'),  -- 40 Croissants
    (3, 15.00, '2025-01-03 10:15:00'),  -- 15 Milk Breads
    (1, 12.00, '2025-01-04 08:45:00'),  -- 12 Chocolate Cakes
    (2, 60.00, '2025-01-05 09:30:00'),  -- 60 Croissants
    (3, 25.00, '2025-01-06 11:00:00'),  -- 25 Milk Breads
    (1, 5.00, '2025-01-07 07:00:00'),   -- 5 Chocolate Cakes
    (2, 30.00, '2025-01-07 08:00:00'),  -- 30 Croissants
    (3, 10.00, '2025-01-08 10:30:00'),  -- 10 Milk Breads
    (1, 20.00, '2025-01-08 11:15:00'),  -- 20 Chocolate Cakes
    (2, 70.00, '2025-01-09 09:45:00'),  -- 70 Croissants
    (3, 18.00, '2025-01-10 10:00:00'),  -- 18 Milk Breads
    (1, 9.00, '2025-01-11 08:20:00'),   -- 9 Chocolate Cakes
    (2, 55.00, '2025-01-11 09:10:00'),  -- 55 Croissants
    (3, 22.00, '2025-01-12 10:40:00');  -- 22 Milk Breads





