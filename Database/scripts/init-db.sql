CREATE TABLE stores (
    store_id SERIAL NOT NULL,
    store_name VARCHAR(30) NOT NULL,
    street_address VARCHAR(50) NOT NULL,
    city_address VARCHAR(50) NOT NULL,
    state_address VARCHAR(2) NOT NULL,
    zip_address VARCHAR (6) NOT NULL,
    date_created DATE NOT NULL,
    last_updated DATE NULL,

    PRIMARY KEY (store_id),
    CONSTRAINT unique_stores UNIQUE (store_name, street_address, zip_address)
);

CREATE TABLE brands (
    brand_id SERIAL NOT NULL,
    brand_name VARCHAR(50) NOT NULL,
    date_created DATE NOT NULL,
    last_updated DATE NULL,

    PRIMARY KEY (brand_id)
);

CREATE TABLE products (
    product_id SERIAL NOT NULL,
    brand_id INT NULL,
    unit DECIMAL NULL,
    unit_type VARCHAR(15) NULL,
    product_name VARCHAR(50) NOT NULL,
    date_created DATE NOT NULL,
    last_updated DATE NULL,

    PRIMARY KEY (product_id),
    CONSTRAINT unique_products UNIQUE (product_name, brand_id, unit, unit_type),
    FOREIGN KEY (brand_id) REFERENCES brands(brand_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE users (
    user_id SERIAL NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    street_address VARCHAR(50) NOT NULL,
    city_address VARCHAR(50) NOT NULL,
    state_address VARCHAR(2) NOT NULL,
    zip_address VARCHAR (6) NOT NULL,
    date_created DATE NOT NULL,
    last_updated DATE NULL,

    PRIMARY KEY (user_id)
);

CREATE TABLE transactions (
    transaction_id SERIAL NOT NULL,
    user_id INT NOT NULL,
    store_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity DECIMAL NOT NULL,
    cost DECIMAL(12, 2) NOT NULL,
    transaction_date DATE NOT NULL,

    PRIMARY KEY (transaction_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (store_id) REFERENCES stores(store_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO brands (brand_name, date_created) VALUES ('Dole', '2020-07-16');
INSERT INTO brands (brand_name, date_created) VALUES ('Tide', '2024-04-07');
INSERT INTO brands (brand_name, date_created) VALUES ('Hormel', '2020-06-06');
INSERT INTO brands (brand_name, date_created) VALUES ('Tyson', '2023-01-22');
INSERT INTO brands (brand_name, date_created) VALUES ('Lipton', '2023-04-09');
INSERT INTO brands (brand_name, date_created) VALUES ('Kellogg''s', '2024-05-30');
INSERT INTO brands (brand_name, date_created) VALUES ('Nestlé', '2020-12-31');
INSERT INTO brands (brand_name, date_created) VALUES ('Heinz', '2020-02-10');
INSERT INTO brands (brand_name, date_created) VALUES ('Del Monte', '2022-02-23');
INSERT INTO brands (brand_name, date_created) VALUES ('Cheerios', '2020-07-23');
INSERT INTO brands (brand_name, date_created) VALUES ('PepsiCo', '2024-03-26');
INSERT INTO brands (brand_name, date_created) VALUES ('Velveeta', '2025-04-13');
INSERT INTO brands (brand_name, date_created) VALUES ('Hunt''s', '2021-09-27');
INSERT INTO brands (brand_name, date_created) VALUES ('Barilla', '2022-02-03');
INSERT INTO brands (brand_name, date_created) VALUES ('Ben & Jerry''s', '2023-08-31');
INSERT INTO brands (brand_name, date_created) VALUES ('Gatorade', '2023-12-07');
INSERT INTO brands (brand_name, date_created) VALUES ('Nature Valley', '2023-06-19');
INSERT INTO brands (brand_name, date_created) VALUES ('Progresso', '2023-11-24');
INSERT INTO brands (brand_name, date_created) VALUES ('Eggo', '2024-10-14');
INSERT INTO brands (brand_name, date_created) VALUES ('General Mills', '2022-09-17');
INSERT INTO brands (brand_name, date_created) VALUES ('Ocean Spray', '2022-08-09');
INSERT INTO brands (brand_name, date_created) VALUES ('Coca-Cola', '2024-04-08');
INSERT INTO brands (brand_name, date_created) VALUES ('Quaker', '2021-04-11');
INSERT INTO brands (brand_name, date_created) VALUES ('Campbell''s', '2023-10-16');
INSERT INTO brands (brand_name, date_created) VALUES ('Chobani', '2021-05-26');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (21, 1.18, 'bottle', 'potato chips', '2022-03-08');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (22, 1.33, 'pouch', 'canned tuna', '2023-03-17');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (11, 3.06, 'carton', 'greek yogurt', '2021-02-08');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (6, 4.63, 'jar', 'macaroni', '2024-03-02');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (3, 1.55, 'bag', 'sports drink', '2020-06-08');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (3, 4.69, 'pouch', 'greek yogurt', '2022-05-12');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (4, 4.2, 'carton', 'peanut butter', '2021-09-20');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (2, 1.7, 'carton', 'spaghetti', '2023-09-20');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (23, 3.81, 'tray', 'granola bars', '2020-08-09');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (22, 3.17, 'can', 'frozen pizza', '2024-08-08');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (18, 1.15, 'bag', 'macaroni', '2022-08-07');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (8, 4.34, 'can', 'granola bars', '2024-01-30');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (15, 1.87, 'pouch', 'cheddar cheese', '2020-04-25');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (17, 0.54, 'carton', 'greek yogurt', '2023-07-13');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (18, 0.56, 'pack', 'canned tuna', '2020-10-27');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (24, 2.09, 'can', 'ketchup', '2022-01-30');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (23, 2.87, 'jar', 'sports drink', '2021-09-28');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (14, 2.25, 'pouch', 'tea bags', '2021-04-23');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (2, 3.67, 'container', 'potato chips', '2025-02-12');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (1, 2.4, 'pack', 'spaghetti', '2023-11-03');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (16, 0.85, 'bottle', 'spaghetti', '2022-05-09');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (19, 0.69, 'pouch', 'multigrain cereal', '2024-11-19');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (8, 1.16, 'bottle', 'applesauce', '2021-10-01');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (24, 1.48, 'carton', 'corn flakes', '2022-05-27');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (1, 4.64, 'bag', 'sports drink', '2021-08-23');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (4, 1.02, 'pouch', 'frozen pizza', '2021-09-21');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (9, 3.8, 'carton', 'corn flakes', '2020-07-15');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (19, 2.88, 'pouch', 'spaghetti', '2023-01-16');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (20, 0.95, 'pack', 'cheddar cheese', '2021-04-06');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (25, 0.63, 'can', 'tea bags', '2020-03-10');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (5, 3.08, 'carton', 'corn flakes', '2021-04-27');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (25, 2.21, 'pack', 'bottled water', '2023-10-03');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (4, 4.46, 'tray', 'tomato soup', '2020-06-03');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (16, 2.03, 'container', 'multigrain cereal', '2021-12-12');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (17, 4.0, 'bag', 'ketchup', '2022-01-10');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (13, 4.83, 'jar', 'cheddar cheese', '2021-01-19');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (10, 1.08, 'bag', 'canned tuna', '2022-03-11');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (18, 4.41, 'container', 'macaroni', '2022-04-19');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (15, 4.7, 'bag', 'potato chips', '2023-07-12');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (13, 2.7, 'box', 'vanilla ice cream', '2024-02-03');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (12, 4.46, 'bottle', 'bottled water', '2022-07-09');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (15, 0.78, 'container', 'macaroni', '2022-02-14');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (10, 0.85, 'can', 'sports drink', '2021-01-02');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (5, 4.86, 'carton', 'granola bars', '2023-08-10');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (21, 1.59, 'bag', 'ketchup', '2021-01-02');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (9, 1.6, 'container', 'macaroni', '2020-07-11');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (7, 4.69, 'pack', 'canned tuna', '2024-04-23');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (22, 1.75, 'pouch', 'granola bars', '2022-12-13');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (9, 4.4, 'bottle', 'greek yogurt', '2023-09-09');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (8, 3.48, 'carton', 'chocolate milk', '2022-03-17');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (11, 4.95, 'pouch', 'pineapple', '2024-06-29');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (6, 4.04, 'bag', 'sports drink', '2020-09-30');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (17, 2.73, 'bag', 'tomato soup', '2021-03-18');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (11, 2.06, 'tray', 'cheddar cheese', '2021-03-01');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (11, 4.62, 'tray', 'tomato soup', '2021-01-24');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (8, 1.32, 'jar', 'ketchup', '2023-03-30');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (18, 2.64, 'bottle', 'vanilla ice cream', '2023-04-14');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (25, 2.75, 'bottle', 'cheddar cheese', '2022-06-15');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (17, 4.66, 'bag', 'canned tuna', '2020-12-13');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (4, 3.74, 'carton', 'peanut butter', '2022-05-03');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (24, 0.6, 'jar', 'tomato soup', '2020-12-28');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (6, 3.75, 'pack', 'vanilla ice cream', '2022-02-20');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (9, 3.67, 'bottle', 'pineapple', '2022-02-25');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (3, 4.7, 'can', 'canned tuna', '2025-03-12');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (8, 0.93, 'container', 'vanilla ice cream', '2021-01-26');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (2, 3.77, 'tray', 'granola bars', '2020-08-01');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (3, 2.55, 'bottle', 'laundry detergent', '2024-08-08');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (11, 2.14, 'container', 'peanut butter', '2023-02-25');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (12, 2.7, 'bag', 'peanut butter', '2020-08-23');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (14, 0.84, 'tray', 'pineapple', '2021-01-26');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (7, 3.1, 'bottle', 'bottled water', '2021-05-03');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (16, 4.09, 'carton', 'canned tuna', '2022-04-25');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (10, 1.03, 'carton', 'cheddar cheese', '2020-04-07');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (22, 1.12, 'box', 'sports drink', '2024-09-23');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (21, 3.49, 'can', 'breakfast waffles', '2020-11-29');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (8, 1.97, 'pack', 'chicken breast', '2021-06-25');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (17, 4.6, 'pouch', 'potato chips', '2023-01-27');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (3, 4.7, 'bag', 'corn flakes', '2020-03-12');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (20, 4.49, 'box', 'cheddar cheese', '2023-08-04');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (6, 4.44, 'bag', 'macaroni', '2021-08-31');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (2, 1.0, 'carton', 'greek yogurt', '2020-06-05');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (13, 2.14, 'carton', 'potato chips', '2021-02-23');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (20, 1.22, 'carton', 'multigrain cereal', '2024-01-23');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (21, 2.66, 'pack', 'laundry detergent', '2020-02-26');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (22, 2.27, 'bottle', 'orange juice', '2023-05-11');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (2, 0.73, 'jar', 'granola bars', '2023-08-23');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (10, 3.11, 'box', 'potato chips', '2022-03-01');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (16, 4.4, 'bag', 'laundry detergent', '2020-05-21');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (25, 4.26, 'jar', 'frozen pizza', '2023-04-08');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (21, 1.35, 'tray', 'breakfast waffles', '2024-08-13');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (1, 2.0, 'bag', 'multigrain cereal', '2025-02-11');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (15, 3.06, 'jar', 'breakfast waffles', '2024-07-05');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (15, 4.5, 'box', 'potato chips', '2022-05-18');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (22, 2.09, 'jar', 'vanilla ice cream', '2024-12-14');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (21, 1.59, 'bag', 'multigrain cereal', '2021-03-29');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (17, 0.53, 'bag', 'pineapple', '2023-12-05');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (17, 2.52, 'pouch', 'granola bars', '2023-02-26');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (6, 2.64, 'box', 'chicken breast', '2023-03-07');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (22, 3.73, 'pack', 'spaghetti', '2022-01-18');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (11, 1.71, 'pouch', 'breakfast waffles', '2020-12-15');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (23, 2.71, 'box', 'breakfast waffles', '2020-08-31');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (8, 2.65, 'container', 'tomato soup', '2024-12-15');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (7, 4.53, 'can', 'vanilla ice cream', '2021-01-31');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (23, 2.19, 'bottle', 'pineapple', '2020-01-06');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (13, 1.86, 'pack', 'pineapple', '2020-05-20');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (7, 4.14, 'tray', 'cola', '2021-08-20');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (1, 3.78, 'bag', 'frozen pizza', '2023-07-05');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (5, 2.85, 'container', 'canned tuna', '2021-12-12');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (25, 2.25, 'bottle', 'cola', '2021-06-04');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (14, 3.28, 'container', 'chicken breast', '2022-01-15');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (23, 2.2, 'bottle', 'bottled water', '2024-12-24');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (19, 3.84, 'bag', 'bottled water', '2022-11-16');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (5, 2.01, 'pack', 'applesauce', '2024-06-02');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (1, 3.14, 'box', 'greek yogurt', '2022-09-23');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (22, 0.51, 'bag', 'frozen pizza', '2023-01-07');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (8, 0.57, 'jar', 'canned tuna', '2020-01-19');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (6, 2.86, 'tray', 'pineapple', '2025-01-14');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (18, 1.99, 'carton', 'chocolate milk', '2024-11-10');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (12, 1.64, 'container', 'spaghetti', '2023-03-06');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (7, 1.34, 'can', 'orange juice', '2023-08-05');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (3, 2.76, 'pack', 'peanut butter', '2023-12-05');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (21, 4.37, 'tray', 'peanut butter', '2023-07-09');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (23, 1.41, 'pack', 'applesauce', '2021-07-09');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (7, 4.81, 'container', 'cheddar cheese', '2022-07-07');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (14, 4.59, 'pouch', 'orange juice', '2020-02-10');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (2, 4.86, 'pack', 'greek yogurt', '2022-08-19');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (18, 1.48, 'tray', 'canned tuna', '2021-08-02');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (2, 3.03, 'tray', 'spaghetti', '2020-09-10');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (16, 3.39, 'container', 'granola bars', '2022-11-07');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (23, 4.63, 'box', 'bottled water', '2021-07-26');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (17, 2.48, 'can', 'tomato soup', '2021-05-11');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (12, 2.24, 'jar', 'frozen pizza', '2023-04-21');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (18, 0.61, 'box', 'sports drink', '2020-01-11');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (5, 0.89, 'pack', 'laundry detergent', '2025-04-12');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (6, 3.85, 'box', 'bottled water', '2024-08-30');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (23, 2.63, 'bottle', 'sports drink', '2020-02-17');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (13, 4.04, 'can', 'tomato soup', '2022-04-07');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (6, 4.33, 'pouch', 'peanut butter', '2020-05-01');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (21, 4.28, 'can', 'multigrain cereal', '2025-03-09');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (6, 3.08, 'bag', 'breakfast waffles', '2024-02-24');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (5, 0.62, 'bag', 'corn flakes', '2020-09-25');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (20, 4.75, 'can', 'orange juice', '2020-03-12');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (11, 4.61, 'can', 'bottled water', '2025-03-13');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (7, 1.3, 'bag', 'chocolate milk', '2025-01-12');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (3, 3.34, 'pack', 'vanilla ice cream', '2025-01-23');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (5, 0.75, 'box', 'bottled water', '2022-04-07');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (1, 3.06, 'carton', 'orange juice', '2022-11-05');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (6, 4.99, 'pack', 'macaroni', '2020-06-25');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (16, 4.77, 'carton', 'greek yogurt', '2023-12-20');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (9, 3.3, 'pack', 'greek yogurt', '2021-05-21');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (12, 2.65, 'bottle', 'chicken breast', '2020-06-29');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (1, 4.57, 'can', 'corn flakes', '2020-03-20');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (7, 1.3, 'container', 'tomato soup', '2024-09-02');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (11, 4.21, 'carton', 'peanut butter', '2021-11-29');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (17, 3.54, 'bag', 'granola bars', '2023-12-16');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (8, 3.43, 'bottle', 'spaghetti', '2022-06-07');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (16, 1.6, 'box', 'greek yogurt', '2024-07-08');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (16, 4.7, 'bag', 'cola', '2025-03-11');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (20, 1.9, 'tray', 'granola bars', '2024-05-13');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (19, 2.0, 'pouch', 'vanilla ice cream', '2023-09-11');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (5, 3.64, 'can', 'laundry detergent', '2020-09-24');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (1, 4.25, 'tray', 'canned tuna', '2022-12-09');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (18, 3.02, 'pouch', 'vanilla ice cream', '2020-12-31');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (16, 2.31, 'jar', 'applesauce', '2022-11-28');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (10, 4.94, 'can', 'canned tuna', '2020-01-09');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (6, 2.02, 'carton', 'cheddar cheese', '2025-02-01');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (17, 4.85, 'bag', 'ketchup', '2020-11-26');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (8, 4.89, 'bottle', 'tea bags', '2020-09-11');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (14, 4.25, 'carton', 'corn flakes', '2021-12-18');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (24, 4.43, 'bottle', 'tomato soup', '2022-05-26');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (4, 4.47, 'pack', 'chicken breast', '2022-05-27');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (9, 5.0, 'tray', 'greek yogurt', '2022-05-25');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (22, 3.55, 'bag', 'breakfast waffles', '2024-08-07');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (4, 1.38, 'pack', 'canned tuna', '2023-05-02');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (18, 3.83, 'container', 'applesauce', '2020-04-24');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (25, 4.57, 'carton', 'tea bags', '2023-03-21');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (9, 3.05, 'carton', 'sports drink', '2023-05-24');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (5, 1.32, 'bag', 'spaghetti', '2022-02-10');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (21, 4.17, 'carton', 'laundry detergent', '2021-11-09');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (15, 0.98, 'bottle', 'chicken breast', '2021-02-05');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (12, 4.08, 'tray', 'frozen pizza', '2024-11-08');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (18, 1.75, 'jar', 'vanilla ice cream', '2021-07-15');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (7, 1.72, 'pack', 'spaghetti', '2023-03-31');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (15, 3.73, 'tray', 'sports drink', '2023-12-10');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (3, 1.6, 'box', 'granola bars', '2024-11-17');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (17, 2.18, 'bottle', 'greek yogurt', '2025-01-23');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (19, 1.85, 'can', 'vanilla ice cream', '2021-02-02');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (16, 2.74, 'pack', 'sports drink', '2024-11-28');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (24, 1.73, 'pouch', 'corn flakes', '2021-03-23');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (17, 1.98, 'container', 'tea bags', '2021-12-21');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (17, 4.82, 'pack', 'multigrain cereal', '2020-10-22');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (8, 3.22, 'jar', 'frozen pizza', '2025-02-02');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (6, 0.91, 'container', 'breakfast waffles', '2021-01-25');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (23, 0.77, 'carton', 'pineapple', '2024-09-11');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (16, 3.35, 'can', 'laundry detergent', '2025-04-08');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (23, 1.8, 'bag', 'chocolate milk', '2021-04-16');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (13, 2.94, 'pack', 'breakfast waffles', '2022-12-21');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (13, 2.03, 'pack', 'peanut butter', '2021-04-01');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (12, 3.2, 'jar', 'breakfast waffles', '2024-10-14');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (10, 4.91, 'bag', 'bottled water', '2025-02-26');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (22, 4.63, 'can', 'frozen pizza', '2024-11-09');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (8, 4.14, 'tray', 'macaroni', '2020-06-11');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (24, 1.17, 'bag', 'ketchup', '2023-01-06');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (23, 2.77, 'box', 'tomato soup', '2020-06-02');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (2, 4.25, 'jar', 'canned tuna', '2020-04-06');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (24, 4.3, 'jar', 'frozen pizza', '2022-06-28');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (13, 3.1, 'can', 'tea bags', '2022-09-23');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (24, 1.57, 'box', 'multigrain cereal', '2020-06-27');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (8, 2.44, 'box', 'orange juice', '2020-07-28');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (22, 2.21, 'bag', 'peanut butter', '2024-06-10');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (10, 4.61, 'box', 'vanilla ice cream', '2020-04-05');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (22, 0.69, 'carton', 'chicken breast', '2020-08-13');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (11, 4.6, 'bottle', 'canned tuna', '2022-09-06');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (8, 1.71, 'jar', 'tomato soup', '2022-01-19');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (5, 2.35, 'tray', 'chicken breast', '2025-03-23');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (1, 2.96, 'bottle', 'chicken breast', '2025-03-17');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (16, 1.52, 'pouch', 'peanut butter', '2023-08-01');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (1, 2.09, 'pack', 'chicken breast', '2021-06-26');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (23, 1.66, 'pouch', 'macaroni', '2025-04-19');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (6, 3.88, 'container', 'orange juice', '2024-01-26');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (2, 2.25, 'container', 'ketchup', '2022-11-28');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (1, 2.37, 'carton', 'vanilla ice cream', '2022-12-08');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (14, 1.02, 'tray', 'potato chips', '2022-08-27');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (12, 2.96, 'carton', 'canned tuna', '2020-10-22');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (18, 3.15, 'pouch', 'granola bars', '2024-11-03');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (3, 1.54, 'pack', 'potato chips', '2020-06-06');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (4, 3.96, 'pouch', 'canned tuna', '2021-10-23');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (14, 4.95, 'container', 'tomato soup', '2022-10-19');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (6, 3.99, 'bottle', 'canned tuna', '2021-10-16');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (5, 0.84, 'jar', 'greek yogurt', '2021-10-06');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (23, 4.46, 'jar', 'orange juice', '2021-01-11');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (25, 3.52, 'box', 'laundry detergent', '2021-06-14');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (3, 2.35, 'pouch', 'applesauce', '2020-04-27');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (6, 1.17, 'can', 'applesauce', '2024-10-09');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (4, 1.36, 'box', 'multigrain cereal', '2024-12-04');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (16, 1.33, 'bottle', 'bottled water', '2024-08-16');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (12, 3.88, 'box', 'ketchup', '2022-02-16');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (17, 0.77, 'can', 'pineapple', '2020-10-16');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (11, 1.33, 'bottle', 'vanilla ice cream', '2021-12-05');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (13, 4.94, 'bag', 'tea bags', '2023-10-22');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (15, 4.42, 'pouch', 'tomato soup', '2023-05-25');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (19, 2.98, 'pack', 'orange juice', '2021-07-12');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (8, 4.39, 'tray', 'orange juice', '2022-11-05');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (20, 3.1, 'pouch', 'greek yogurt', '2022-10-13');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (5, 2.8, 'pouch', 'tea bags', '2022-04-08');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (24, 1.54, 'carton', 'macaroni', '2023-01-27');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (16, 4.95, 'bottle', 'corn flakes', '2020-07-11');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (12, 3.98, 'container', 'tomato soup', '2021-05-13');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (8, 0.57, 'jar', 'granola bars', '2023-07-06');
INSERT INTO products (brand_id, unit, unit_type, product_name, date_created)
                            VALUES (14, 3.51, 'box', 'cheddar cheese', '2023-03-19');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Vons', '213 James Ports', 'Long Beach', 'CA', '99706', '2020-03-18');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Albertsons', '10390 Brown Viaduct', 'Long Beach', 'CA', '44321', '2020-07-05');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Albertsons', '4072 Poole Causeway Apt. 085', 'Anaheim', 'CA', '76133', '2021-12-15');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Albertsons', '5084 Ortiz Trace Apt. 659', 'Burbank', 'CA', '41581', '2020-11-14');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Trader Joe''s', '598 Hall Square Apt. 894', 'Anaheim', 'CA', '04076', '2023-09-23');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Albertsons', '3577 Brian Rapids', 'Pasadena', 'CA', '81770', '2023-07-23');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Ralphs', '896 Amy Flats Suite 790', 'Burbank', 'CA', '80844', '2024-09-09');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Grocery Outlet', '94570 Lopez Burgs Suite 194', 'Pasadena', 'CA', '66851', '2021-01-28');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Ralphs', '90019 Allen Drive Apt. 907', 'Glendale', 'CA', '79546', '2023-11-18');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Trader Joe''s', '332 Brown Curve Apt. 783', 'Pasadena', 'CA', '81465', '2021-06-07');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Albertsons', '007 Elizabeth Inlet', 'Burbank', 'CA', '15391', '2024-12-19');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Albertsons', '148 Thomas Groves Apt. 583', 'Pasadena', 'CA', '26877', '2024-06-23');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Grocery Outlet', '08170 Sarah Underpass', 'Santa Ana', 'CA', '50127', '2021-05-11');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Vons', '587 Adam Ford', 'Long Beach', 'CA', '98198', '2022-12-13');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Ralphs', '9422 Rodriguez Causeway', 'Irvine', 'CA', '84477', '2022-04-17');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Albertsons', '629 Rogers Burg Apt. 306', 'Fullerton', 'CA', '37143', '2024-09-16');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Albertsons', '5789 Peterson Streets Suite 238', 'Anaheim', 'CA', '11239', '2021-01-29');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Albertsons', '538 Thomas Park Suite 766', 'Anaheim', 'CA', '85295', '2021-09-17');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Ralphs', '795 Mcdonald Groves Suite 631', 'Pasadena', 'CA', '46979', '2023-03-17');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Grocery Outlet', '7247 Christopher Lock', 'Burbank', 'CA', '28804', '2024-12-28');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Smart & Final', '2379 Huff Stream', 'Glendale', 'CA', '59742', '2024-08-16');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Albertsons', '470 Williams Run', 'Irvine', 'CA', '66819', '2024-12-08');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Grocery Outlet', '9320 Howell Estates Apt. 687', 'Glendale', 'CA', '60188', '2022-08-06');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Grocery Outlet', '0170 Smith Circles Apt. 580', 'Pasadena', 'CA', '59330', '2023-10-04');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Trader Joe''s', '511 Davidson Mills Suite 014', 'Pasadena', 'CA', '93426', '2024-09-19');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Smart & Final', '692 Johnson Wells', 'Burbank', 'CA', '03770', '2023-07-17');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Grocery Outlet', '980 Donna Via Apt. 732', 'Irvine', 'CA', '68265', '2024-05-14');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Smart & Final', '40883 Yu Extensions', 'Irvine', 'CA', '53354', '2023-11-27');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Smart & Final', '36317 Singh Loaf Suite 091', 'Santa Ana', 'CA', '36362', '2023-12-05');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Ralphs', '05825 Amy Crest Apt. 215', 'Los Angeles', 'CA', '57500', '2021-12-30');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Vons', '149 Spencer Shores Apt. 095', 'Burbank', 'CA', '52814', '2022-11-06');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Grocery Outlet', '484 Alexander Forks Suite 194', 'Anaheim', 'CA', '13374', '2020-11-15');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Vons', '8663 Flores Vista', 'Long Beach', 'CA', '99298', '2024-11-06');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Trader Joe''s', '61556 Anderson Throughway', 'Long Beach', 'CA', '39538', '2021-07-17');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Smart & Final', '4049 Anthony Knoll', 'Orange', 'CA', '51446', '2020-12-22');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Vons', '76995 Schneider Forks Suite 336', 'Burbank', 'CA', '04651', '2020-10-13');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Vons', '18001 Clayton Station Suite 348', 'Orange', 'CA', '24821', '2024-12-01');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Albertsons', '158 Burton Creek', 'Glendale', 'CA', '67092', '2022-10-08');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Albertsons', '469 Barr Club', 'Glendale', 'CA', '10479', '2021-07-31');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Smart & Final', '6436 Wells Drives Apt. 225', 'Glendale', 'CA', '40506', '2022-03-21');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Smart & Final', '4027 Benjamin Valleys Suite 884', 'Los Angeles', 'CA', '61755', '2020-02-28');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Trader Joe''s', '5310 Nancy Radial', 'Irvine', 'CA', '64123', '2021-07-13');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Albertsons', '65062 Renee Forest Apt. 734', 'Anaheim', 'CA', '81398', '2021-01-13');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Ralphs', '230 Dixon Centers', 'Glendale', 'CA', '78218', '2024-01-12');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Trader Joe''s', '614 Andrea Trail Suite 040', 'Orange', 'CA', '52237', '2024-04-29');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Albertsons', '450 Jacob Parks', 'Burbank', 'CA', '85912', '2024-03-23');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Smart & Final', '238 Cole Mountain', 'Pasadena', 'CA', '63134', '2020-07-19');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Trader Joe''s', '049 Jimenez Greens', 'Los Angeles', 'CA', '28924', '2020-08-12');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Vons', '0041 Harris Stravenue', 'Santa Ana', 'CA', '49567', '2024-02-09');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Smart & Final', '4067 Adams Oval Suite 796', 'Burbank', 'CA', '77095', '2023-04-20');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Albertsons', '4594 Jorge Mills Suite 552', 'Santa Ana', 'CA', '50662', '2023-03-24');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Ralphs', '22747 Mary Heights', 'Orange', 'CA', '42611', '2022-08-15');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Vons', '3571 Fisher Trafficway Suite 830', 'Orange', 'CA', '85473', '2023-12-16');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Albertsons', '3099 Ronald Tunnel Apt. 939', 'Pasadena', 'CA', '91846', '2022-12-04');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Smart & Final', '64906 Derrick Mountain', 'Long Beach', 'CA', '56924', '2022-02-16');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Smart & Final', '1519 Harris Station Suite 374', 'Los Angeles', 'CA', '29342', '2024-10-05');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Grocery Outlet', '1312 Bennett Expressway Apt. 120', 'Anaheim', 'CA', '57185', '2025-01-18');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Smart & Final', '2359 Jordan Ports', 'Long Beach', 'CA', '43638', '2020-01-26');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Grocery Outlet', '01160 John Harbors Apt. 859', 'Santa Ana', 'CA', '73655', '2024-03-10');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Grocery Outlet', '9232 Joseph Prairie Apt. 532', 'Santa Ana', 'CA', '73416', '2024-01-31');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Grocery Outlet', '66668 Byrd Drives', 'Anaheim', 'CA', '61653', '2023-03-01');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Smart & Final', '3102 Karen Stravenue Apt. 126', 'Santa Ana', 'CA', '36707', '2022-03-18');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Trader Joe''s', '1082 Kristina Trail', 'Anaheim', 'CA', '04985', '2020-05-19');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Trader Joe''s', '93631 Randy Shores', 'Glendale', 'CA', '69959', '2022-09-03');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Ralphs', '25304 Calhoun Freeway', 'Irvine', 'CA', '62149', '2024-11-27');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Vons', '7285 Goodwin Knoll', 'Long Beach', 'CA', '16078', '2021-02-13');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Albertsons', '7676 Powell Springs Suite 416', 'Burbank', 'CA', '21372', '2024-08-24');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Smart & Final', '527 Thomas Fields', 'Fullerton', 'CA', '89544', '2022-03-06');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Grocery Outlet', '4092 Stephanie Views', 'Burbank', 'CA', '44621', '2020-12-26');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Smart & Final', '143 Vincent Shore', 'Orange', 'CA', '93440', '2022-05-03');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Vons', '0253 Sosa Mill', 'Fullerton', 'CA', '29246', '2024-07-05');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Ralphs', '910 Mcdaniel Key Apt. 467', 'Fullerton', 'CA', '60044', '2023-12-23');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Smart & Final', '3581 Bradford Mountain Apt. 388', 'Orange', 'CA', '09557', '2022-08-04');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Vons', '507 Ward Squares', 'Glendale', 'CA', '81047', '2021-03-03');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Ralphs', '0130 Lori Pines', 'Santa Ana', 'CA', '35459', '2022-11-08');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Vons', '1133 Gomez Radial', 'Burbank', 'CA', '75604', '2021-09-04');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Ralphs', '9209 Lacey Prairie', 'Fullerton', 'CA', '05754', '2020-02-25');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Grocery Outlet', '56093 Clayton Points', 'Long Beach', 'CA', '12263', '2022-06-26');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Vons', '31903 Serrano Land', 'Burbank', 'CA', '03573', '2020-12-25');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Trader Joe''s', '70293 Molly Mills', 'Orange', 'CA', '52914', '2022-11-12');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Ralphs', '05221 Davis Center', 'Orange', 'CA', '18040', '2020-04-23');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Smart & Final', '33149 Cody Freeway Apt. 250', 'Glendale', 'CA', '11036', '2020-12-30');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Ralphs', '68459 Kimberly Rue Suite 158', 'Anaheim', 'CA', '48363', '2021-08-24');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Smart & Final', '571 Todd Pine', 'Los Angeles', 'CA', '01117', '2021-09-01');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Ralphs', '01592 James Isle Apt. 353', 'Santa Ana', 'CA', '03733', '2021-07-08');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Ralphs', '454 Jordan Pine Apt. 030', 'Fullerton', 'CA', '82291', '2021-11-29');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Smart & Final', '152 Hannah Valley', 'Fullerton', 'CA', '21387', '2020-07-17');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Trader Joe''s', '2384 Dean View Apt. 429', 'Orange', 'CA', '82723', '2024-06-25');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Smart & Final', '00055 Kim Meadow Suite 918', 'Burbank', 'CA', '86667', '2021-01-19');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Vons', '125 Stewart Square', 'Long Beach', 'CA', '55880', '2024-02-04');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Grocery Outlet', '79212 Austin Lights', 'Burbank', 'CA', '22868', '2020-02-18');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Ralphs', '9164 Williams Skyway Apt. 411', 'Irvine', 'CA', '12278', '2021-09-27');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Grocery Outlet', '4925 Katie Vista', 'Anaheim', 'CA', '42941', '2022-09-07');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Albertsons', '1685 Sara Glens Apt. 925', 'Santa Ana', 'CA', '03580', '2025-04-06');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Vons', '1484 Brian Street Apt. 417', 'Anaheim', 'CA', '32973', '2022-03-18');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Trader Joe''s', '59675 Villa Flats', 'Glendale', 'CA', '04389', '2024-04-22');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Smart & Final', '394 Marissa Cape Suite 160', 'Fullerton', 'CA', '07235', '2022-09-07');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Trader Joe''s', '30088 Monica Field Suite 107', 'Santa Ana', 'CA', '06121', '2021-05-31');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Albertsons', '0122 Andersen Crossroad Apt. 854', 'Anaheim', 'CA', '27721', '2024-03-06');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Albertsons', '885 Christopher Mission Suite 028', 'Santa Ana', 'CA', '70444', '2022-01-11');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Ralphs', '57175 Barnes Fall Suite 296', 'Pasadena', 'CA', '67807', '2020-01-09');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Smart & Final', '350 Pamela Pike', 'Glendale', 'CA', '23017', '2023-04-06');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Trader Joe''s', '237 Linda Village Apt. 725', 'Anaheim', 'CA', '88490', '2022-04-24');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Trader Joe''s', '2277 Camacho Light Apt. 492', 'Orange', 'CA', '58221', '2020-10-20');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Ralphs', '2943 Harris Parkway', 'Fullerton', 'CA', '29406', '2023-09-25');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Grocery Outlet', '2569 Yesenia Courts', 'Pasadena', 'CA', '12710', '2024-12-18');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Vons', '5100 Williamson Fort', 'Burbank', 'CA', '84667', '2020-07-06');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Grocery Outlet', '5869 Rita Light', 'Santa Ana', 'CA', '07721', '2021-02-21');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Ralphs', '2492 Jennifer Ways Apt. 168', 'Glendale', 'CA', '19566', '2024-09-13');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Ralphs', '307 Ramsey Drive', 'Glendale', 'CA', '08120', '2020-08-05');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Albertsons', '576 Pearson Drives', 'Pasadena', 'CA', '79847', '2023-07-20');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Grocery Outlet', '42828 Veronica Vista', 'Orange', 'CA', '26933', '2022-03-07');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Albertsons', '854 Michael Rapids', 'Long Beach', 'CA', '45220', '2021-07-23');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Ralphs', '443 Lawrence Inlet Apt. 699', 'Anaheim', 'CA', '77735', '2021-11-27');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Vons', '76893 Fields Forges Suite 635', 'Long Beach', 'CA', '64482', '2021-03-02');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Vons', '2925 Martinez Track', 'Orange', 'CA', '01261', '2020-05-17');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Ralphs', '031 Baldwin Lights', 'Irvine', 'CA', '52212', '2022-10-12');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Albertsons', '572 Ashley Plain', 'Glendale', 'CA', '53549', '2023-06-30');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Smart & Final', '01703 Lynch Mission Suite 455', 'Irvine', 'CA', '21410', '2023-01-12');
INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
                          VALUES ('Vons', '063 Weiss Mission', 'Anaheim', 'CA', '19725', '2025-01-17');
INSERT INTO users (first_name, last_name, email, street_address, city_address, state_address, zip_address, date_created)
                         VALUES ('Jessica', 'Smith', 'brownandrea@hotmail.com', '6446 Ortega Centers Apt. 090', 'Santa Ana', 'CA', '92701', '2023-12-22');
INSERT INTO users (first_name, last_name, email, street_address, city_address, state_address, zip_address, date_created)
                         VALUES ('Teresa', 'Wright', 'yburns@gmail.com', '1406 Trujillo Field Apt. 202', 'Huntington Beach', 'CA', '92647', '2023-10-26');
INSERT INTO users (first_name, last_name, email, street_address, city_address, state_address, zip_address, date_created)
                         VALUES ('Jeffrey', 'Rojas', 'njohnson@martin.net', '691 Brittany Island', 'Torrance', 'CA', '90501', '2020-05-13');
INSERT INTO users (first_name, last_name, email, street_address, city_address, state_address, zip_address, date_created)
                         VALUES ('Karen', 'Obrien', 'zerickson@hotmail.com', '1472 Willis Corners Suite 552', 'Burbank', 'CA', '91502', '2024-07-27');
