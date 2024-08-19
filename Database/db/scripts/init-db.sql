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

INSERT INTO stores (store_name, street_address, city_address, state_address, zip_address, date_created)
VALUES
    ('Stater Bros', '12345 Wrong St', 'Irvine', 'CA', '92602', CURRENT_DATE),
	('Stater Bros', '55555 Wrong St', 'Irvine', 'CA', '92602', CURRENT_DATE),
    ('Walmart', '12345 Wrong St', 'Irvine', 'CA', '92602', CURRENT_DATE),
    ('Target', '12345 Wrong St', 'Irvine', 'CA', '92602', CURRENT_DATE),
    ('Sprouts', '12345 Wrong St', 'Irvine', 'CA', '92602', CURRENT_DATE),
    ('Whole Foods', '12345 Wrong St', 'Irvine', 'CA', '92602', CURRENT_DATE),
    ('Whole Foods', '98165 Wrong St', 'Irvine', 'CA', '92602', CURRENT_DATE),
    ('Food 4 Less', '12345 Wrong St', 'Irvine', 'CA', '92602', CURRENT_DATE),
    ('Albertsons', '12345 Wrong St', 'Irvine', 'CA', '92602', CURRENT_DATE),
    ('CVS', '12345 Wrong St', 'Irvine', 'CA', '92602', CURRENT_DATE);

INSERT INTO brands (brand_name, date_created)
VALUES 
    ('Rao''s', CURRENT_DATE),
    ('Kelloggs', CURRENT_DATE),
    ('Dole', CURRENT_DATE),
    ('General Mills', CURRENT_DATE),
    ('Kraft', CURRENT_DATE),
    ('Barilla', CURRENT_DATE);

INSERT INTO products (product_name, brand_id, date_created)
VALUES
    ('Banana', 3, CURRENT_DATE),
    ('Marinara Sauce', 1, CURRENT_DATE),
    ('Pineapple', 3, CURRENT_DATE),
    ('Sliced Cheese', 5, CURRENT_DATE),
    ('Elbow Pasta', 6, CURRENT_DATE),
    ('Spaghetti', 6, CURRENT_DATE),
    ('Penne', 6, CURRENT_DATE),
    ('Tortillini', 6, CURRENT_DATE),
    ('Fettucine', 6, CURRENT_DATE),
    ('Linguine', 6, CURRENT_DATE),
    ('Rigatoni', 6, CURRENT_DATE);

INSERT INTO USERS (first_name, last_name, email, street_address, city_address, state_address, zip_address, date_created)
VALUES
    ('John', 'Doe', 'johndoe@email.com', '12345 Wrong St', 'Irvine', 'CA', '92602', CURRENT_DATE),
    ('Jane', 'Doe', 'janedoe@email.com', '12345 Wrong St', 'Irvine', 'CA', '92602', CURRENT_DATE),
    ('Bob', 'Doe', 'bobdoe@email.com', '12345 Wrong St', 'Irvine', 'CA', '92602', CURRENT_DATE),
    ('Andy', 'Doe', 'andydoe@email.com', '12345 Wrong St', 'Irvine', 'CA', '92602', CURRENT_DATE),
    ('Jill', 'Doe', 'jilldoe@email.com', '12345 Wrong St', 'Irvine', 'CA', '92602', CURRENT_DATE),
    ('Jack', 'Doe', 'jackdoe@email.com', '12345 Wrong St', 'Irvine', 'CA', '92602', CURRENT_DATE),
    ('Ralph', 'Doe', 'ralphdoe@email.com', '12345 Wrong St', 'Irvine', 'CA', '92602', CURRENT_DATE),
    ('Anne', 'Doe', 'annedoe@email.com', '12345 Wrong St', 'Irvine', 'CA', '92602', CURRENT_DATE),
    ('Dell', 'Doe', 'delldoe@email.com', '12345 Wrong St', 'Irvine', 'CA', '92602', CURRENT_DATE),
    ('Michael', 'Doe', 'michaeldoe@email.com', '12345 Wrong St', 'Irvine', 'CA', '92602', CURRENT_DATE),
    ('Thad', 'Doe', 'thaddoe@email.com', '12345 Wrong St', 'Irvine', 'CA', '92602', CURRENT_DATE),
    ('Zelda', 'Doe', 'zeldadoe@email.com', '12345 Wrong St', 'Irvine', 'CA', '92602', CURRENT_DATE);

