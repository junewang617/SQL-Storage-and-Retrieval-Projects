-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/XWwkwD
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Drop tables if they exist
DROP TABLE IF EXISTS Titles;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Dept_Manager;
DROP TABLE IF EXISTS Dept_Employees;
DROP TABLE IF EXISTS Salaries;

-- Create all tables from data folder
CREATE TABLE Titles (
    title_ID varchar(30)   NOT NULL,
    title varchar(30)   NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (
        title_ID
     )
);

CREATE TABLE Employees (
    emp_no int   NOT NULL,
    emp_title_ID varchar(30)   NOT NULL,
    birth_date date   NOT NULL,
    first_name varchar(30)   NOT NULL,
    last_name varchar(30)   NOT NULL,
    sex varchar(30)   NOT NULL,
    hire_date date   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Departments (
    dept_no varchar(30)   NOT NULL,
    dept_name varchar(30)   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE Dept_Manager (
    dept_no varchar(30)   NOT NULL,
    emp_no int   NOT NULL
);

CREATE TABLE Dept_Employees (
    emp_no int   NOT NULL,
    dept_no varchar(30)   NOT NULL
);

CREATE TABLE Salaries (
    emp_no int   NOT NULL,
    salary int   NOT NULL
);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_emp_title_ID FOREIGN KEY(emp_title_ID)
REFERENCES Titles (title_ID);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_Employees ADD CONSTRAINT fk_Dept_Employees_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_Employees ADD CONSTRAINT fk_Dept_Employees_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

