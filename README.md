

# Company Database SQL Project

## Overview
This project establishes a robust relational database for managing employee information across multiple branches within a company. The database is structured to efficiently store and retrieve details about employees, their supervisors, and the branches they operate in. It also enforces relational integrity, ensuring that data remains consistent and accurately reflects the company’s organizational hierarchy.

## Database Schema
The database consists of the following key tables:

1. **Employee Table (`employee`)**:
   - **Columns**:
     - `emp_id` (INT, Primary Key): Unique identifier for each employee.
     - `first_name` (VARCHAR): Employee's first name.
     - `last_name` (VARCHAR): Employee's last name.
     - `Birth_day` (DATE): Date of birth of the employee.
     - `sex` (VARCHAR): Gender identifier (single character).
     - `salary` (INT): Employee's annual salary.
     - `super_id` (INT): ID of the employee's supervisor (links to `emp_id` in the same table).
     - `branch_id` (INT): ID of the branch where the employee works (foreign key linking to `branch`).

2. **Branch Table (`branch`)**:
   - **Columns**:
     - `branch_id` (INT, Primary Key): Unique identifier for each branch.
     - `branch_name` (VARCHAR): Name of the branch.
     - `mgr_id` (INT): ID of the branch manager (links to `emp_id` in `employee`).
     - `mgr_start_date` (DATE): Date the manager assumed their position.
   - **Relationships**:
     - The `mgr_id` column is a foreign key referencing `emp_id` in the `employee` table, allowing seamless tracking of managerial positions and assignments.
     - `ON DELETE SET NULL` constraint ensures that if a manager's record is removed, the `mgr_id` will be set to NULL, maintaining branch data without data loss.

## Key Features
- **Relational Integrity**: Foreign key constraints maintain links between employees and branches, ensuring accurate hierarchy and organizational relationships.
- **Hierarchical Structure**: The `super_id` column in the `employee` table facilitates the creation of a multi-level employee hierarchy, ideal for managing teams and reporting structures.
- **Data Security**: Using `ON DELETE SET NULL` safeguards important data against accidental deletions, ensuring that only specific information is removed without compromising the entire dataset.



4. **Verify the structure**: Use the `DESCRIBE` command to check that tables have been set up correctly:
   ```sql
   DESCRIBE employee;
   DESCRIBE branch;
   ```

## SQL Commands & Queries
The following core SQL commands are used in this project:
1. **`DROP TABLE`**: Removes existing tables to ensure a clean slate before creation.
2. **`CREATE TABLE`**: Defines the structure for each table (`employee`, `branch`) and sets up primary and foreign keys.
3. **`INSERT INTO`**: Populates the tables with sample data to demonstrate database functionality.
4. **`FOREIGN KEY`**: Establishes relationships between tables, ensuring data consistency.
