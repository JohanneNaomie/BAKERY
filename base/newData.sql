-- Insert Data into Unite Table
INSERT INTO bakery_units (name_unit) VALUES
('Kilogram'),
('Gram'),
('Liter'),
('Piece');

-- Insert Data into bakery_move_stocks
INSERT INTO bakery_move_stocks (id_ingredient, date_time, quantity, id_action) VALUES
-- Flour
(1, '2024-01-01 08:00:00', 200.00, 1),   -- Added 200 kg of flour
(1, '2024-01-03 14:00:00', 50.00, 2),   -- Removed 50 kg of flour for production
(1, '2024-01-05 09:00:00', 100.00, 1),   -- Added 100 kg of flour from supplier

-- Sugar
(2, '2024-01-01 09:00:00', 500.00, 1),   -- Added 500 g of sugar
(2, '2024-01-02 15:00:00', 200.00, 2),  -- Removed 200 g of sugar for production
(2, '2024-01-04 10:00:00', 300.00, 1),   -- Added 300 g of sugar

-- Milk
(3, '2024-01-01 10:00:00', 100.00, 1),   -- Added 100 liters of milk
(3, '2024-01-03 12:00:00', 50.00, 2),   -- Removed 50 liters of milk for production
(3, '2024-01-06 08:30:00', 150.00, 1),   -- Added 150 liters of milk

-- Butter
(4, '2024-01-02 08:00:00', 200.00, 1),   -- Added 200 g of butter
(4, '2024-01-04 14:30:00', 50.00, 2),   -- Removed 50 g of butter for production
(4, '2024-01-05 11:00:00', 100.00, 1),   -- Added 100 g of butter

-- Eggs
(5, '2024-01-01 07:30:00', 20.00, 1),    -- Added 20 pieces of eggs
(5, '2024-01-02 16:00:00', 10.00, 2),   -- Removed 10 pieces of eggs for production
(5, '2024-01-03 08:00:00', 30.00, 1);    -- Added 30 pieces of eggs


INSERT INTO bakery_ingredients (name_ingredient, id_unit, stock, last_update) VALUES
('Flour', 1, 250.00, '2024-01-05 09:00:01'),  -- Based on last addition of 100 kg of flour
('Sugar', 2,600.00, '2024-01-04 10:00:00'),  -- Based on last addition of 300 g of sugar
('Milk', 3, 200.00, '2024-01-06 08:30:00'),    -- Based on last addition of 150 liters of milk
('Butter', 2, 250.00, '2024-01-05 11:00:00'),  -- Based on last addition of 100 g of butter
('Eggs', 4, 40.00, '2024-01-03 08:00:00');    -- Based on last addition of 30 pieces of eggs


-- Insert Data into Ingredient Prices Table
INSERT INTO bakery_ingredient_prices (id_ingredient, price) VALUES
(1, 0.500),   -- Flour: $0.500 per kg
(2, 0.030),   -- Sugar: $0.030 per g
(3, 1.200),   -- Milk: $1.200 per liter
(4, 2.000),   -- Butter: $2.000 per g
(5, 0.200);   -- Eggs: $0.200 per piece

-- Insert Data into Product Table
INSERT INTO bakery_products (name_product, conservation_time_h) VALUES
('Bread', 24.00),        -- Conserves for 24 hours
('Cake', 48.00),         -- Conserves for 48 hours
('Cookies', 72.00);      -- Conserves for 72 hours

-- Calculate Ingredient Costs and Adjust Product Prices

-- Bread Costs
-- 1 kg Flour ($0.500) + 0.5 liters Milk ($1.200 * 0.5) + 2 Eggs ($0.200 * 2) = $1.700
-- Selling Price for Bread > $1.700
INSERT INTO bakery_product_prices (id_product, price) VALUES
(1, 3.500);  -- Bread: $3.500

-- Cake Costs
-- 0.5 kg Flour ($0.500 * 0.5) + 0.2 kg Butter ($2.000 * 0.2) + 3 Eggs ($0.200 * 3) = $1.500
-- Selling Price for Cake > $1.500
INSERT INTO bakery_product_prices (id_product, price) VALUES
(2, 5.000);  -- Cake: $5.000

-- Cookies Costs
-- 0.2 kg Flour ($0.500 * 0.2) + 100 g Sugar ($0.030 * 100) + 100 g Butter ($2.000 * 0.1) = $0.560
-- Selling Price for Cookies > $0.560
INSERT INTO bakery_product_prices (id_product, price) VALUES
(3, 2.000);  -- Cookies: $2.000

-- Insert Data into Product Composition Table
INSERT INTO bakery_composition_products (id_product, id_ingredient, quantity) VALUES
(1, 1, 1.00),   -- Bread: 1 kg Flour
(1, 3, 0.50),   -- Bread: 0.5 liters Milk
(1, 5, 2.00),   -- Bread: 2 pieces Eggs

(2, 1, 0.50),   -- Cake: 0.5 kg Flour
(2, 4, 0.20),   -- Cake: 0.2 kg Butter
(2, 5, 3.00),   -- Cake: 3 pieces Eggs

(3, 1, 0.20),   -- Cookies: 0.2 kg Flour
(3, 2, 0.10),   -- Cookies: 100 g Sugar
(3, 4, 0.10);   -- Cookies: 100 g Butter

-- Insert Data into Action Table
INSERT INTO bakery_actions (name_action) VALUES
('Add '),
('Remove ');

