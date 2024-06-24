CREATE TABLE "Departments" (
    "dept_id" VARCHAR(5) NOT NULL,
    "dept_name" VARCHAR(30) NOT NULL,
    "last_updated" TIMESTAMP default localtimestamp NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY ("dept_id")
);

CREATE TABLE "Titles" (
    "title_id" VARCHAR(10) NOT NULL,
    "title" VARCHAR(50) NOT NULL,
    "last_updated" TIMESTAMP default localtimestamp NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY ("title_id")
);

CREATE TABLE "Employees" (
    "emp_no" INTEGER NOT NULL,
    "emp_title_id" VARCHAR(5) NOT NULL,
    "birth_date" DATE NOT NULL,
    "first_name" VARCHAR(50) NOT NULL,
    "last_name" VARCHAR(50) NOT NULL,
    "sex" VARCHAR(1) NOT NULL,
    "hire_date" DATE NOT NULL,
    "last_updated" TIMESTAMP default localtimestamp NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY ("emp_no")
);

CREATE TABLE "Dept_emp" (
    "emp_pk" SERIAL NOT NULL,
    "emp_no" INTEGER NOT NULL,
    "dept_no" VARCHAR(5) NOT NULL,
    "last_updated" TIMESTAMP default localtimestamp NOT NULL,
    CONSTRAINT "pk_Dept_emp" PRIMARY KEY ("emp_pk")
);

CREATE TABLE "Dept_manager" (
    "mgr_id" SERIAL NOT NULL,
    "dept_no" VARCHAR(5) NOT NULL,
    "emp_no" INTEGER NOT NULL,
    "last_updated" TIMESTAMP default localtimestamp NOT NULL,
    CONSTRAINT "pk_Dept_manager" PRIMARY KEY ("mgr_id")
);

CREATE TABLE "Salaries" (
    "sal_id" SERIAL NOT NULL,
    "emp_no" INTEGER NOT NULL,
    "salary" INTEGER NOT NULL,
    "last_updated" TIMESTAMP default localtimestamp NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY ("sal_id")
);

SELECT * FROM Departments;

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "Titles" ("title_id");

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_id");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_id");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

-- testing data output
SELECT * FROM "Salaries" LIMIT 5;