INSERT INTO transactions (user_id, product_id, quantity, cost, store_id, transaction_date)
VALUES
    (1, 1, 7, 5.32, 1, CURRENT_DATE), --banana
    (2, 1, 8, 6.21, 3, CURRENT_DATE),
    (3, 1, 9, 2.23, 4, CURRENT_DATE),
    (4, 1, 10, 4.34, 1, CURRENT_DATE),
    (5, 1, 11, 9.87, 10, CURRENT_DATE),
    (6, 1, 12, 8.89, 8, CURRENT_DATE),
    (7, 1, 7, 6.01, 5, CURRENT_DATE),
    (8, 1, 8, 5.21, 7, CURRENT_DATE),
    (9, 1, 9, 7.31, 3, CURRENT_DATE),
    (10, 1, 4, 3.21, 8, CURRENT_DATE),
    (11, 1, 2, 0.48, 9, CURRENT_DATE),
    (12, 1, 3, 0.56, 6, CURRENT_DATE),
    (1, 2, 7, 55.32, 1, CURRENT_DATE), --marinara
    (2, 2, 8, 66.21, 3, CURRENT_DATE),
    (3, 2, 9, 52.23, 4, CURRENT_DATE),
    (4, 2, 10, 64.34, 1, CURRENT_DATE),
    (5, 2, 11, 79.87, 10, CURRENT_DATE),
    (6, 2, 12, 88.89, 8, CURRENT_DATE),
    (7, 2, 7, 76.01, 5, CURRENT_DATE),
    (8, 2, 8, 45.21, 7, CURRENT_DATE),
    (9, 2, 9, 87.31, 3, CURRENT_DATE),
    (10, 2, 4, 33.21, 8, CURRENT_DATE),
    (11, 2, 2, 20.48, 9, CURRENT_DATE),
    (12, 2, 3, 30.56, 6, CURRENT_DATE),
    (1, 3, 7, 15.32, 1, CURRENT_DATE), --pineapple
    (2, 3, 8, 16.21, 3, CURRENT_DATE),
    (3, 3, 9, 22.23, 4, CURRENT_DATE),
    (4, 3, 10, 24.34, 1, CURRENT_DATE),
    (5, 3, 11, 29.87, 10, CURRENT_DATE),
    (6, 3, 12, 28.89, 8, CURRENT_DATE),
    (7, 3, 7, 16.01, 5, CURRENT_DATE),
    (8, 3, 8, 15.21, 7, CURRENT_DATE),
    (9, 3, 9, 17.31, 3, CURRENT_DATE),
    (10, 3, 4, 6.21, 8, CURRENT_DATE),
    (11, 3, 2, 4.48, 9, CURRENT_DATE),
    (12, 3, 3, 6.56, 6, CURRENT_DATE),
    (1, 4, 7, 66.32, 1, CURRENT_DATE), --sliced cheese
    (2, 4, 8, 79.21, 3, CURRENT_DATE),
    (3, 4, 9, 84.23, 4, CURRENT_DATE),
    (4, 4, 10, 82.34, 1, CURRENT_DATE),
    (5, 4, 11, 89.87, 10, CURRENT_DATE),
    (6, 4, 12, 99.89, 8, CURRENT_DATE),
    (7, 4, 7, 45.01, 5, CURRENT_DATE),
    (8, 4, 8, 66.21, 7, CURRENT_DATE),
    (9, 4, 9, 74.31, 3, CURRENT_DATE),
    (10, 4, 4, 22.21, 8, CURRENT_DATE),
    (11, 4, 2, 35.48, 9, CURRENT_DATE),
    (12, 4, 3, 31.56, 6, CURRENT_DATE),
    (1, 5, 7, 56.32, 1, CURRENT_DATE), --Elbow Pasta
    (2, 5, 8, 31.21, 3, CURRENT_DATE),
    (3, 5, 9, 54.23, 4, CURRENT_DATE),
    (4, 5, 10, 44.34, 1, CURRENT_DATE),
    (5, 5, 11, 45.87, 10, CURRENT_DATE),
    (6, 5, 12, 46.89, 8, CURRENT_DATE),
    (7, 5, 7, 38.01, 5, CURRENT_DATE),
    (8, 5, 8, 68.21, 7, CURRENT_DATE),
    (9, 5, 9, 48.31, 3, CURRENT_DATE),
    (10, 5, 4, 56.21, 8, CURRENT_DATE),
    (11, 5, 2, 14.48, 9, CURRENT_DATE),
    (12, 5, 3, 26.56, 6, CURRENT_DATE),
    (1, 6, 7, 25.32, 1, CURRENT_DATE), --Spaghetti
    (2, 6, 8, 36.21, 3, CURRENT_DATE),
    (3, 6, 9, 42.23, 4, CURRENT_DATE),
    (4, 6, 10, 54.34, 1, CURRENT_DATE),
    (5, 6, 11, 49.87, 10, CURRENT_DATE),
    (6, 6, 12, 58.89, 8, CURRENT_DATE),
    (7, 6, 7, 36.01, 5, CURRENT_DATE),
    (8, 6, 8, 45.21, 7, CURRENT_DATE),
    (9, 6, 9, 37.31, 3, CURRENT_DATE),
    (10, 6, 4, 22.21, 8, CURRENT_DATE),
    (11, 6, 2, 14.48, 9, CURRENT_DATE),
    (12, 6, 3, 26.56, 6, CURRENT_DATE),
    (1, 7, 7, 15.32, 1, CURRENT_DATE), --Penne
    (2, 7, 8, 16.21, 3, CURRENT_DATE),
    (3, 7, 9, 22.23, 4, CURRENT_DATE),
    (4, 7, 10, 24.34, 1, CURRENT_DATE),
    (5, 7, 11, 29.87, 10, CURRENT_DATE),
    (6, 7, 12, 28.89, 8, CURRENT_DATE),
    (7, 7, 7, 16.01, 5, CURRENT_DATE),
    (8, 7, 8, 15.21, 7, CURRENT_DATE),
    (9, 7, 9, 17.31, 3, CURRENT_DATE),
    (10, 7, 4, 6.21, 8, CURRENT_DATE),
    (11, 7, 2, 4.48, 9, CURRENT_DATE),
    (12, 7, 3, 6.56, 6, CURRENT_DATE),
    (1, 8, 7, 15.32, 1, CURRENT_DATE), --Tortillini
    (2, 8, 8, 16.21, 3, CURRENT_DATE),
    (3, 8, 9, 22.23, 4, CURRENT_DATE),
    (4, 8, 10, 24.34, 1, CURRENT_DATE),
    (5, 8, 11, 29.87, 10, CURRENT_DATE),
    (6, 8, 12, 28.89, 8, CURRENT_DATE),
    (7, 8, 7, 16.01, 5, CURRENT_DATE),
    (8, 8, 8, 15.21, 7, CURRENT_DATE),
    (9, 8, 9, 17.31, 3, CURRENT_DATE),
    (10, 8, 4, 6.21, 8, CURRENT_DATE),
    (11, 8, 2, 4.48, 9, CURRENT_DATE),
    (12, 8, 3, 6.56, 6, CURRENT_DATE),
    (1, 9, 7, 15.32, 1, CURRENT_DATE), --Fettucine
    (2, 9, 8, 16.21, 3, CURRENT_DATE),
    (3, 9, 9, 22.23, 4, CURRENT_DATE),
    (4, 9, 10, 24.34, 1, CURRENT_DATE),
    (5, 9, 11, 29.87, 10, CURRENT_DATE),
    (6, 9, 12, 28.89, 8, CURRENT_DATE),
    (7, 9, 7, 16.01, 5, CURRENT_DATE),
    (8, 9, 8, 15.21, 7, CURRENT_DATE),
    (9, 9, 9, 17.31, 3, CURRENT_DATE),
    (10, 9, 4, 6.21, 8, CURRENT_DATE),
    (11, 9, 2, 4.48, 9, CURRENT_DATE),
    (12, 9, 3, 6.56, 6, CURRENT_DATE),
    (1, 10, 7, 15.32, 1, CURRENT_DATE), --Linguine
    (2, 10, 8, 16.21, 3, CURRENT_DATE),
    (3, 10, 9, 22.23, 4, CURRENT_DATE),
    (4, 10, 10, 24.34, 1, CURRENT_DATE),
    (5, 10, 11, 29.87, 10, CURRENT_DATE),
    (6, 10, 12, 28.89, 8, CURRENT_DATE),
    (7, 10, 7, 16.01, 5, CURRENT_DATE),
    (8, 10, 8, 15.21, 7, CURRENT_DATE),
    (9, 10, 9, 17.31, 3, CURRENT_DATE),
    (10, 10, 4, 6.21, 8, CURRENT_DATE),
    (11, 10, 2, 4.48, 9, CURRENT_DATE),
    (12, 10, 3, 6.56, 6, CURRENT_DATE),
    (1, 11, 7, 15.32, 1, CURRENT_DATE), --Rigatoni
    (2, 11, 8, 16.21, 3, CURRENT_DATE),
    (3, 11, 9, 22.23, 4, CURRENT_DATE),
    (4, 11, 10, 24.34, 1, CURRENT_DATE),
    (5, 11, 11, 29.87, 10, CURRENT_DATE),
    (6, 11, 12, 28.89, 8, CURRENT_DATE),
    (7, 11, 7, 16.01, 5, CURRENT_DATE),
    (8, 11, 8, 15.21, 7, CURRENT_DATE),
    (9, 11, 9, 17.31, 3, CURRENT_DATE),
    (10, 11, 4, 6.21, 8, CURRENT_DATE),
    (11, 11, 2, 4.48, 9, CURRENT_DATE),
    (12, 11, 3, 6.56, 6, CURRENT_DATE);