INSERT INTO users (first_name, last_name, email, street_address, city_address, state_address, zip_address, date_created)
                         VALUES ('Brian', 'Torres', 'kennethbrewer@ross.info', '38957 Lynch Terrace', 'Santa Ana', 'CA', '92701', '2024-07-25');
INSERT INTO users (first_name, last_name, email, street_address, city_address, state_address, zip_address, date_created)
                         VALUES ('Rachel', 'Kelley', 'brussell@ward.com', '5879 Kimberly Inlet', 'Pasadena', 'CA', '91101', '2023-02-28');
INSERT INTO users (first_name, last_name, email, street_address, city_address, state_address, zip_address, date_created)
                         VALUES ('Sharon', 'Barnes', 'diazsusan@obrien.com', '758 Cesar Overpass Suite 554', 'Inglewood', 'CA', '90301', '2022-11-27');
INSERT INTO users (first_name, last_name, email, street_address, city_address, state_address, zip_address, date_created)
                         VALUES ('Thomas', 'Griffin', 'lisafarrell@gmail.com', '7237 Brandon Mount Suite 352', 'Long Beach', 'CA', '90802', '2025-01-11');
INSERT INTO users (first_name, last_name, email, street_address, city_address, state_address, zip_address, date_created)
                         VALUES ('Michael', 'Todd', 'jason07@yahoo.com', '2378 Turner Way', 'Inglewood', 'CA', '90301', '2023-03-19');
INSERT INTO users (first_name, last_name, email, street_address, city_address, state_address, zip_address, date_created)
                         VALUES ('Kathleen', 'Perkins', 'donaldgriffin@gmail.com', '588 Gomez Pass', 'Santa Ana', 'CA', '92701', '2024-05-17');
INSERT INTO users (first_name, last_name, email, street_address, city_address, state_address, zip_address, date_created)
                         VALUES ('Anthony', 'Stephens', 'melissajackson@cannon.com', '801 Moore Tunnel', 'Burbank', 'CA', '91502', '2023-04-19');
INSERT INTO users (first_name, last_name, email, street_address, city_address, state_address, zip_address, date_created)
                         VALUES ('Robin', 'Walters', 'marshallkristina@yahoo.com', '87898 Wanda Lights', 'Irvine', 'CA', '92602', '2023-10-15');
INSERT INTO users (first_name, last_name, email, street_address, city_address, state_address, zip_address, date_created)
                         VALUES ('Mario', 'Morgan', 'myerslauren@willis.com', '95457 Melanie Stravenue', 'Lakewood', 'CA', '90712', '2022-11-04');
INSERT INTO users (first_name, last_name, email, street_address, city_address, state_address, zip_address, date_created)
                         VALUES ('Carrie', 'Moore', 'penahailey@mccoy.net', '006 Connie Manors', 'Fullerton', 'CA', '92831', '2022-07-14');
INSERT INTO users (first_name, last_name, email, street_address, city_address, state_address, zip_address, date_created)
                         VALUES ('Ruth', 'Moore', 'asmith@weiss.com', '991 Rodriguez Mission', 'Burbank', 'CA', '91502', '2022-05-25');
INSERT INTO users (first_name, last_name, email, street_address, city_address, state_address, zip_address, date_created)
                         VALUES ('Rachel', 'Garcia', 'hrodriguez@gmail.com', '8855 Grant Mountains', 'Los Angeles', 'CA', '90001', '2020-04-04');
INSERT INTO users (first_name, last_name, email, street_address, city_address, state_address, zip_address, date_created)
                         VALUES ('Leonard', 'Davis', 'davidparker@reilly-lucas.com', '9208 Karen Trail', 'Long Beach', 'CA', '90802', '2024-04-11');
INSERT INTO users (first_name, last_name, email, street_address, city_address, state_address, zip_address, date_created)
                         VALUES ('Ryan', 'Odonnell', 'reginaldmcguire@hotmail.com', '78666 Perez Lock', 'Los Angeles', 'CA', '90001', '2021-04-10');
INSERT INTO users (first_name, last_name, email, street_address, city_address, state_address, zip_address, date_created)
                         VALUES ('Thomas', 'Kent', 'david48@yahoo.com', '1546 Andrew Forest', 'Inglewood', 'CA', '90301', '2023-07-11');
INSERT INTO users (first_name, last_name, email, street_address, city_address, state_address, zip_address, date_created)
                         VALUES ('Timothy', 'Jones', 'williamschristopher@yahoo.com', '18023 Kyle Oval Apt. 943', 'Anaheim', 'CA', '92801', '2023-05-10');
INSERT INTO users (first_name, last_name, email, street_address, city_address, state_address, zip_address, date_created)
                         VALUES ('Mark', 'Hernandez', 'richardward@mcneil-everett.com', '9441 Holland Meadows Suite 381', 'Orange', 'CA', '92866', '2022-04-04');
INSERT INTO users (first_name, last_name, email, street_address, city_address, state_address, zip_address, date_created)
                         VALUES ('Maria', 'Poole', 'lgibson@yahoo.com', '5619 Tracy Road Apt. 626', 'Huntington Beach', 'CA', '92647', '2021-01-14');
INSERT INTO users (first_name, last_name, email, street_address, city_address, state_address, zip_address, date_created)
                         VALUES ('Kimberly', 'Trevino', 'clarknatalie@yahoo.com', '0647 David Plaza Apt. 337', 'Pasadena', 'CA', '91101', '2021-06-12');
INSERT INTO users (first_name, last_name, email, street_address, city_address, state_address, zip_address, date_created)
                         VALUES ('Richard', 'Brooks', 'susan06@chase.com', '0255 Rush Plaza', 'Cypress', 'CA', '90630', '2024-04-13');
