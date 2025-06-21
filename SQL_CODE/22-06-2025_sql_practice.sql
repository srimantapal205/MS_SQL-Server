USE [sql_exercise]
GO
/*
'https://medium.com/@gunjansinghtandon/essential-sql-interview-questions-for-data-engineers-a3691c18f52e'
*/

-- 1. Joining Multiple Tables:
CREATE TABLE departments_table (
    dept_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE employees_table (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dept_id INT,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments_table(dept_id)
);
-- Departments
INSERT INTO departments_table (dept_id, department_name) VALUES
(1, 'Marketing'),
(2, 'Sales'),
(3, 'Finance'),
(4, 'Human Resources');

-- Employees
INSERT INTO employees_table (employee_id, first_name, last_name, dept_id, manager_id) VALUES
(1, 'John', 'Doe', 1, 3),
(2, 'Jane', 'Smith', 2, 3),
(3, 'Adam', 'Johnson', 1, NULL),
(4, 'Emily', 'Davis', 2, 3),
(5, 'Michael', 'Brown', 1, 3),
(6, 'Sarah', 'Wilson', 2, 3),
(7, 'David', 'Lee', 1, 3),
(8, 'Laura', 'Garcia', 2, 3),
(9, 'Ashley', 'Martinez', 4, 10),
(10, 'Christopher', 'Anderson', 4, NULL),
(11, 'Jessica', 'Taylor', 4, 10),
(12, 'Matthew', 'Thomas', 4, 10);



-- 2. Grouping and Aggregation:

CREATE TABLE item_orders (
    order_id INT PRIMARY KEY,
    product_category VARCHAR(50),
    order_amount INT
);

INSERT INTO item_orders (order_id, product_category, order_amount) VALUES
(1, 'Electronics', 500),
(2, 'Clothing', 200),
(3, 'Electronics', 800),
(4, 'Electronics', 700),
(5, 'Clothing', 300),
(6, 'Electronics', 600),
(7, 'Books', 150),
(8, 'Clothing', 400),
(9, 'Books', 250),
(10, 'Electronics', 900),
(11, 'Electronics', 750),
(12, 'Clothing', 350),
(13, 'Electronics', 1000),
(14, 'Books', 200),
(15, 'Clothing', 450),
(16, 'Electronics', 850),
(17, 'Electronics', 950),
(18, 'Clothing', 500),
(19, 'Books', 300),
(20, 'Electronics', 1200);


CREATE TABLE interactions (
    interaction_id INT PRIMARY KEY,
    post_id INT,
    user_id INT,
    interaction_type VARCHAR(20)
);

INSERT INTO interactions (interaction_id, post_id, user_id, interaction_type) VALUES
(1, 101, 1, 'Like'),
(2, 102, 2, 'Like'),
(3, 103, 3, 'Comment'),
(4, 104, 1, 'Share'),
(5, 105, 2, 'Like'),
(6, 106, 3, 'Share'),
(7, 107, 1, 'Comment'),
(8, 108, 2, 'Like'),
(9, 109, 3, 'Comment'),
(10, 110, 1, 'Like'),
(11, 111, 2, 'Share'),
(12, 112, 3, 'Comment');

--3. SQL Window Functions:

CREATE TABLE employee_salaries (
    employee_id INT PRIMARY KEY,
    department_id INT,
    salary INT
);

INSERT INTO employee_salaries (employee_id, department_id, salary) VALUES
(2, 1, 6000),
(3, 1, 5500),
(1, 1, 5000),
(6, 2, 6500),
(5, 2, 5800),
(4, 2, 6200),
(8, 3, 7200),
(9, 3, 6900),
(7, 3, 7000),
(10, 4, 5300);


CREATE TABLE products_item (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    product_category VARCHAR(50)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    revenue INT,
    FOREIGN KEY (product_id) REFERENCES products_item(product_id)
);
INSERT INTO products_item (product_id, product_name, product_category) VALUES
(1, 'Product A', 'Category 1'),
(2, 'Product B', 'Category 1'),
(3, 'Product C', 'Category 1'),
(4, 'Product D', 'Category 2'),
(5, 'Product E', 'Category 2'),
(6, 'Product F', 'Category 2');

INSERT INTO sales (sale_id, product_id, revenue) VALUES
(1, 1, 100),
(2, 1, 150),
(3, 2, 200),
(4, 2, 250),
(5, 3, 300),
(6, 3, 350),
(7, 4, 400),
(8, 4, 450),
(9, 5, 500),
(10, 5, 550),
(11, 6, 600),
(12, 6, 650);

/*
Write a SQL query to retrieve employee details along with their department and manager information from three tables: employees, departments, and employees (self-join for manager).
*/