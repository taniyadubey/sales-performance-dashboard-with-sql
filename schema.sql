CREATE TABLE salespersons (
    salesperson_id INT PRIMARY KEY,
    name VARCHAR(100),
    region VARCHAR(50),
    monthly_target DECIMAL(10,2)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    region VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    sale_date DATE,
    salesperson_id INT,
    customer_id INT,
    product_id INT,
    quantity INT,
    revenue DECIMAL(10,2),
    cost DECIMAL(10,2),
    FOREIGN KEY (salesperson_id) REFERENCES salespersons(salesperson_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
