USE DaysSqlPractice_30;
GO



CREATE TABLE employee_hierarchy (
    id         INT PRIMARY KEY,
    name       VARCHAR(50),
    manager_id INT
);

INSERT INTO employee_hierarchy (id, name, manager_id) VALUES
(1, 'CEO',   NULL),
(2, 'Alice', 1),
(3, 'Bob',   1),
(4, 'Carol', 2),
(5, 'David', 2),
(6, 'Emma',  3);


SELECT * FROM employee_hierarchy;


WITH empHierarchy AS(
    SELECT 
        id, 
        name, 
        manager_id,
        0 AS Level
    FROM
        employee_hierarchy
    WHERE 
        manager_id IS NULL
    
    UNION ALL

    SELECT 
        e.id, 
        e.name, 
        e.manager_id,
        eh.Level + 1
    FROM 
        employee_hierarchy e
    INNER JOIN
    empHierarchy eh
    ON
       e.manager_id = eh.id
)
SELECT * FROM empHierarchy ORDER BY Level, manager_id;