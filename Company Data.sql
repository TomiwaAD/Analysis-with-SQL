DROP TABLE employee;

 CREATE TABLE employee (
     emp_id INT PRIMARY KEY,
     first_name VARCHAR(40),
     last_name VARCHAR(40),
     Birth_day DATE,
     sex VARCHAR(1),
     salary INT,
     super_id INT,
     branch_id INT
 );

 DESCRIBE employee;

 DROP TABLE branch;

 CREATE TABLE branch (
     branch_id INT PRIMARY KEY,
     branch_name VARCHAR(40),
     mgr_id INT,
     mgr_start_date DATE,
     FOREIGN KEY(mgr_id) REFERENCES employee (emp_id) ON DELETE SET NULL
 );

 INSERT INTO branch VALUES( , 'corporate', 100, '2006-02-09');

DESCRIBE branch;

 ALTER TABLE employee
 ADD FOREIGN KEY(branch_id)
 REFERENCES branch(branch_id)
 ON DELETE SET NULL;

 ALTER TABLE employee
 ADD FOREIGN KEY(super_id)
 REFERENCES employee(emp_id)
 ON DELETE SET NULL;

 CREATE TABLE client (
     client_id INT PRIMARY KEY,
     client_name VARCHAR(40),
     branch_id INT,
     FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
 );

 DROP TABLE works_with;

 CREATE TABLE works_with (
     emp_id INT,
     client_id INT,
     total_sales INT,
     PRIMARY KEY(emp_id, client_id),
     FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
     FOREIGN KEY(client_id)REFERENCES client(client_id) ON DELETE CASCADE
     );
     

     CREATE TABLE branch_suplier(
         branch_id INT,
         supplier_name VARCHAR(40),
         supply_type VARCHAR(40),
         PRIMARY KEY(branch_id, supplier_name),
         FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
     );

     ---corporate 
     INSERT INTO employee VALUES(100, 'Steve', 'Jobs', '1967-11-17', 'M', 250000, NULL, NULL);

     INSERT INTO branch VALUES(1, 'corporate', 100, '2006-02-09');

     UPDATE employee
     SET branch_id = 1
     WHERE emp_id = 100;

     DESCRIBE employee;

     SELECT * FROM employee;


     INSERT INTO employee VALUES (101, 'Larry', 'Page', '1961-05-11', 'F', 11000, 100, 1);

     INSERT INTO employee VALUES (102, 'Barack', 'Obama', '1964-03-15', 'M', 75000, NULL, NULL);

     INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');


UPDATE employee
     SET branch_id = 2
     WHERE emp_id = 102;


INSERT INTO employee VALUES (103, 'John', 'Claire', '1971-06-21', 'F', 63000, NULL, NULL);
INSERT INTO employee VALUES (104, 'Gwen', 'Natalie', '1980-02-05', 'F', 55000, NULL, NULL);
INSERT INTO employee VALUES (105, 'Jack', 'Simpson', '1961-05-11', 'F', 69000, NULL, NULL);
INSERT INTO employee VALUES (106, 'Andy', 'Roberson', '1969-09-05', 'F', 78000, NULL, NULL);
INSERT INTO employee VALUES (107, 'Reiss', 'Neilson', '1973-07-22', 'F', 65000, NULL, NULL);
INSERT INTO employee VALUES (108, 'Paul', 'Schloes', '1978-10-01', 'F', 71000, NULL, NULL);

INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee
     SET super_id = 106
     WHERE emp_id = 108; 


     UPDATE employee
     SET branch_id = 3
     WHERE emp_id = 108;

     INSERT INTO branch_suplier VALUES(2, 'Hammer Mill', 'Paper');
     INSERT INTO branch_suplier VALUES(2, 'Uni-ball', 'Writing Utensils');
     INSERT INTO branch_suplier VALUES(3, 'Patriot Paper', 'Paper');
     INSERT INTO branch_suplier VALUES(2, 'J.T. Firms & Labels', 'Customer Forms');
     INSERT INTO branch_suplier VALUES(3, 'Uni-ball', 'Writing Utensils');
     INSERT INTO branch_suplier VALUES(3, 'Hammer Mill', 'Paper');
     INSERT INTO branch_suplier VALUES(3, 'Standford Labels', 'Custom Forms');

     INSERT INTO client VALUES(400, 'Dunmore Highscholl', 2);
     INSERT INTO client VALUES(401, 'Lakawana County', 2);
     INSERT INTO client VALUES(402, 'FedEx', 2);
     INSERT INTO client VALUES(403, 'John Daly Law LLC', 3);
     INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
     INSERT INTO client VALUES(405, 'Times Newspaper', 3);
     INSERT INTO client VALUES(406, 'FedEx', 2);

     INSERT INTO works_with VALUES(105, 400, 55000);
     INSERT INTO works_with VALUES(102, 401, 267000);
     INSERT INTO works_with VALUES(108, 402, 22500);
     INSERT INTO works_with VALUES(107, 403, 5000);
     INSERT INTO works_with VALUES(108, 403, 12000);
     INSERT INTO works_with VALUES(105, 404, 33000);
     INSERT INTO works_with VALUES(107, 405, 26000);
     INSERT INTO works_with VALUES(102, 406, 15000);
     INSERT INTO works_with VALUES(105, 406, 13000);
    


