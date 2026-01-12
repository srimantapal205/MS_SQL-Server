/*
Find employees who are at the lowest level in the hierarchy (nosubordinates)
Problem Statement Given an employees table where each employee may have a manager_id, find employees whodo not manage anyone (i.e., leaf nodes in the hierarchy).
*/

USE [DaysSqlPractice_30];
GO

CREATE TABLE employeesList_table (
    id         INT PRIMARY KEY,
    name       VARCHAR(50),
    manager_id INT
);


INSERT INTO employeesList_table (id, name, manager_id) VALUES
(1, 'CEO',       NULL),
(2, 'Manager A', 1),
(3, 'Manager B', 1),
(4, 'Dev 1',     2),
(5, 'Dev 2',     2),
(6, 'QA',        3);


SELECT * FROM employeesList_table;


SELECT * FROM employeesList_table e WHERE NOT EXISTS(
        SELECT 1 FROM employeesList_table sub WHERE sub.manager_id = e.id
    )