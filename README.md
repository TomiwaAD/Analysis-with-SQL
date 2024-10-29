
# Company Relational Database Project With Mysql

## Introduction
This project involves designing and analyzing a relational database to manage employee and branch information for a company. The database provides a systematic approach to storing, retrieving, and managing data for employees, including their details, hierarchical reporting relationships, and branch assignments. Using SQL, this project illustrates foundational database management and data analysis techniques that maintain data integrity while supporting efficient information retrieval.

## Problem Statement
Efficiently managing and accessing employee and branch data is critical for any growing organization. Without a structured approach, companies may face difficulties in tracking employee details, hierarchical structures, and branch locations, leading to operational inefficiencies. This project addresses these challenges by building a relational database that:
- Organizes employee details, including hierarchical reporting and branch assignments.
- Ensures data consistency through relational integrity.
- Provides the ability to perform structured queries, allowing for insights into the organization’s workforce and branch management.

## Skills Demonstrated
This project demonstrates several SQL skills and techniques essential for effective database management and data analysis:
- **Database Design and Creation**: Using `CREATE TABLE` statements to structure tables with primary and foreign key relationships.
- **Data Manipulation**: Efficiently inserting and updating records within the database to maintain current information.
- **Relational Integrity**: Implementing foreign keys to maintain consistent relationships between tables.
- **Hierarchical Querying**: Using SQL queries to explore reporting structures within the organization.
- **Conditional Logic and Aggregation**: Applying `CASE` statements, aggregation functions, and data manipulation techniques to organize and analyze employee data across various branches.

## Data Transformation

### Table Creation and Structure
1. **Employee Table**: 
   - The `employee` table stores employee data, including identifiers for each employee’s supervisor and branch. Key columns include:
     - `emp_id` (Primary Key): Unique identifier for each employee.
     - `first_name` and `last_name`: Employee names.
     - `super_id`: Supervisor ID, establishing a hierarchical reporting structure.
     - `branch_id`: Branch assignment for each employee.

   - **SQL Script**:
     ```sql
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
     ```

2. **Branch Table**:
   - The `branch` table organizes data on each company branch, including branch ID, manager information, and start dates for managers. Key columns include:
     - `branch_id` (Primary Key): Unique identifier for each branch.
     - `mgr_id`: Manager ID (linked to `emp_id` in `employee`).
     - `mgr_start_date`: Date the manager began overseeing the branch.

   - **SQL Script**:
     ```sql
     CREATE TABLE branch (
         branch_id INT PRIMARY KEY,
         branch_name VARCHAR(40),
         mgr_id INT,
         mgr_start_date DATE,
         FOREIGN KEY(mgr_id) REFERENCES employee (emp_id) ON DELETE SET NULL
     );
     ```

### Data Insertion and Querying
1. **Data Insertion**:
   - Populated tables with initial data for employees and branches, establishing relational links between employees and their respective branches and supervisors.

2. **Hierarchical and Relational Queries**:
   - Extracted hierarchical information, such as direct and indirect reporting relationships, using recursive queries to reveal multi-level organizational structures.
   - Aggregated data to analyze the number of employees at each branch, the reporting structure, and salary distributions.

### Key Queries for Analysis
1. **Supervisor-Employee Relationships**:
   - Query to identify each employee’s supervisor and their corresponding branch:
     ```sql
     SELECT e.first_name AS Employee, s.first_name AS Supervisor, b.branch_name
     FROM employee e
     LEFT JOIN employee s ON e.super_id = s.emp_id
     JOIN branch b ON e.branch_id = b.branch_id;
     ```

2. **Branch Employee Counts**:
   - Query to count employees per branch, aiding in understanding resource distribution:
     ```sql
     SELECT b.branch_name, COUNT(e.emp_id) AS Employee_Count
     FROM employee e
     JOIN branch b ON e.branch_id = b.branch_id
     GROUP BY b.branch_name;
     ```

3. **Salary Analysis by Branch**:
   - Query to analyze average salary per branch, supporting resource and budgeting decisions:
     ```sql
     SELECT b.branch_name, AVG(e.salary) AS Average_Salary
     FROM employee e
     JOIN branch b ON e.branch_id = b.branch_id
     GROUP BY b.branch_name;
     ```

## Conclusion
This SQL project effectively demonstrates how a relational database can support efficient management of employee and branch data. By structuring employee information and establishing hierarchical relationships, the project enables clear insights into organizational structure and branch-level resource allocation. The database design and queries can be extended to support additional functionalities, such as performance metrics, project assignments, and financial reporting, making it a scalable solution for dynamic business needs. 

--- 