---Find all Cleint
SELECT *
FROM client;

--find all Employees ordered by Salary
SELECT *
FROM employee
ORDER BY sex, first_name, last_name;


--find the first 5 employee on the table
SELECT *
FROM employee
LIMIT 5;


--find all Employees ordered by Salary
SELECT first_name, last_name
FROM employee;


--find the forename and surnames names of all Employees 
SELECT first_name AS forename, last_name AS surname
FROM employee;


--find all the different genders

SELECT DISTINCT sex 
FROM employee;


--find all the different genders

SELECT DISTINCT branch_id
FROM employee;

--find the number of employee
SELECT COUNT(emp_id)
FROM employee;


---SQL FUCTIONS
--find the number of female employee born before 1970
SELECT COUNT(emp_id)
FROM employee
WHERE sex = "f" AND birth_day > '1970-01-01';

--find the average of all employee salary
SELECT AVG(salary)
FROM employee;

--find the average of allMale employee salary
SELECT AVG(salary)
FROM employee
WHERE sex = 'M';

--Find the sum of all employee salary
SELECT SUM(salary)
FROM employee;

--find out how many males and females there are

SELECT COUNT(sex), sex
FROM employee
GROUP BY sex;

--find the total sales of each saleman
SELECT SUM(total_sales), emp_id
FROM works_with
GROUP BY emp_id;

--wildcards in SQL
---%(any number of character with similar name) = # characters, _ = one character
--Find any client's who are an LLC

SELECT *
FROM client
WHERE client_name LIKE '%LLC';

--Find any branch supplier who are in the label business
SELECT *
FROM branch_suplier
WHERE supplier_name LIKE '%labels';


--find any employee bron in october
SELECT *
FROM employee
WHERE birth_day LIKE '____-02%';

--find any client who are school
SELECT *
FROM client
WHERE client_name LIKE '%scholl%';

---UNION IN SQL(HAS TO BE SAME DATATYPE 
--FIND A LIST OF EMPLOYEE AND BRANCH NAMES
SELECT first_name
FROM employee AS company_name
UNION
SELECT branch_name
FROM branch
UNION
SELECT client_name
FROM client;

--find a list of all client & branch suppliers'names
SELECT client_name, branch_id
FROM client
UNION
SELECT supplier_name, branch_id
FROM branch_suplier;

--find all the money spend or earned by the company 
SELECT salary
FROM employee
UNION
SELECT total_sales
FROM works_with;

--JOINS in SQL
INSERT INTO branch VALUES(4, 'Buffalo', NULL, NULL);

--find all the braches and the name of the manager
--inner join(combine row whenever there is shared column in common) 
SELECT employee.emp_id, employee.first_name, employee.last_name, branch.branch_name
FROM employee
JOIN branch
ON employee.emp_id = branch.mgr_id;

--LEFT JOIN
SELECT employee.emp_id, employee.first_name, employee.last_name, branch.branch_name
FROM employee
LEFT JOIN branch
ON employee.emp_id = branch.mgr_id;

--RIGTH JOIN
SELECT employee.emp_id, employee.first_name, employee.last_name, branch.branch_name
FROM employee
RIGHT JOIN branch
ON employee.emp_id = branch.mgr_id;

--FULL OUTER JOIN


--nested query
---find names of all employees who have
--sold over 30,000 to a single client

SELECT employee.first_name, employee.last_name
FROM employee
WHERE employee.emp_id IN (
    SELECT works_with.emp_id
    FROM works_with 
    WHERE works_with.total_sales > 30000
);


---find all clients who are handled by the bracnch
--that barack obama managers
---Assume you know obama's ID
SELECT client.client_name
FROM client
WHERE client.branch_id = (
SELECT branch.branch_id
FROM branch
WHERE branch.mgr_id =102
);


---triggers(define action to happen if an event take place)

CREATE TABLE trigger_test(
    meassge VARCHAR(100)
 );

--TO BE COPY ABD PASTE IN TERMINATE
 DELIMETER $$
 CREATE
    TRIGGER my_trigger BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
        INSERT INTO trigger_test VALUES('added new employee);
    END$$
DELIMETER ;

