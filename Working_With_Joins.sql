CREATE DATABASE DBMSLab5;
USE DBMSLab5;
CREATE TABLE CUSTOMER (
  customer_id INT NOT NULL UNIQUE,
  customer_name VARCHAR(100) NOT NULL,
  city VARCHAR(100) NOT NULL
  );

  INSERT INTO CUSTOMER (customer_id, customer_name, city) VALUES
   (1, 'A', 'Bangalore'),
   (2, 'B', 'Delhi'),
   (3, 'C', 'Mumbai'),
   (4, 'D', 'Chennai');

   SELECT * FROM CUSTOMER;
   
CREATE TABLE ORDERS (
    order_id INT NOT NULL UNIQUE,
    customer_id INT,
    product_name VARCHAR(50) NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER (customer_id)
);

INSERT INTO ORDERS (order_id, customer_id, product_name, order_date) VALUES
   (101, 1, 'Laptop', '2023-12-15'),
   (102, 2, 'Smartphone', '2024-01-10'),
   (103, 1, 'Headphones', '2024-02-20'),
   (104, 3, 'Tablet', '2024-03-05');
   
SELECT * FROM ORDERS;
  
-- inner join  
SELECT CUSTOMER.customer_name, ORDERS.product_name, CUSTOMER.city
FROM CUSTOMER
INNER JOIN ORDERS ON CUSTOMER.customer_id = ORDERS.customer_id
WHERE CUSTOMER.city = 'Bangalore';

-- left outer join
SELECT CUSTOMER.customer_name, ORDERS.product_name
FROM CUSTOMER
LEFT JOIN ORDERS ON CUSTOMER.customer_id = ORDERS.customer_id;

-- right outer join
SELECT CUSTOMER.customer_name, ORDERS.product_name
FROM CUSTOMER
RIGHT JOIN ORDERS ON CUSTOMER.customer_id = ORDERS.customer_id;

-- full outer join
SELECT CUSTOMER.customer_name, ORDERS.product_name FROM CUSTOMER
LEFT JOIN ORDERS ON CUSTOMER.customer_id = ORDERS.customer_id
UNION
SELECT CUSTOMER.customer_name, ORDERS.product_name FROM CUSTOMER
RIGHT JOIN ORDERS ON CUSTOMER.customer_id = ORDERS.customer_id;

-- natural join
SELECT * FROM CUSTOMER NATURAL JOIN ORDERS;

