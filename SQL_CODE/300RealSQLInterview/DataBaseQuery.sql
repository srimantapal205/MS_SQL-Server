CREATE DATABASE interview_practice;
GO

USE interview_practice;
GO

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100),
    creation_date DATE
);

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    gender VARCHAR(10),
    salary DECIMAL(10,2),
    hire_date DATE,
    manager_id INT NULL,
    department_id INT NULL,
    job_title VARCHAR(100),
    FOREIGN KEY (manager_id) REFERENCES employees(id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    country VARCHAR(50)
);


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    price DECIMAL(10,2)
);


CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    amount DECIMAL(12,2),
    quantity INT,
    sale_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(12,2),
    order_date DATE,
    discount_used BIT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    department_id INT,
    budget DECIMAL(12,2),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);



CREATE TABLE project_assignments (
    id INT PRIMARY KEY,
    employee_id INT,
    project_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);



CREATE TABLE promotions (
    promotion_id INT PRIMARY KEY,
    employee_id INT,
    promotion_date DATE,
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);

--- Insert Sample Data (MS-SQL Safe Insert)

INSERT INTO departments VALUES
(10, 'HR', '2018-01-10'),
(20, 'IT', '2017-03-15'),
(30, 'Finance', '2019-06-01'),
(40, 'Marketing', '2020-02-20');


INSERT INTO employees VALUES
(11, 'Eva', 'Female', 72000, '2025-08-12', 1, 20, 'Developer'),
(1, 'Alice', 'Female', 85000, '2018-02-15', NULL, 20, 'Director'),
(2, 'Bob', 'Male', 76000, '2019-04-10', 1, 20, 'Developer'),
(3, 'Carol', 'Female', 72000, '2020-06-12', 1, 20, 'Developer'),
(4, 'David', 'Male', 65000, '2019-08-25', 1, 30, 'Finance Analyst'),
(5, 'Eve', 'Female', 60000, '2021-01-10', 3, 20, 'Tester'),
(6, 'Frank', 'Male', 58000, '2018-11-05', 4, 30, 'Finance Analyst'),
(7, 'Grace', 'Female', 90000, '2017-07-20', NULL, 10, 'HR Head'),
(8, 'Henry', 'Male', 50000, '2023-01-05', 7, 10, 'HR Executive'),
(9, 'Isaac', 'Male', 45000, '2022-10-01', 4, 30, 'Accounts Assistant'),
(10, 'Judy', 'Female', 72000, '2018-04-01', 7, 10, 'HR Analyst');


INSERT INTO customers VALUES
(101, 'Riya', 'India'),
(102, 'Sam', 'USA'),
(103, 'Olivia', 'UK'),
(104, 'Michael', 'India'),
(105, 'Sophia', 'Canada');



INSERT INTO products VALUES
(501, 'Laptop', 1, 1000),
(502, 'Mouse', 1, 20),
(503, 'Keyboard', 1, 30),
(504, 'Headphones', 2, 60),
(505, 'Mobile', 2, 900);


INSERT INTO sales VALUES
(1001, 101, 501, 1000, 1, '2023-11-10'),
(1002, 102, 505, 900, 1, '2023-11-12'),
(1003, 103, 502, 40, 2, '2023-11-15'),
(1004, 104, 504, 60, 1, '2023-12-01'),
(1005, 105, 501, 2000, 2, '2023-12-05'),
(1006, 101, 503, 60, 2, '2024-01-15'),
(1007, 103, 505, 900, 1, '2024-01-20'),
(1008, 102, 504, 120, 2, '2024-02-13');


INSERT INTO orders VALUES
(7001, 101, 1000, '2023-11-10', 1),
(7002, 102, 2900, '2023-11-12', 0),
(7003, 103, 60, '2023-11-15', 0),
(7004, 101, 60, '2024-01-15', 0),
(7005, 105, 2000, '2023-12-05', 1);


INSERT INTO order_items VALUES
(1, 7001, 501, 1),
(2, 7002, 505, 1),
(3, 7003, 502, 2),
(4, 7004, 503, 2),
(5, 7005, 501, 2);


INSERT INTO projects VALUES
(9001, 'ERP Upgrade', 20, 500000),
(9002, 'Mobile Banking App', 30, 750000),
(9003, 'HRMS Migration', 10, 200000),
(9004, 'Marketing Portal', 40, 300000);



INSERT INTO project_assignments VALUES
(1, 2, 9001, '2023-01-01', '2023-06-30'),
(2, 3, 9001, '2023-03-15', '2023-10-15'),
(3, 5, 9001, '2023-02-10', '2023-05-05'),
(4, 4, 9002, '2022-08-01', '2023-09-15'),
(5, 6, 9002, '2022-10-01', '2023-12-01'),
(6, 8, 9003, '2023-01-15', '2023-11-30'),
(7, 10, 9003, '2023-02-01', '2023-12-31');


INSERT INTO promotions VALUES
(1, 2, '2022-06-01', 65000, 76000),
(2, 3, '2023-03-01', 65000, 72000),
(3, 10, '2021-05-10', 60000, 72000);