INSERT INTO users (first_name, last_name, email, street_address, city_address, state_address, zip_address, date_created)
                         VALUES ('James', 'Butler', 'tiffanygonzales@crane.com', '8777 Montoya Passage Suite 145', 'Glendale', 'CA', '91203', '2021-11-23');
INSERT INTO users (first_name, last_name, email, street_address, city_address, state_address, zip_address, date_created)
                         VALUES ('Rachel', 'Goodwin', 'flynnsandra@gmail.com', '9489 Frazier Walks Apt. 908', 'Irvine', 'CA', '92602', '2022-11-28');
INSERT INTO users (first_name, last_name, email, street_address, city_address, state_address, zip_address, date_created)
                         VALUES ('Stacey', 'Mcintyre', 'dianelowe@gmail.com', '6242 Marshall Forge Apt. 727', 'Huntington Beach', 'CA', '92647', '2022-09-16');
INSERT INTO users (first_name, last_name, email, street_address, city_address, state_address, zip_address, date_created)
                         VALUES ('Adam', 'Hall', 'mgray@shepherd.com', '36741 Mark Heights Suite 572', 'Burbank', 'CA', '91502', '2025-03-13');
INSERT INTO users (first_name, last_name, email, street_address, city_address, state_address, zip_address, date_created)
                         VALUES ('Jon', 'Perez', 'jacksonfrances@smith.info', '32965 Lee Trail', 'Pasadena', 'CA', '91101', '2024-05-20');
