-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/vGeHKj
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Department" (
    "dept_no" varchar   NOT NULL,
    "dept_name" varchar   NOT NULL,
    CONSTRAINT "pk_Department" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "DepartmentEmployees" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar   NOT NULL,
    "from_date" Date   NOT NULL,
    "to_date" Date   NOT NULL
);

CREATE TABLE "DepartmentManagers" (
    "dept_no" varchar   NOT NULL,
    "emp_no" int   NOT NULL,
    "from_date" Date   NOT NULL,
    "to_date" Date   NOT NULL
);

CREATE TABLE "Employees" (
    "emp_no" int   NOT NULL,
    "birth_date" Date   NOT NULL,
    "first_name" Varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "gender" varchar   NOT NULL,
    "hire_date" Date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    "from_date" Date   NOT NULL,
    "to_date" Date   NOT NULL
);

CREATE TABLE "Titles" (
    "emp_no" int   NOT NULL,
    "title" varchar   NOT NULL,
    "from_date" Date   NOT NULL,
    "to_date" Date   NOT NULL
);

ALTER TABLE "DepartmentEmployees" ADD CONSTRAINT "fk_DepartmentEmployees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "DepartmentEmployees" ADD CONSTRAINT "fk_DepartmentEmployees_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Department" ("dept_no");

ALTER TABLE "DepartmentManagers" ADD CONSTRAINT "fk_DepartmentManagers_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Department" ("dept_no");

ALTER TABLE "DepartmentManagers" ADD CONSTRAINT "fk_DepartmentManagers_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

CREATE INDEX "idx_Department_dept_name"
ON "Department" ("dept_name");