INSERT INTO users (first_name, last_name, email, street_address, city_address, state_address, zip_address, date_created)
                         VALUES ('William', 'Jackson', 'npalmer@williams.net', '0237 Jason Path', 'Anaheim', 'CA', '92801', '2023-08-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 53, 28, 8.2, 93.04, '2025-01-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 78, 114, 5.11, 33.04, '2025-02-05');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 43, 37, 9.85, 119.14, '2025-01-22');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 105, 145, 3.15, 19.03, '2025-04-21');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 90, 97, 5.64, 44.19, '2025-04-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 92, 16, 4.83, 50.22, '2025-03-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 91, 148, 2.17, 12.93, '2025-03-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 26, 217, 1.1, 10.57, '2025-03-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (24, 8, 247, 4.42, 37.42, '2025-02-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 107, 237, 4.88, 66.2, '2025-02-15');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 79, 188, 6.15, 51.39, '2025-01-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (10, 2, 55, 9.05, 115.88, '2025-02-16');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 18, 72, 1.08, 19.87, '2025-05-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 12, 161, 3.58, 47.06, '2025-01-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 109, 142, 1.95, 25.36, '2025-02-05');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 108, 205, 1.0, 16.63, '2025-04-17');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 44, 2, 6.44, 113.32, '2025-01-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (10, 18, 184, 7.77, 55.62, '2025-02-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 75, 194, 5.3, 56.61, '2025-03-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 53, 167, 6.43, 87.88, '2025-03-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (10, 28, 115, 9.55, 70.62, '2025-02-24');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (10, 99, 68, 1.75, 6.61, '2025-03-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 63, 47, 7.47, 61.57, '2025-03-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 91, 59, 9.68, 44.23, '2025-01-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 78, 105, 6.11, 39.04, '2025-01-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 14, 113, 8.19, 90.03, '2025-05-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 15, 150, 5.4, 95.67, '2025-04-24');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 104, 173, 3.06, 54.86, '2025-01-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 27, 144, 7.15, 106.93, '2025-05-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 43, 40, 9.44, 52.05, '2025-02-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 96, 130, 4.81, 86.06, '2025-03-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 38, 45, 3.77, 9.72, '2025-04-26');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 52, 225, 8.69, 20.23, '2025-03-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 76, 145, 6.35, 55.43, '2025-01-29');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 82, 230, 5.15, 40.39, '2025-03-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 10, 196, 7.96, 102.57, '2025-01-24');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 109, 166, 3.27, 46.44, '2025-01-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 27, 163, 7.04, 62.49, '2025-04-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 116, 23, 5.37, 31.4, '2025-04-29');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 26, 21, 4.07, 77.41, '2025-04-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 86, 237, 7.78, 150.58, '2025-02-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 120, 81, 8.81, 56.94, '2025-02-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 20, 155, 1.64, 7.06, '2025-03-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 32, 194, 4.96, 89.61, '2025-04-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 119, 80, 1.11, 16.4, '2025-05-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 60, 210, 4.5, 57.17, '2025-03-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (24, 19, 245, 3.32, 35.67, '2025-02-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 81, 92, 5.62, 56.63, '2025-01-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 39, 247, 5.25, 74.41, '2025-02-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 79, 241, 4.14, 45.71, '2025-03-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 34, 142, 7.51, 97.55, '2025-02-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 24, 193, 6.51, 57.28, '2025-01-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 96, 55, 2.58, 16.03, '2025-02-17');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 117, 154, 3.17, 51.64, '2025-02-26');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 15, 147, 5.71, 17.74, '2025-04-26');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 32, 92, 1.78, 23.45, '2025-02-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 97, 187, 1.38, 21.68, '2025-02-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 95, 103, 5.06, 36.27, '2025-01-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 3, 207, 4.43, 85.67, '2025-04-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 17, 77, 7.39, 68.64, '2025-02-24');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (10, 9, 110, 6.25, 74.85, '2025-02-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 119, 163, 4.9, 15.04, '2025-01-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (2, 40, 91, 6.69, 77.74, '2025-03-22');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 16, 89, 3.4, 47.43, '2025-04-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 103, 186, 1.79, 25.53, '2025-04-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 57, 134, 9.71, 107.94, '2025-01-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 118, 200, 5.28, 16.98, '2025-03-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 82, 11, 5.98, 11.62, '2025-04-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 93, 39, 1.75, 25.35, '2025-03-31');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 77, 124, 1.29, 15.51, '2025-01-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 48, 28, 5.7, 17.19, '2025-02-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 70, 8, 4.72, 45.12, '2025-04-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 44, 97, 8.05, 54.4, '2025-03-24');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 61, 12, 4.29, 82.43, '2025-04-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 32, 212, 9.29, 135.13, '2025-01-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 61, 52, 5.06, 54.73, '2025-03-17');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (6, 73, 55, 5.22, 63.39, '2025-01-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 34, 63, 7.99, 40.41, '2025-01-15');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 49, 107, 4.85, 35.7, '2025-01-15');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 40, 172, 1.58, 5.32, '2025-04-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 79, 158, 2.88, 12.97, '2025-01-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 20, 189, 2.51, 35.21, '2025-01-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 7, 164, 1.77, 18.45, '2025-01-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 111, 29, 9.87, 28.95, '2025-01-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 17, 75, 3.69, 18.54, '2025-03-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (10, 5, 190, 2.38, 7.25, '2025-05-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 3, 243, 7.14, 109.15, '2025-01-29');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (2, 15, 209, 4.85, 94.52, '2025-04-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 43, 144, 8.97, 102.33, '2025-01-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 57, 129, 5.54, 109.23, '2025-03-16');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 5, 95, 3.55, 7.35, '2025-01-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (6, 113, 162, 1.81, 3.76, '2025-02-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 28, 31, 7.62, 91.91, '2025-03-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 28, 239, 2.88, 29.98, '2025-04-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 88, 85, 4.1, 64.33, '2025-04-17');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 43, 76, 5.89, 86.94, '2025-01-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 7, 196, 2.93, 58.34, '2025-01-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 38, 57, 5.86, 112.99, '2025-03-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (6, 6, 16, 1.96, 17.68, '2025-04-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 13, 189, 6.9, 58.0, '2025-05-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 118, 204, 3.94, 71.97, '2025-02-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 14, 127, 8.52, 76.33, '2025-01-22');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 53, 178, 6.88, 30.97, '2025-02-17');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 4, 239, 2.11, 32.97, '2025-03-16');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 92, 246, 4.95, 57.33, '2025-04-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 96, 111, 3.13, 17.2, '2025-01-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 42, 95, 8.7, 29.51, '2025-04-21');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 99, 84, 1.23, 14.02, '2025-01-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 106, 17, 8.14, 116.15, '2025-01-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 99, 166, 1.96, 37.66, '2025-03-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 100, 23, 3.62, 69.29, '2025-01-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 98, 144, 6.94, 123.34, '2025-03-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 97, 118, 9.45, 182.53, '2025-02-15');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 2, 79, 1.65, 11.69, '2025-01-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 85, 79, 1.45, 15.79, '2025-03-21');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 98, 127, 2.12, 35.61, '2025-04-04');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 16, 248, 1.86, 20.21, '2025-05-05');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 26, 123, 7.17, 50.9, '2025-05-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 78, 119, 8.88, 24.05, '2025-01-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 26, 136, 2.87, 29.28, '2025-02-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 72, 238, 7.06, 78.66, '2025-05-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 45, 170, 1.52, 9.86, '2025-05-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 50, 140, 2.61, 4.06, '2025-03-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 52, 144, 6.54, 110.53, '2025-05-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (10, 82, 103, 5.74, 62.29, '2025-04-30');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (10, 48, 64, 6.99, 58.05, '2025-05-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 66, 14, 8.42, 66.92, '2025-01-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 66, 125, 8.06, 62.9, '2025-04-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 70, 47, 5.85, 10.21, '2025-05-05');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 18, 140, 5.31, 46.13, '2025-04-24');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (6, 31, 14, 3.91, 36.78, '2025-01-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 107, 46, 9.37, 153.44, '2025-04-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 34, 125, 4.62, 46.55, '2025-01-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 72, 225, 4.09, 23.35, '2025-03-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 11, 178, 1.45, 9.53, '2025-03-26');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 17, 51, 5.3, 101.89, '2025-02-17');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 40, 221, 9.59, 124.41, '2025-05-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 42, 25, 5.4, 39.45, '2025-04-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 7, 59, 7.59, 79.97, '2025-01-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 22, 109, 3.43, 30.62, '2025-03-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 65, 193, 5.26, 45.72, '2025-02-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 70, 47, 9.01, 57.51, '2025-02-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 97, 152, 6.11, 27.54, '2025-01-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 34, 47, 4.49, 52.56, '2025-02-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 65, 87, 8.09, 28.42, '2025-02-16');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (24, 93, 183, 7.04, 89.44, '2025-03-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 21, 62, 2.69, 7.13, '2025-01-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 48, 163, 3.46, 66.46, '2025-01-30');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 70, 60, 4.19, 18.11, '2025-01-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 39, 246, 2.18, 16.35, '2025-05-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 4, 63, 2.78, 4.62, '2025-01-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 58, 142, 5.98, 51.76, '2025-03-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 47, 242, 3.19, 42.37, '2025-01-31');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 56, 206, 5.84, 41.23, '2025-01-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 31, 1, 4.72, 45.26, '2025-05-05');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 77, 172, 5.05, 9.58, '2025-01-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 64, 56, 1.14, 6.67, '2025-04-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 24, 222, 5.81, 88.98, '2025-04-15');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 44, 7, 6.68, 57.82, '2025-01-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 14, 153, 9.5, 120.34, '2025-01-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 82, 159, 6.82, 43.88, '2025-02-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 55, 80, 3.07, 33.15, '2025-03-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 30, 136, 9.12, 55.64, '2025-02-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 57, 124, 8.46, 40.47, '2025-03-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 25, 103, 5.75, 101.77, '2025-05-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 28, 101, 2.58, 40.27, '2025-03-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 106, 55, 9.32, 46.75, '2025-02-17');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 91, 128, 2.2, 23.58, '2025-01-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 100, 119, 5.75, 46.34, '2025-03-21');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 59, 102, 2.4, 17.92, '2025-04-30');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 74, 113, 9.27, 131.49, '2025-01-22');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 62, 202, 1.01, 11.36, '2025-01-17');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 62, 29, 8.26, 26.21, '2025-03-31');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 17, 166, 2.63, 34.03, '2025-03-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 42, 220, 2.16, 24.25, '2025-04-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 80, 27, 7.54, 60.83, '2025-02-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 108, 222, 5.65, 44.37, '2025-03-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (24, 80, 19, 5.31, 79.16, '2025-05-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 87, 222, 3.86, 18.65, '2025-02-05');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (6, 17, 197, 3.12, 12.77, '2025-03-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (10, 74, 25, 8.88, 55.03, '2025-03-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 109, 196, 3.5, 22.2, '2025-02-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 114, 70, 6.18, 69.06, '2025-04-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 24, 161, 4.95, 9.81, '2025-02-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 30, 78, 8.42, 138.01, '2025-02-21');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 60, 228, 8.61, 82.74, '2025-02-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 2, 93, 7.08, 91.47, '2025-01-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 17, 213, 8.66, 95.71, '2025-05-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (10, 76, 18, 1.53, 30.51, '2025-02-22');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 101, 228, 2.95, 56.6, '2025-02-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 111, 101, 8.86, 132.32, '2025-02-17');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 45, 213, 4.46, 57.64, '2025-01-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 114, 36, 3.55, 18.81, '2025-03-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 110, 201, 4.25, 47.34, '2025-02-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 72, 107, 8.04, 62.85, '2025-01-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 11, 69, 6.74, 40.57, '2025-02-26');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 13, 247, 7.43, 48.58, '2025-03-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 100, 217, 1.78, 28.6, '2025-01-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (6, 104, 145, 8.79, 18.3, '2025-01-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 103, 10, 2.48, 45.37, '2025-02-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 51, 106, 7.04, 84.6, '2025-02-24');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 50, 167, 2.6, 20.21, '2025-01-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 72, 48, 8.26, 16.26, '2025-01-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 16, 240, 4.78, 47.09, '2025-04-29');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 5, 120, 8.89, 56.63, '2025-04-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 65, 117, 1.36, 26.01, '2025-01-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 45, 93, 9.55, 28.57, '2025-01-29');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 25, 239, 5.83, 97.46, '2025-05-04');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 58, 177, 2.73, 16.77, '2025-01-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (24, 51, 62, 5.58, 91.76, '2025-04-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 100, 196, 4.13, 27.13, '2025-03-21');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 57, 143, 3.57, 29.93, '2025-04-22');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 41, 79, 3.66, 61.11, '2025-03-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 112, 102, 6.16, 122.97, '2025-04-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 73, 214, 4.34, 55.14, '2025-03-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (2, 37, 62, 4.39, 43.9, '2025-03-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 90, 128, 8.89, 92.22, '2025-01-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 116, 112, 9.23, 39.75, '2025-02-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 23, 194, 9.82, 55.7, '2025-02-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 96, 219, 5.04, 27.7, '2025-04-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 103, 132, 4.48, 57.24, '2025-04-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 53, 234, 6.78, 122.27, '2025-02-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 58, 198, 1.85, 6.99, '2025-03-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 86, 236, 9.29, 68.83, '2025-02-16');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 69, 17, 4.07, 10.69, '2025-03-31');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 20, 22, 2.16, 3.56, '2025-03-21');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 51, 133, 3.83, 39.06, '2025-04-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 66, 131, 1.27, 2.37, '2025-04-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 69, 38, 6.71, 48.73, '2025-03-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 17, 166, 1.56, 4.15, '2025-04-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 29, 141, 6.24, 100.58, '2025-02-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 106, 113, 1.83, 15.37, '2025-01-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (10, 74, 12, 8.78, 107.09, '2025-04-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 16, 24, 2.46, 47.23, '2025-04-04');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 44, 180, 4.31, 61.83, '2025-04-24');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (6, 118, 39, 3.51, 59.13, '2025-03-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (6, 63, 245, 5.59, 91.78, '2025-01-15');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 85, 160, 8.93, 125.17, '2025-02-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 117, 246, 9.4, 167.2, '2025-05-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 28, 60, 3.34, 49.61, '2025-04-05');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (10, 93, 206, 7.67, 26.5, '2025-05-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 117, 153, 5.29, 87.86, '2025-01-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 12, 72, 9.43, 78.66, '2025-03-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 8, 203, 4.72, 86.74, '2025-03-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 90, 84, 6.65, 55.42, '2025-01-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 45, 126, 8.08, 88.84, '2025-05-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 46, 62, 8.01, 158.05, '2025-03-29');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 12, 249, 6.96, 138.3, '2025-03-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 81, 236, 5.88, 26.22, '2025-02-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 10, 104, 1.98, 8.47, '2025-02-24');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 85, 88, 8.9, 94.84, '2025-01-21');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 84, 141, 2.14, 12.07, '2025-04-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 80, 17, 3.48, 61.01, '2025-03-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 64, 29, 9.26, 173.77, '2025-03-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (2, 47, 141, 1.84, 20.39, '2025-04-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 68, 115, 9.53, 179.09, '2025-05-04');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 39, 107, 5.62, 99.0, '2025-04-15');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 89, 197, 1.28, 24.62, '2025-01-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 41, 187, 9.38, 94.71, '2025-04-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 91, 62, 4.11, 11.12, '2025-03-26');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (6, 7, 135, 8.6, 138.96, '2025-01-22');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 28, 229, 7.47, 23.75, '2025-03-04');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 96, 200, 2.85, 51.54, '2025-02-16');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 55, 231, 6.72, 125.05, '2025-03-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 107, 128, 9.21, 96.66, '2025-02-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 88, 130, 2.23, 42.22, '2025-03-30');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 74, 244, 1.68, 26.61, '2025-03-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 71, 213, 7.92, 87.45, '2025-02-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 77, 27, 8.62, 145.88, '2025-05-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (2, 107, 212, 9.61, 132.06, '2025-05-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 27, 248, 2.69, 36.2, '2025-02-24');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 78, 98, 6.22, 119.61, '2025-03-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 106, 154, 8.47, 105.04, '2025-05-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 6, 204, 8.96, 83.82, '2025-04-26');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 41, 116, 3.65, 20.29, '2025-02-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 29, 240, 5.37, 13.96, '2025-01-26');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 95, 6, 8.19, 143.13, '2025-02-16');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 58, 62, 3.09, 51.28, '2025-03-04');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 8, 236, 1.44, 20.83, '2025-04-17');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 3, 183, 6.4, 125.23, '2025-01-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 28, 205, 2.14, 34.24, '2025-02-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 14, 211, 5.94, 56.99, '2025-04-17');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (2, 79, 118, 5.64, 59.36, '2025-05-05');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 117, 71, 4.83, 80.81, '2025-03-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 43, 167, 5.63, 49.44, '2025-03-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 75, 36, 6.41, 93.66, '2025-03-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 57, 66, 8.02, 148.5, '2025-01-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 48, 35, 7.63, 64.79, '2025-03-24');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 103, 1, 2.89, 29.93, '2025-02-05');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 6, 103, 4.61, 86.71, '2025-05-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 66, 128, 5.8, 30.12, '2025-05-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 91, 80, 6.09, 82.69, '2025-01-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 120, 227, 5.65, 29.05, '2025-05-04');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 43, 78, 9.67, 111.07, '2025-03-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 31, 187, 1.17, 4.43, '2025-05-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 71, 187, 2.24, 39.99, '2025-03-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 83, 70, 4.85, 24.5, '2025-01-26');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 56, 220, 2.17, 10.8, '2025-05-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 87, 206, 4.69, 47.99, '2025-03-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (6, 36, 212, 6.61, 86.88, '2025-03-04');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 80, 247, 2.86, 40.91, '2025-04-16');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 17, 127, 6.24, 53.18, '2025-03-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 80, 117, 2.92, 29.59, '2025-01-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 39, 226, 6.63, 89.92, '2025-05-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 28, 189, 8.35, 158.18, '2025-02-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 113, 94, 3.04, 54.56, '2025-01-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 54, 195, 8.73, 49.4, '2025-01-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 18, 144, 7.31, 87.16, '2025-02-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 61, 165, 5.93, 31.21, '2025-01-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 116, 32, 3.85, 69.93, '2025-01-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 112, 238, 1.49, 24.19, '2025-04-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 22, 2, 9.89, 64.51, '2025-01-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 15, 196, 1.08, 15.38, '2025-04-24');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 2, 30, 8.61, 132.04, '2025-04-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 87, 72, 7.69, 149.61, '2025-04-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 53, 7, 10.0, 169.82, '2025-04-05');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 40, 169, 1.54, 24.0, '2025-05-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 104, 100, 8.0, 26.9, '2025-04-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 81, 242, 2.33, 10.75, '2025-03-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 58, 83, 8.24, 104.83, '2025-02-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 91, 6, 2.97, 30.26, '2025-02-04');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 63, 228, 5.25, 68.72, '2025-04-29');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 110, 41, 9.99, 72.31, '2025-01-26');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (6, 116, 104, 9.21, 31.1, '2025-03-30');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 100, 131, 7.97, 52.09, '2025-03-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 79, 54, 3.88, 55.47, '2025-04-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 22, 248, 4.76, 29.27, '2025-02-16');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 44, 209, 6.13, 43.49, '2025-02-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 98, 161, 7.97, 74.51, '2025-02-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 12, 23, 3.19, 5.66, '2025-03-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 89, 4, 1.01, 11.18, '2025-01-30');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 41, 143, 5.0, 23.02, '2025-04-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 52, 223, 7.11, 16.33, '2025-04-30');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 21, 9, 3.28, 44.34, '2025-02-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 108, 16, 2.94, 56.4, '2025-03-29');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 107, 60, 8.58, 90.23, '2025-03-24');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 43, 159, 9.54, 91.04, '2025-04-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 102, 160, 9.12, 160.29, '2025-02-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (2, 89, 229, 6.74, 78.84, '2025-03-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 58, 4, 1.85, 17.28, '2025-02-26');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 42, 108, 6.19, 57.07, '2025-04-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 41, 10, 9.71, 138.46, '2025-02-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 45, 107, 7.27, 78.7, '2025-04-05');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 112, 102, 2.62, 30.23, '2025-03-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 94, 200, 5.62, 13.14, '2025-03-17');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 67, 167, 8.73, 49.97, '2025-02-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 6, 245, 3.37, 66.96, '2025-03-26');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 71, 139, 2.57, 46.31, '2025-04-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 51, 175, 7.21, 143.73, '2025-04-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 73, 172, 5.55, 57.43, '2025-01-31');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 98, 229, 4.74, 86.32, '2025-04-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 47, 69, 5.7, 32.98, '2025-04-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (6, 59, 83, 7.85, 108.36, '2025-03-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 15, 20, 9.01, 162.48, '2025-04-24');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 51, 147, 1.45, 8.75, '2025-03-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 51, 174, 7.73, 40.08, '2025-01-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 80, 215, 5.03, 29.56, '2025-05-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 17, 148, 3.04, 8.78, '2025-02-05');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 61, 94, 7.3, 112.77, '2025-03-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 102, 192, 4.66, 48.55, '2025-03-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 61, 114, 9.4, 164.65, '2025-04-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 1, 221, 8.35, 124.43, '2025-02-26');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 8, 156, 6.2, 96.04, '2025-02-21');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 50, 50, 7.26, 113.59, '2025-02-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 110, 75, 9.22, 158.59, '2025-01-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 60, 194, 7.34, 114.76, '2025-05-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 80, 39, 2.49, 32.51, '2025-05-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 28, 129, 4.59, 58.98, '2025-01-16');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 105, 213, 1.14, 12.78, '2025-02-26');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 78, 60, 7.59, 91.94, '2025-02-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 25, 184, 8.1, 41.04, '2025-05-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 93, 50, 6.65, 42.58, '2025-05-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 6, 34, 3.15, 44.61, '2025-03-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 96, 98, 4.36, 64.99, '2025-01-24');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 26, 157, 7.51, 145.38, '2025-03-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 102, 208, 9.07, 31.06, '2025-03-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 56, 37, 3.64, 39.55, '2025-02-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 15, 152, 9.72, 93.09, '2025-03-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 112, 63, 5.46, 62.26, '2025-01-22');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 109, 158, 9.93, 133.31, '2025-03-26');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (10, 30, 2, 4.41, 9.65, '2025-04-29');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 14, 98, 6.03, 90.34, '2025-01-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 22, 56, 3.82, 28.08, '2025-01-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 33, 20, 8.08, 119.97, '2025-05-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 4, 113, 5.28, 68.3, '2025-02-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 60, 48, 5.59, 73.67, '2025-01-26');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 21, 191, 4.41, 68.48, '2025-01-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 59, 138, 1.67, 5.11, '2025-01-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 105, 167, 6.25, 71.01, '2025-05-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 107, 115, 3.37, 39.03, '2025-01-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 87, 52, 4.98, 68.78, '2025-02-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 2, 1, 9.2, 78.2, '2025-01-15');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (10, 16, 204, 4.81, 93.7, '2025-02-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 80, 7, 7.01, 51.28, '2025-01-21');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 58, 75, 8.04, 58.57, '2025-02-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 16, 160, 1.74, 16.99, '2025-03-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 94, 161, 3.74, 56.99, '2025-02-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 120, 127, 3.14, 62.47, '2025-01-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 83, 129, 8.7, 129.19, '2025-03-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (2, 68, 203, 2.25, 27.5, '2025-04-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 97, 166, 1.12, 7.77, '2025-01-26');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 112, 81, 5.33, 12.38, '2025-04-16');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 68, 151, 2.49, 26.22, '2025-02-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 66, 56, 7.9, 120.23, '2025-01-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 37, 79, 3.18, 16.08, '2025-03-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (10, 84, 72, 6.24, 44.22, '2025-03-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 75, 45, 2.47, 9.62, '2025-05-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 33, 219, 1.77, 29.83, '2025-01-04');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (2, 37, 46, 1.66, 4.84, '2025-01-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 79, 58, 3.16, 13.18, '2025-03-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 19, 42, 5.31, 95.0, '2025-03-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 78, 151, 3.04, 56.28, '2025-03-17');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 96, 21, 9.07, 174.73, '2025-04-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 55, 124, 5.74, 97.7, '2025-04-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 63, 234, 3.18, 62.45, '2025-02-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 17, 111, 7.06, 47.38, '2025-02-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 80, 119, 2.03, 27.78, '2025-03-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 113, 107, 8.43, 159.65, '2025-04-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 39, 213, 8.11, 60.94, '2025-02-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (24, 84, 37, 9.84, 179.74, '2025-04-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 48, 128, 9.69, 111.42, '2025-03-29');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 63, 95, 8.87, 68.12, '2025-04-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (2, 48, 133, 3.51, 58.67, '2025-02-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 7, 161, 5.74, 39.85, '2025-03-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 5, 237, 1.17, 15.45, '2025-05-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 38, 131, 3.48, 66.71, '2025-04-22');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 35, 237, 2.95, 26.61, '2025-02-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 88, 216, 5.98, 24.13, '2025-01-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 37, 163, 7.05, 18.15, '2025-02-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 110, 183, 9.24, 20.65, '2025-04-29');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 28, 205, 3.53, 28.77, '2025-02-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 63, 179, 6.66, 82.27, '2025-01-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (10, 66, 47, 8.79, 175.74, '2025-05-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 32, 89, 7.79, 78.76, '2025-04-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 93, 122, 1.23, 15.99, '2025-02-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 78, 74, 5.31, 93.87, '2025-01-15');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (10, 22, 239, 5.56, 104.76, '2025-01-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 5, 57, 9.47, 136.83, '2025-04-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 79, 223, 9.96, 37.27, '2025-02-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 119, 247, 1.58, 6.24, '2025-04-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 82, 186, 9.82, 32.08, '2025-01-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (24, 9, 243, 1.81, 5.94, '2025-05-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 99, 30, 7.18, 124.38, '2025-03-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 57, 46, 6.86, 33.99, '2025-05-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 107, 119, 8.6, 52.01, '2025-04-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 48, 127, 3.05, 10.33, '2025-03-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 105, 161, 6.39, 76.41, '2025-04-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 46, 152, 7.51, 146.87, '2025-02-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 60, 22, 8.38, 54.73, '2025-02-16');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (2, 71, 107, 7.45, 136.2, '2025-03-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 68, 20, 8.02, 97.69, '2025-02-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 18, 67, 9.29, 128.18, '2025-02-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 56, 26, 6.23, 50.98, '2025-03-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 108, 227, 4.11, 72.04, '2025-03-22');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 71, 196, 1.52, 4.73, '2025-04-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 42, 175, 1.1, 12.89, '2025-01-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 19, 24, 3.98, 13.02, '2025-04-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 108, 199, 9.26, 167.59, '2025-04-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 10, 228, 8.69, 99.99, '2025-03-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 116, 173, 3.81, 41.01, '2025-04-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 115, 182, 8.42, 144.65, '2025-02-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 69, 84, 7.5, 98.25, '2025-02-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 79, 122, 9.25, 155.57, '2025-04-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 56, 233, 3.9, 40.73, '2025-01-15');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 43, 147, 3.1, 38.11, '2025-03-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 21, 123, 1.41, 23.99, '2025-03-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 116, 17, 2.51, 31.03, '2025-02-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 36, 56, 3.59, 70.82, '2025-01-30');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 63, 46, 4.98, 55.06, '2025-04-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 60, 165, 4.89, 18.17, '2025-05-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 66, 108, 5.41, 62.25, '2025-04-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 17, 184, 8.05, 94.21, '2025-04-15');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 79, 90, 2.31, 43.53, '2025-04-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 90, 165, 2.61, 8.66, '2025-04-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 104, 47, 7.43, 30.99, '2025-04-15');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 24, 122, 3.09, 32.84, '2025-04-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 114, 201, 8.89, 38.55, '2025-01-17');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 68, 199, 3.38, 60.99, '2025-04-04');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 14, 221, 3.24, 60.15, '2025-04-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 54, 232, 8.18, 120.31, '2025-01-30');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (24, 115, 66, 4.28, 83.57, '2025-05-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 42, 156, 5.0, 24.05, '2025-02-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 26, 238, 9.15, 158.13, '2025-04-21');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (10, 41, 214, 2.6, 8.04, '2025-05-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 62, 83, 8.9, 88.52, '2025-02-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 61, 2, 7.71, 40.39, '2025-03-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 119, 161, 6.66, 75.12, '2025-03-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 58, 238, 8.59, 62.07, '2025-01-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 40, 230, 5.51, 51.05, '2025-03-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 72, 63, 4.18, 22.53, '2025-01-16');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 85, 83, 3.07, 12.39, '2025-01-22');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 105, 33, 9.64, 114.66, '2025-03-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 72, 213, 4.76, 82.43, '2025-01-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (6, 61, 89, 9.81, 62.69, '2025-02-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 7, 175, 3.83, 11.83, '2025-05-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 29, 249, 1.22, 15.6, '2025-03-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 12, 84, 6.09, 101.44, '2025-02-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 74, 198, 5.17, 86.63, '2025-03-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 48, 31, 9.4, 101.23, '2025-01-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 17, 47, 5.57, 71.25, '2025-02-22');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 44, 243, 7.69, 75.39, '2025-04-30');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 67, 248, 7.97, 17.99, '2025-01-16');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 73, 242, 4.51, 18.87, '2025-03-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 19, 71, 5.23, 62.27, '2025-03-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 119, 106, 7.23, 46.87, '2025-01-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (24, 46, 30, 9.33, 135.21, '2025-02-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 14, 210, 9.05, 35.41, '2025-01-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 110, 198, 1.71, 3.75, '2025-01-29');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 99, 105, 6.1, 89.79, '2025-05-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 76, 9, 3.97, 32.31, '2025-01-29');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (24, 16, 195, 3.51, 37.78, '2025-03-29');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 21, 69, 7.67, 47.33, '2025-03-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 24, 122, 2.76, 12.82, '2025-04-05');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 73, 24, 2.74, 46.62, '2025-04-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 98, 45, 3.69, 26.35, '2025-03-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 74, 49, 7.15, 104.55, '2025-04-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 50, 206, 6.95, 123.34, '2025-05-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 43, 175, 5.92, 116.57, '2025-01-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 81, 142, 6.36, 107.36, '2025-05-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 3, 33, 6.03, 80.36, '2025-02-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 102, 233, 2.97, 42.78, '2025-01-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 119, 177, 6.92, 65.89, '2025-01-16');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 24, 183, 9.03, 60.64, '2025-02-05');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 39, 181, 1.24, 9.8, '2025-03-21');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 46, 181, 8.79, 17.84, '2025-01-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 50, 142, 4.07, 68.46, '2025-04-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 110, 14, 8.27, 37.66, '2025-04-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (2, 92, 124, 9.29, 77.89, '2025-01-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 99, 173, 8.75, 140.35, '2025-02-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 41, 96, 9.78, 148.1, '2025-01-24');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 105, 178, 5.78, 52.91, '2025-02-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 115, 240, 2.68, 7.39, '2025-05-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (24, 40, 51, 7.88, 145.34, '2025-01-29');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (10, 13, 164, 6.16, 99.13, '2025-05-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 70, 12, 2.86, 44.4, '2025-03-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 36, 81, 3.6, 65.04, '2025-01-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 95, 235, 3.44, 65.98, '2025-03-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 21, 177, 7.87, 12.78, '2025-01-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 83, 134, 2.45, 47.08, '2025-02-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 42, 209, 7.62, 51.5, '2025-05-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 72, 160, 7.7, 56.15, '2025-03-05');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 2, 111, 1.75, 15.26, '2025-02-15');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 19, 1, 5.3, 37.51, '2025-05-04');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 4, 101, 1.73, 29.72, '2025-03-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (24, 16, 182, 2.29, 9.12, '2025-02-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 100, 75, 6.34, 93.05, '2025-05-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 31, 75, 6.87, 36.05, '2025-05-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 16, 25, 7.93, 98.79, '2025-03-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 27, 220, 1.24, 13.46, '2025-02-17');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 89, 65, 7.5, 121.85, '2025-03-22');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 116, 50, 5.56, 47.15, '2025-03-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 74, 132, 2.36, 22.06, '2025-02-24');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (24, 27, 210, 3.39, 13.72, '2025-02-21');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 80, 39, 1.38, 22.95, '2025-01-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 46, 149, 4.72, 92.19, '2025-04-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 22, 198, 4.57, 64.15, '2025-01-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 76, 181, 8.23, 29.93, '2025-01-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (6, 23, 62, 9.41, 161.13, '2025-03-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 71, 200, 5.66, 67.56, '2025-03-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 75, 133, 1.83, 35.64, '2025-01-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 101, 87, 5.82, 13.56, '2025-03-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 38, 92, 6.57, 82.25, '2025-03-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 14, 52, 7.36, 36.62, '2025-03-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 79, 9, 7.78, 60.14, '2025-04-29');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 115, 113, 2.04, 13.75, '2025-03-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 56, 169, 3.84, 27.05, '2025-01-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 86, 247, 6.22, 37.33, '2025-02-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (2, 105, 185, 2.28, 22.65, '2025-01-26');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 28, 169, 8.43, 26.11, '2025-02-05');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 102, 184, 9.7, 117.65, '2025-02-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 97, 21, 4.21, 35.64, '2025-03-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 116, 150, 6.6, 37.49, '2025-02-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 4, 154, 2.05, 8.88, '2025-03-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 12, 117, 6.6, 62.29, '2025-01-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 41, 27, 4.63, 38.24, '2025-02-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 15, 246, 3.16, 44.6, '2025-01-16');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 54, 74, 9.48, 99.27, '2025-04-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 70, 218, 2.97, 25.99, '2025-05-04');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 20, 62, 1.6, 24.97, '2025-04-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 31, 189, 4.74, 73.4, '2025-01-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (2, 92, 245, 1.31, 2.19, '2025-02-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 17, 147, 3.76, 65.18, '2025-02-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 120, 52, 6.73, 84.57, '2025-01-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 92, 4, 4.09, 76.05, '2025-04-22');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 56, 225, 5.82, 49.23, '2025-01-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 85, 218, 8.14, 36.95, '2025-01-29');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 14, 65, 8.03, 86.99, '2025-02-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 52, 139, 2.46, 48.19, '2025-01-04');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 102, 156, 9.16, 76.49, '2025-01-29');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (24, 39, 73, 3.84, 33.42, '2025-02-05');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 74, 150, 8.43, 68.08, '2025-01-29');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 110, 242, 9.29, 66.49, '2025-03-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 64, 148, 7.64, 21.48, '2025-03-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 59, 20, 9.65, 136.95, '2025-01-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 106, 85, 7.57, 12.5, '2025-01-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 46, 234, 5.86, 76.96, '2025-02-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 101, 243, 7.5, 70.63, '2025-02-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 61, 227, 5.41, 84.14, '2025-05-04');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (2, 16, 175, 5.21, 45.36, '2025-01-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 6, 48, 1.78, 15.07, '2025-01-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (10, 78, 75, 9.64, 176.0, '2025-04-29');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 8, 213, 1.21, 3.13, '2025-04-04');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 115, 204, 9.13, 176.08, '2025-02-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 43, 245, 5.86, 28.59, '2025-04-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 51, 25, 5.81, 64.83, '2025-02-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 36, 200, 5.2, 63.86, '2025-05-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 103, 136, 7.86, 36.06, '2025-02-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 64, 31, 4.2, 46.24, '2025-02-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (2, 96, 64, 5.91, 30.51, '2025-04-16');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (24, 104, 130, 9.14, 38.19, '2025-03-26');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 49, 249, 7.86, 74.47, '2025-04-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 94, 227, 1.7, 6.47, '2025-05-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 101, 59, 5.41, 102.54, '2025-01-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 116, 179, 4.68, 12.47, '2025-02-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 48, 4, 6.36, 72.36, '2025-02-21');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (10, 27, 99, 4.65, 64.01, '2025-02-04');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 21, 76, 4.36, 53.0, '2025-04-29');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 38, 34, 5.6, 57.51, '2025-01-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 56, 145, 9.71, 173.36, '2025-05-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 27, 1, 2.96, 6.03, '2025-02-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 29, 181, 7.7, 148.77, '2025-01-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 13, 202, 2.51, 43.96, '2025-03-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 93, 96, 8.66, 89.29, '2025-03-24');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 107, 106, 3.55, 50.72, '2025-03-04');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 32, 209, 4.0, 76.01, '2025-01-04');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 41, 247, 9.0, 161.41, '2025-02-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 87, 138, 7.15, 124.07, '2025-02-17');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (10, 109, 69, 2.29, 15.72, '2025-01-17');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 104, 155, 6.09, 25.59, '2025-03-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 1, 44, 2.58, 18.72, '2025-04-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 2, 41, 7.37, 69.92, '2025-04-26');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 97, 133, 6.78, 117.27, '2025-04-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 101, 98, 2.51, 34.01, '2025-02-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (24, 51, 60, 7.51, 21.95, '2025-05-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 6, 42, 3.79, 32.68, '2025-01-04');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 85, 100, 8.87, 173.12, '2025-04-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 25, 129, 1.16, 14.9, '2025-04-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 72, 161, 1.12, 19.97, '2025-05-05');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 114, 210, 3.94, 13.06, '2025-02-21');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 119, 48, 7.76, 110.31, '2025-05-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 35, 210, 2.6, 4.32, '2025-01-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 102, 110, 1.04, 19.3, '2025-01-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 36, 131, 8.96, 125.16, '2025-02-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 63, 191, 8.02, 134.75, '2025-03-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 66, 205, 8.09, 81.92, '2025-02-04');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 15, 225, 7.0, 56.36, '2025-04-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 94, 95, 6.48, 68.48, '2025-02-15');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 77, 66, 9.99, 17.04, '2025-02-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (6, 39, 95, 2.33, 34.6, '2025-04-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (2, 70, 205, 1.82, 22.63, '2025-03-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 7, 61, 5.0, 23.45, '2025-02-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 94, 130, 4.48, 62.68, '2025-01-17');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 25, 238, 4.73, 74.92, '2025-04-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (10, 83, 112, 8.48, 37.35, '2025-02-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 58, 32, 2.26, 34.55, '2025-05-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 10, 68, 6.74, 49.0, '2025-03-30');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 21, 94, 1.58, 3.22, '2025-02-15');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (10, 15, 243, 9.37, 151.65, '2025-01-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 24, 166, 5.65, 43.39, '2025-05-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 72, 2, 8.45, 82.3, '2025-04-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 6, 18, 4.91, 75.03, '2025-01-26');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 19, 195, 9.45, 45.22, '2025-04-16');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 18, 44, 7.47, 34.64, '2025-02-24');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 48, 91, 1.1, 18.02, '2025-05-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 26, 32, 3.4, 24.36, '2025-01-31');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 26, 246, 3.84, 60.41, '2025-03-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 56, 199, 5.0, 19.07, '2025-02-04');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 79, 81, 2.84, 13.57, '2025-04-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 17, 190, 2.61, 9.22, '2025-04-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 108, 201, 3.2, 30.75, '2025-05-05');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 36, 240, 7.4, 106.53, '2025-03-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 7, 13, 6.99, 95.95, '2025-05-05');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 30, 73, 8.84, 124.29, '2025-02-22');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 109, 209, 7.78, 141.61, '2025-01-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 43, 194, 2.99, 43.32, '2025-04-16');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 31, 102, 8.5, 90.59, '2025-03-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 42, 45, 1.14, 19.74, '2025-05-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 44, 164, 9.95, 143.01, '2025-01-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 43, 149, 1.84, 30.49, '2025-05-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 82, 79, 9.99, 69.95, '2025-02-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 101, 223, 5.93, 113.74, '2025-04-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 93, 177, 3.98, 48.34, '2025-03-17');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 78, 110, 7.72, 42.65, '2025-02-04');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 94, 157, 6.15, 111.12, '2025-04-17');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 117, 31, 4.9, 68.8, '2025-01-26');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 36, 101, 5.83, 15.87, '2025-03-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 103, 140, 9.71, 108.41, '2025-03-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 22, 240, 2.71, 19.45, '2025-01-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 26, 116, 6.44, 108.38, '2025-04-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 10, 178, 7.09, 141.71, '2025-03-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (24, 46, 161, 7.54, 18.27, '2025-01-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 71, 174, 1.89, 18.62, '2025-05-04');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 114, 194, 1.4, 21.11, '2025-05-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (10, 65, 194, 9.88, 127.34, '2025-03-29');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 47, 117, 1.01, 11.03, '2025-04-30');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (6, 117, 240, 5.18, 10.34, '2025-03-30');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 26, 62, 7.89, 57.72, '2025-01-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 110, 41, 3.91, 10.74, '2025-05-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 23, 155, 6.74, 73.74, '2025-03-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (2, 102, 51, 3.83, 31.17, '2025-02-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 28, 223, 1.24, 20.62, '2025-04-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 23, 204, 2.57, 22.22, '2025-01-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 116, 39, 9.38, 164.14, '2025-01-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 116, 186, 1.42, 2.19, '2025-01-04');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 48, 226, 2.63, 42.17, '2025-01-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 47, 153, 6.23, 23.24, '2025-04-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 35, 80, 7.13, 101.06, '2025-01-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 111, 160, 8.8, 42.03, '2025-01-24');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 65, 22, 3.05, 11.52, '2025-04-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (2, 63, 137, 1.84, 33.23, '2025-03-29');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 23, 59, 1.8, 25.2, '2025-01-26');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 48, 104, 8.16, 38.65, '2025-04-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 74, 10, 3.68, 21.63, '2025-02-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 60, 202, 1.81, 8.37, '2025-04-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (24, 24, 91, 2.16, 5.26, '2025-01-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (24, 99, 55, 7.65, 88.94, '2025-02-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 28, 203, 3.81, 30.03, '2025-03-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 111, 24, 8.57, 97.11, '2025-04-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 86, 165, 5.21, 101.54, '2025-04-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 41, 200, 5.74, 91.59, '2025-05-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 34, 155, 1.81, 32.38, '2025-01-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (2, 102, 98, 1.11, 3.02, '2025-05-05');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (6, 102, 34, 5.79, 85.97, '2025-05-04');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 64, 245, 1.65, 20.41, '2025-04-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 61, 108, 9.64, 124.37, '2025-01-05');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 100, 64, 8.36, 94.27, '2025-02-26');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 38, 211, 9.08, 78.57, '2025-03-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 90, 83, 2.91, 7.88, '2025-01-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 20, 174, 8.34, 43.18, '2025-04-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 113, 35, 7.16, 11.01, '2025-03-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 16, 29, 9.54, 53.87, '2025-04-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 37, 190, 1.66, 6.92, '2025-01-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 45, 69, 5.1, 29.8, '2025-04-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 32, 40, 1.9, 5.04, '2025-01-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 85, 178, 4.94, 15.51, '2025-04-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 40, 195, 2.22, 13.42, '2025-05-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 120, 31, 6.48, 79.51, '2025-04-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 66, 2, 6.24, 95.36, '2025-04-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 23, 34, 4.76, 61.65, '2025-05-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 115, 172, 8.5, 58.12, '2025-04-30');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 38, 241, 9.83, 77.26, '2025-02-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 75, 73, 5.39, 9.59, '2025-01-31');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (6, 26, 143, 4.61, 58.8, '2025-03-24');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 118, 112, 2.67, 31.45, '2025-01-31');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 21, 43, 4.42, 36.99, '2025-02-16');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 44, 123, 7.76, 18.94, '2025-01-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 63, 227, 8.13, 80.02, '2025-03-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 4, 76, 1.29, 6.23, '2025-04-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (24, 26, 244, 4.31, 47.34, '2025-03-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (24, 113, 160, 6.74, 82.51, '2025-03-16');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 46, 29, 4.13, 14.89, '2025-01-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 12, 144, 2.74, 14.23, '2025-01-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 41, 133, 2.9, 11.4, '2025-01-15');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 117, 248, 6.25, 52.82, '2025-03-15');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 60, 143, 1.82, 24.28, '2025-02-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 4, 24, 6.95, 129.03, '2025-02-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 64, 24, 6.86, 48.13, '2025-04-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 10, 52, 6.67, 58.58, '2025-02-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 11, 38, 4.36, 47.78, '2025-01-31');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 88, 80, 4.1, 44.75, '2025-05-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 86, 237, 8.36, 34.24, '2025-04-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 44, 139, 5.89, 67.4, '2025-01-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 90, 41, 8.3, 65.55, '2025-05-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 38, 42, 6.17, 71.69, '2025-02-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (2, 114, 206, 1.11, 14.36, '2025-02-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 34, 177, 4.43, 42.15, '2025-05-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 70, 212, 2.92, 17.51, '2025-04-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 3, 103, 4.19, 83.37, '2025-04-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 100, 91, 6.29, 59.12, '2025-01-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 119, 174, 3.62, 72.11, '2025-04-17');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 69, 194, 6.09, 30.34, '2025-01-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 20, 109, 4.84, 22.11, '2025-04-22');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 78, 48, 8.35, 123.47, '2025-04-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 1, 145, 2.56, 15.95, '2025-01-29');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 52, 185, 8.09, 79.64, '2025-04-22');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 119, 153, 9.02, 163.28, '2025-03-17');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 27, 199, 4.6, 42.3, '2025-01-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 94, 57, 8.21, 21.31, '2025-02-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (24, 18, 186, 7.12, 103.99, '2025-03-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 5, 98, 7.02, 112.21, '2025-02-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 74, 51, 2.29, 37.84, '2025-01-05');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 30, 201, 2.37, 37.14, '2025-04-04');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 9, 184, 7.0, 36.74, '2025-03-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (6, 45, 154, 5.45, 68.44, '2025-05-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (24, 22, 34, 3.4, 15.07, '2025-02-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (6, 7, 111, 5.48, 96.0, '2025-04-15');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 119, 40, 5.92, 73.65, '2025-03-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 105, 80, 6.98, 138.62, '2025-04-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 10, 57, 7.69, 65.04, '2025-03-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 109, 162, 5.82, 44.87, '2025-02-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 3, 40, 2.93, 12.35, '2025-01-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 100, 84, 3.4, 40.79, '2025-03-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 75, 221, 1.98, 25.06, '2025-05-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 112, 132, 5.69, 61.0, '2025-05-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 100, 116, 1.76, 20.8, '2025-04-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 25, 87, 2.36, 30.36, '2025-02-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 115, 217, 4.99, 23.11, '2025-01-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (6, 9, 149, 2.76, 52.28, '2025-04-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 14, 24, 2.71, 39.77, '2025-04-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 9, 130, 3.69, 47.78, '2025-04-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 15, 97, 6.92, 23.77, '2025-01-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 31, 142, 5.59, 34.94, '2025-02-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 22, 182, 6.06, 16.21, '2025-02-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (10, 80, 211, 5.3, 55.1, '2025-05-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 113, 191, 3.46, 60.06, '2025-02-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 18, 46, 6.87, 27.6, '2025-05-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 11, 176, 4.67, 44.19, '2025-05-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 4, 243, 7.75, 144.66, '2025-02-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 12, 173, 3.23, 17.75, '2025-01-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 11, 153, 3.15, 50.47, '2025-01-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 40, 246, 2.41, 18.12, '2025-03-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 53, 53, 1.44, 24.35, '2025-04-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 105, 63, 6.82, 110.43, '2025-03-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 13, 205, 4.44, 77.74, '2025-01-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 15, 110, 1.49, 24.67, '2025-03-16');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (24, 53, 46, 9.46, 171.77, '2025-03-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 39, 176, 3.21, 30.61, '2025-03-30');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 117, 205, 7.52, 134.77, '2025-05-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (2, 91, 27, 5.54, 13.46, '2025-01-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 67, 53, 1.72, 18.46, '2025-01-29');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 36, 5, 1.63, 3.98, '2025-01-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 24, 159, 3.68, 15.77, '2025-04-15');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 32, 227, 4.66, 9.47, '2025-02-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 11, 163, 8.78, 100.25, '2025-03-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 85, 149, 4.31, 24.95, '2025-04-29');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 106, 29, 7.14, 125.85, '2025-03-05');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 50, 38, 4.75, 83.93, '2025-02-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 23, 70, 6.53, 86.96, '2025-01-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 74, 127, 2.46, 42.36, '2025-02-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 55, 243, 7.79, 134.7, '2025-03-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 33, 154, 1.21, 8.41, '2025-04-15');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 22, 163, 7.51, 45.85, '2025-04-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 56, 56, 4.01, 53.99, '2025-03-30');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 25, 176, 5.68, 63.81, '2025-03-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 28, 174, 9.48, 115.75, '2025-01-04');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 56, 225, 5.36, 42.03, '2025-02-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 74, 44, 2.83, 38.97, '2025-04-15');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 99, 83, 8.32, 20.64, '2025-04-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (10, 101, 192, 5.03, 94.77, '2025-05-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 90, 103, 4.96, 19.08, '2025-04-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 67, 71, 5.57, 53.99, '2025-03-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 18, 217, 9.91, 55.62, '2025-02-05');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 99, 230, 6.63, 68.63, '2025-03-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 57, 206, 8.1, 62.8, '2025-02-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 78, 52, 4.91, 85.74, '2025-02-16');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 66, 102, 5.98, 67.97, '2025-01-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 109, 38, 9.08, 19.34, '2025-05-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 93, 73, 2.5, 46.91, '2025-03-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 3, 140, 8.18, 124.87, '2025-04-05');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 7, 139, 6.58, 23.0, '2025-01-17');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 10, 139, 8.93, 115.55, '2025-01-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 29, 130, 1.51, 26.21, '2025-04-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 18, 223, 6.73, 119.89, '2025-03-17');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 15, 235, 9.84, 113.0, '2025-04-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 90, 9, 1.34, 10.55, '2025-01-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 76, 74, 7.3, 135.62, '2025-02-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 82, 129, 4.28, 82.75, '2025-04-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 22, 164, 9.73, 82.91, '2025-05-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 98, 233, 7.99, 135.18, '2025-04-24');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 19, 197, 6.61, 87.84, '2025-04-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 48, 94, 5.08, 66.86, '2025-03-30');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 102, 197, 5.5, 27.62, '2025-04-24');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 7, 108, 9.47, 157.25, '2025-02-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 66, 166, 5.29, 21.96, '2025-03-26');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 39, 198, 5.93, 38.91, '2025-01-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 37, 48, 6.98, 54.78, '2025-04-24');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 107, 195, 8.25, 162.06, '2025-03-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 107, 123, 3.81, 63.01, '2025-02-21');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 107, 19, 7.24, 31.02, '2025-04-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 108, 190, 3.86, 38.18, '2025-05-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 14, 147, 8.82, 64.46, '2025-03-26');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 32, 227, 5.56, 25.2, '2025-03-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 13, 19, 3.11, 9.23, '2025-03-26');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 39, 189, 6.2, 42.66, '2025-02-21');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 107, 73, 9.34, 75.77, '2025-02-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 70, 43, 1.5, 14.37, '2025-03-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 57, 168, 2.2, 3.78, '2025-02-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 60, 56, 8.26, 135.15, '2025-03-29');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 89, 48, 5.4, 94.29, '2025-03-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 25, 24, 3.51, 50.82, '2025-04-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 113, 33, 9.32, 163.78, '2025-03-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 115, 10, 3.96, 7.31, '2025-01-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 76, 11, 3.25, 13.53, '2025-05-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 13, 121, 3.67, 25.48, '2025-01-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 56, 249, 2.24, 36.45, '2025-01-21');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 15, 28, 8.02, 130.57, '2025-02-22');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 81, 114, 3.31, 15.01, '2025-03-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 36, 124, 7.7, 151.78, '2025-01-17');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 103, 68, 6.28, 24.81, '2025-01-30');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 103, 233, 3.33, 55.98, '2025-03-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 69, 128, 9.26, 44.87, '2025-01-29');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (2, 120, 211, 8.02, 46.63, '2025-03-17');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 61, 133, 2.55, 25.3, '2025-04-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 19, 4, 3.98, 23.84, '2025-03-29');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 41, 243, 6.91, 116.52, '2025-02-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 74, 236, 6.21, 29.9, '2025-05-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (6, 56, 112, 3.22, 50.98, '2025-04-17');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 119, 100, 1.55, 11.81, '2025-02-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 85, 182, 5.41, 31.1, '2025-02-04');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 43, 194, 4.71, 18.31, '2025-01-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 54, 34, 5.73, 8.76, '2025-03-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 110, 242, 2.12, 20.4, '2025-05-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 54, 182, 5.15, 32.32, '2025-03-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 41, 12, 4.83, 72.36, '2025-03-17');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 7, 92, 9.93, 137.45, '2025-04-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 42, 138, 8.39, 50.85, '2025-01-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 6, 247, 4.6, 78.65, '2025-03-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 46, 166, 3.94, 33.27, '2025-01-21');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 64, 113, 3.79, 9.31, '2025-03-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 35, 122, 7.39, 27.48, '2025-02-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (2, 119, 229, 1.16, 10.09, '2025-02-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 39, 50, 8.07, 40.62, '2025-03-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 98, 116, 8.39, 116.18, '2025-03-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (24, 22, 132, 9.65, 114.48, '2025-04-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 93, 18, 4.06, 32.39, '2025-02-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 10, 248, 2.29, 14.13, '2025-01-30');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 96, 15, 4.81, 69.78, '2025-01-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 59, 167, 2.71, 21.46, '2025-01-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 106, 248, 3.3, 23.74, '2025-01-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 17, 215, 8.82, 173.97, '2025-01-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 91, 41, 5.83, 97.95, '2025-02-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 77, 38, 4.87, 73.22, '2025-02-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 109, 221, 4.38, 23.22, '2025-01-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 51, 68, 2.6, 37.7, '2025-04-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 65, 1, 6.28, 87.84, '2025-03-30');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 14, 214, 3.71, 52.44, '2025-04-16');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 89, 179, 9.12, 164.43, '2025-01-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 59, 218, 2.04, 22.06, '2025-04-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 34, 85, 3.06, 5.11, '2025-03-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (24, 27, 106, 7.09, 30.52, '2025-04-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (6, 34, 102, 2.1, 28.93, '2025-01-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 25, 230, 7.0, 88.74, '2025-03-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 106, 220, 5.59, 75.33, '2025-04-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 70, 229, 8.98, 178.91, '2025-04-24');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 26, 49, 8.46, 141.29, '2025-01-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 90, 140, 4.75, 7.75, '2025-02-21');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 67, 99, 5.23, 68.42, '2025-01-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 59, 169, 9.34, 99.79, '2025-05-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 119, 102, 9.41, 49.62, '2025-05-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 105, 17, 7.57, 109.0, '2025-01-22');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 52, 222, 7.51, 132.7, '2025-03-04');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 41, 44, 3.24, 35.63, '2025-01-04');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 36, 225, 9.5, 63.7, '2025-02-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 110, 44, 5.5, 77.33, '2025-01-17');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 47, 104, 7.08, 130.23, '2025-03-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 73, 230, 7.29, 49.97, '2025-03-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 111, 145, 4.41, 23.1, '2025-02-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 118, 83, 9.69, 160.04, '2025-04-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 68, 26, 3.56, 68.0, '2025-05-04');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (2, 98, 85, 8.26, 115.99, '2025-04-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (6, 26, 56, 7.36, 121.33, '2025-02-21');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 28, 118, 5.33, 83.16, '2025-05-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (24, 36, 45, 4.34, 60.9, '2025-01-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 34, 166, 4.29, 72.42, '2025-01-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 42, 28, 9.24, 117.19, '2025-02-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 65, 26, 4.84, 85.22, '2025-03-30');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 73, 91, 7.52, 104.52, '2025-05-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (24, 29, 203, 7.13, 56.52, '2025-01-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 101, 63, 5.67, 81.03, '2025-05-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 59, 118, 7.83, 90.6, '2025-04-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (24, 59, 73, 9.5, 116.74, '2025-03-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 28, 131, 9.45, 77.24, '2025-04-30');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 66, 51, 7.8, 72.83, '2025-04-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (10, 67, 78, 1.43, 21.52, '2025-01-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 10, 81, 4.82, 37.18, '2025-03-15');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (2, 70, 182, 2.43, 46.51, '2025-03-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 115, 219, 4.23, 24.48, '2025-01-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 8, 216, 6.46, 12.0, '2025-02-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (10, 24, 19, 7.97, 125.2, '2025-04-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 8, 67, 4.74, 36.03, '2025-04-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (2, 79, 238, 9.48, 189.22, '2025-02-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 30, 134, 1.64, 29.77, '2025-04-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 117, 156, 2.97, 33.75, '2025-05-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 83, 240, 1.14, 11.9, '2025-03-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 17, 198, 3.14, 34.83, '2025-01-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 107, 52, 9.03, 23.89, '2025-01-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 117, 104, 8.59, 149.38, '2025-05-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 117, 237, 7.74, 24.76, '2025-04-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 107, 26, 2.46, 22.52, '2025-05-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 64, 163, 4.36, 63.35, '2025-02-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 115, 165, 8.78, 116.52, '2025-04-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 40, 174, 8.13, 136.5, '2025-02-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 46, 36, 6.84, 35.03, '2025-02-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 69, 192, 3.38, 40.99, '2025-01-21');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 65, 49, 2.01, 12.18, '2025-03-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 12, 22, 1.39, 7.27, '2025-04-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 36, 20, 4.1, 22.32, '2025-01-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 107, 229, 7.9, 52.78, '2025-02-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 103, 84, 1.39, 10.37, '2025-02-17');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (24, 73, 43, 4.79, 37.21, '2025-04-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 117, 231, 7.18, 128.06, '2025-01-30');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 45, 25, 3.66, 41.6, '2025-02-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 26, 236, 3.34, 17.16, '2025-04-15');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 61, 95, 2.9, 52.74, '2025-04-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 85, 129, 5.62, 16.78, '2025-01-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 30, 88, 5.72, 92.21, '2025-02-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (2, 120, 154, 4.76, 93.53, '2025-01-30');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 69, 6, 9.67, 50.72, '2025-02-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 111, 76, 6.15, 29.16, '2025-01-16');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 40, 86, 5.07, 7.94, '2025-03-21');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 52, 155, 9.08, 41.86, '2025-04-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 54, 123, 2.47, 33.4, '2025-01-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 90, 37, 4.23, 61.89, '2025-04-24');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 83, 190, 7.86, 32.85, '2025-05-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 35, 145, 4.79, 24.41, '2025-05-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 84, 6, 2.77, 40.4, '2025-04-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 9, 124, 6.36, 35.45, '2025-01-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 46, 150, 5.64, 41.86, '2025-03-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 27, 77, 4.48, 14.04, '2025-02-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 105, 204, 6.15, 98.26, '2025-01-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 94, 85, 5.93, 91.14, '2025-01-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 65, 245, 2.23, 8.33, '2025-03-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (2, 51, 150, 7.81, 13.67, '2025-04-26');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 33, 127, 9.04, 64.11, '2025-03-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 18, 152, 4.13, 64.35, '2025-01-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (6, 43, 250, 2.86, 9.65, '2025-03-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 5, 159, 2.54, 30.31, '2025-04-24');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 55, 27, 3.06, 42.19, '2025-02-15');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 55, 189, 1.37, 22.0, '2025-01-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 46, 43, 8.64, 110.24, '2025-04-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 106, 63, 2.44, 41.09, '2025-04-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 84, 74, 3.83, 17.4, '2025-04-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 54, 226, 8.44, 118.57, '2025-02-22');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 83, 181, 8.52, 141.73, '2025-02-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 21, 133, 1.84, 22.46, '2025-01-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 116, 166, 6.11, 76.63, '2025-01-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 7, 88, 6.6, 19.0, '2025-04-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 43, 178, 1.52, 24.93, '2025-01-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 103, 122, 1.36, 16.21, '2025-03-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 31, 26, 5.74, 69.43, '2025-02-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 61, 172, 9.65, 123.5, '2025-04-24');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 33, 144, 7.8, 25.23, '2025-02-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 40, 49, 1.32, 2.33, '2025-03-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 74, 2, 9.91, 21.8, '2025-04-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 119, 224, 6.27, 120.81, '2025-01-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 112, 176, 8.22, 32.22, '2025-03-26');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 49, 140, 4.53, 12.0, '2025-05-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 39, 236, 4.8, 46.06, '2025-02-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 44, 219, 4.39, 35.21, '2025-04-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 109, 228, 9.83, 131.41, '2025-03-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 103, 131, 2.88, 27.98, '2025-04-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 101, 69, 6.81, 98.93, '2025-04-05');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 110, 220, 2.37, 42.4, '2025-01-31');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 77, 96, 1.82, 30.52, '2025-03-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 31, 59, 5.09, 51.88, '2025-04-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 57, 143, 3.91, 20.24, '2025-04-22');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 104, 204, 7.35, 102.77, '2025-01-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 27, 82, 8.75, 96.28, '2025-04-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 28, 124, 4.82, 94.57, '2025-01-26');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (6, 49, 137, 10.0, 190.31, '2025-01-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 111, 39, 2.04, 8.88, '2025-03-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 8, 119, 3.75, 38.47, '2025-04-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 104, 2, 3.96, 29.55, '2025-03-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 113, 228, 7.87, 14.12, '2025-03-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 22, 250, 4.32, 39.58, '2025-03-21');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 18, 102, 6.82, 89.68, '2025-05-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 11, 212, 4.67, 45.74, '2025-01-04');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 115, 88, 1.73, 16.07, '2025-02-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 111, 167, 4.55, 19.67, '2025-03-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (6, 112, 57, 9.2, 151.6, '2025-01-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 56, 157, 4.54, 54.28, '2025-03-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 13, 181, 8.89, 84.57, '2025-03-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 52, 125, 3.28, 24.87, '2025-03-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 65, 223, 4.28, 15.65, '2025-03-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 18, 195, 1.55, 12.99, '2025-01-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (6, 90, 181, 7.58, 73.78, '2025-04-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 16, 10, 9.5, 137.52, '2025-03-17');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 59, 24, 5.3, 75.78, '2025-03-05');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 53, 126, 8.82, 85.98, '2025-02-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 80, 148, 9.27, 65.9, '2025-04-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 21, 139, 3.4, 46.13, '2025-05-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 90, 219, 9.48, 47.7, '2025-02-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 96, 108, 8.8, 155.0, '2025-01-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 29, 84, 1.39, 24.01, '2025-01-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 26, 156, 8.27, 20.3, '2025-03-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 111, 202, 1.98, 25.17, '2025-03-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 23, 181, 5.33, 99.77, '2025-01-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 87, 22, 7.63, 66.43, '2025-04-30');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 110, 218, 5.82, 42.57, '2025-04-04');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 86, 169, 4.79, 38.96, '2025-03-21');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (24, 54, 209, 3.14, 44.94, '2025-03-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 21, 12, 7.59, 62.67, '2025-05-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 115, 190, 5.8, 61.95, '2025-01-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 29, 246, 4.09, 56.8, '2025-05-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 55, 215, 4.35, 25.13, '2025-03-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 83, 235, 4.05, 47.9, '2025-03-21');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 22, 84, 6.28, 70.23, '2025-01-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (6, 25, 224, 8.85, 58.46, '2025-03-30');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 34, 31, 6.29, 114.7, '2025-03-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 99, 206, 2.79, 41.92, '2025-04-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 86, 207, 1.77, 8.16, '2025-04-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 43, 147, 1.05, 15.74, '2025-05-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 66, 126, 9.01, 60.64, '2025-04-15');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 40, 242, 5.62, 67.11, '2025-03-22');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 73, 35, 2.94, 28.89, '2025-03-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 109, 72, 2.82, 51.31, '2025-02-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 118, 137, 2.93, 45.25, '2025-04-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (24, 103, 169, 1.95, 21.58, '2025-03-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 71, 180, 8.72, 81.15, '2025-04-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 63, 64, 9.45, 172.28, '2025-01-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 63, 39, 8.57, 91.43, '2025-04-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 106, 151, 2.7, 27.88, '2025-05-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 38, 82, 1.96, 27.46, '2025-01-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 21, 216, 7.98, 130.68, '2025-02-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (15, 32, 92, 8.1, 15.88, '2025-03-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 83, 249, 1.29, 18.76, '2025-04-16');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 73, 56, 8.62, 35.85, '2025-05-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 101, 128, 9.62, 56.78, '2025-01-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 51, 188, 3.13, 39.79, '2025-03-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (6, 78, 249, 1.72, 28.76, '2025-02-24');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 5, 123, 8.05, 78.3, '2025-04-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 15, 199, 1.4, 12.67, '2025-04-16');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 2, 132, 6.69, 16.77, '2025-04-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 70, 69, 8.36, 91.07, '2025-04-21');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 97, 41, 7.49, 63.43, '2025-01-31');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 117, 103, 2.24, 5.23, '2025-04-24');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 30, 41, 7.07, 46.89, '2025-02-26');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 10, 59, 6.53, 121.78, '2025-03-22');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 38, 62, 6.68, 52.31, '2025-02-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (24, 65, 16, 8.22, 157.24, '2025-04-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 78, 34, 5.02, 56.66, '2025-04-30');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 115, 73, 5.0, 20.16, '2025-04-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (6, 104, 54, 6.66, 29.45, '2025-04-25');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 13, 92, 3.95, 35.92, '2025-01-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 46, 64, 1.74, 30.97, '2025-04-15');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 77, 216, 1.76, 6.44, '2025-01-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 26, 79, 1.24, 21.36, '2025-02-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 5, 237, 1.32, 15.41, '2025-04-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 38, 226, 3.87, 16.76, '2025-05-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 47, 175, 5.35, 99.39, '2025-01-30');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 95, 108, 7.47, 85.55, '2025-01-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (6, 104, 46, 7.53, 74.74, '2025-03-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 9, 81, 9.55, 186.62, '2025-02-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (11, 39, 179, 4.54, 76.91, '2025-04-17');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 114, 14, 3.51, 5.41, '2025-03-31');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 94, 102, 2.37, 3.7, '2025-04-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 45, 50, 4.38, 68.56, '2025-04-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 25, 201, 6.66, 59.65, '2025-01-22');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (23, 2, 250, 9.03, 48.61, '2025-03-06');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 94, 20, 3.76, 19.65, '2025-04-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 21, 14, 2.0, 9.57, '2025-04-30');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 58, 126, 2.22, 11.44, '2025-03-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 36, 129, 6.85, 68.98, '2025-03-05');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 103, 225, 6.65, 38.66, '2025-02-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (7, 81, 45, 4.21, 13.02, '2025-03-05');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 99, 1, 3.29, 58.54, '2025-02-07');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 49, 7, 7.62, 139.77, '2025-03-30');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 115, 198, 8.83, 167.55, '2025-01-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 26, 150, 5.07, 61.09, '2025-05-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 82, 213, 1.88, 6.48, '2025-04-23');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 82, 150, 8.98, 36.31, '2025-01-29');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 96, 119, 7.37, 106.87, '2025-05-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (6, 76, 223, 9.94, 80.23, '2025-01-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 46, 40, 9.16, 62.4, '2025-04-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 113, 147, 6.2, 15.32, '2025-04-14');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 76, 162, 4.24, 33.07, '2025-03-16');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 62, 51, 2.95, 14.44, '2025-04-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 94, 80, 6.98, 117.52, '2025-03-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 119, 1, 2.58, 25.72, '2025-05-01');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 98, 123, 7.15, 108.51, '2025-01-15');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 65, 235, 1.32, 17.13, '2025-03-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 96, 6, 5.26, 61.07, '2025-02-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (2, 98, 119, 3.56, 15.56, '2025-05-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (22, 78, 168, 7.36, 54.42, '2025-04-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 110, 144, 7.98, 112.14, '2025-05-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 50, 214, 2.57, 22.19, '2025-02-24');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 55, 82, 2.73, 12.31, '2025-03-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 114, 94, 5.03, 99.52, '2025-03-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (29, 44, 124, 4.85, 45.05, '2025-04-24');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 51, 245, 3.7, 57.25, '2025-03-20');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 72, 42, 7.66, 101.34, '2025-03-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (25, 111, 48, 2.51, 24.69, '2025-02-05');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 2, 67, 2.68, 43.11, '2025-04-28');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 24, 133, 2.99, 58.23, '2025-05-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 73, 153, 7.6, 49.28, '2025-03-22');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (16, 1, 135, 1.72, 32.46, '2025-03-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (30, 83, 213, 1.46, 24.88, '2025-03-30');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (3, 54, 123, 2.47, 5.99, '2025-01-10');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (19, 73, 54, 4.35, 11.63, '2025-02-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (14, 1, 114, 9.03, 149.86, '2025-02-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 14, 57, 1.66, 20.91, '2025-02-09');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 91, 82, 2.0, 16.22, '2025-05-08');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (18, 38, 128, 7.57, 63.97, '2025-01-21');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (17, 44, 195, 2.02, 25.59, '2025-01-03');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (12, 5, 214, 7.84, 24.12, '2025-01-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 51, 23, 4.8, 85.2, '2025-02-16');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (5, 117, 231, 5.62, 51.68, '2025-04-11');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (27, 92, 237, 3.63, 24.42, '2025-02-15');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (13, 64, 101, 9.88, 167.55, '2025-03-27');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (28, 80, 106, 8.54, 121.39, '2025-02-18');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (9, 62, 146, 2.43, 44.38, '2025-01-15');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (6, 81, 104, 1.49, 18.26, '2025-04-15');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (26, 77, 7, 5.9, 43.43, '2025-02-16');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 89, 56, 5.78, 75.38, '2025-04-13');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (2, 33, 15, 2.25, 24.32, '2025-02-19');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (21, 100, 64, 1.9, 14.87, '2025-03-12');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (1, 72, 215, 3.46, 42.24, '2025-03-26');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (4, 2, 76, 6.53, 25.64, '2025-05-02');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (20, 10, 145, 9.36, 161.49, '2025-03-05');
INSERT INTO transactions (user_id, store_id, product_id, quantity, cost, transaction_date)
                                           VALUES (8, 75, 107, 3.22, 7.25, '2025-05-09');