1.CREATE TABLE EMP (
    emp_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100),
    email VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    dept_id INTEGER REFERENCES DEPARTMENT(department_id),
    address_id INTEGER REFERENCES ADDRESS(add_id),
    blood_group VARCHAR(3),
    dob DATE,
    doj DATE,
    dot DATE,
    created_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    reference VARCHAR(100),
    role VARCHAR(100),
    salary FLOAT,
    band INTEGER,
    reports_to INTEGER
);

2.CREATE TABLE ADDRESS (
    add_id SERIAL PRIMARY KEY,
    country VARCHAR(100),
    state VARCHAR(100),
    city VARCHAR(100),
    street VARCHAR(255),
    zipcode INTEGER,
    pre_known_add JSON,
    created_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


3.CREATE TABLE DEPARTMENT (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100),
    department_code CHAR(4) NOT NULL,
    address_id INTEGER REFERENCES ADDRESS(add_id),
    dept_head_id INTEGER NOT NULL
);

4.INSERT INTO ADDRESS (country, state, city, street, zipcode, pre_known_add, created_ts, last_updated_ts)
VALUES
('USA', 'California', 'Los Angeles', '123 Hollywood Blvd', '90001', '{"landmark": "near Griffith Park"}', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('Canada', 'Ontario', 'Toronto', '456 Queen St', 'M5H 2N2', '{"landmark": "near CN Tower"}', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('UK', 'England', 'London', '789 Baker St', 'NW1 6XE', '{"landmark": "near Regent''s Park"}', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('India', 'Maharashtra', 'Mumbai', '101 Marine Drive', '400020', '{"landmark": "near Gateway of India"}', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

5.INSERT INTO DEPARTMENT (department_name, department_code, dept_head_id)
VALUES
('Sales', 'SLS', 101),
('Marketing', 'MKT', 102),
('HR', 'HRD',  103),
('IT', 'ITD',  104);
6.INSERT INTO DEPARTMENT (department_name, department_code, address_id, dept_head_id)
VALUES
('Sales', 'SLS', 1, 101),
('Marketing', 'MKT', 2, 102),
('HR', 'HRD', 3, 103),
('IT', 'ITD', 4, 104);
7.UPDATE EMP SET salary = 10000 WHERE emp_id = 1;

UPDATE ADDRESS SET city = 'vizag' WHERE add_id = 1;

UPDATE DEPARTMENT SET department_name = 'testing' WHERE department_id = 1;
8.DELETE FROM EMP WHERE emp_id = 4;

DELETE FROM ADDRESS WHERE add_id = 4;

DELETE FROM DEPARTMENT WHERE department_id = 4;
9.ALTER TABLE EMP DROP COLUMN reports_to;
10.ALTER TABLE DEPARTMENT DROP COLUMN dept_head_id;
11.ALTER TABLE EMP ALTER COLUMN band TYPE VARCHAR(10);
12.SELECT emp_id, first_name, last_name, DATE_PART('year', AGE(dob)) AS age FROM EMP;
13.SELECT CURRENT_DATE;
14.SELECT emp_id, first_name, last_name, DATE_PART('year', AGE(doj)) AS experience FROM EMP;
15.ALTER TABLE EMP ADD COLUMN comment_col VARCHAR(255);
16.ALTER TABLE DEPARTMENT ADD COLUMN comment_col VARCHAR(255);
17.TRUNCATE TABLE EMP, DEPARTMENT, ADDRESS;
18.CREATE VIEW EMP_DETAILS AS
SELECT 
    EMP.emp_id, 
    CASE 
        WHEN EMP.last_name IS NOT NULL THEN CONCAT(EMP.first_name, ' ', EMP.last_name) 
        ELSE EMP.first_name 
    END AS name,
    CONCAT(ADDRESS.street, ', ', ADDRESS.city, ', ', ADDRESS.state, ', ', ADDRESS.country, ', ', ADDRESS.zipcode) AS address,
    DEPARTMENT.department_name AS dept_name,
    EMP.salary
FROM 
    EMP
JOIN 
    DEPARTMENT ON EMP.dept_id = DEPARTMENT.department_id
JOIN 
    ADDRESS ON EMP.address_id = ADDRESS.add_id;
19.DROP TABLE IF EXISTS EMP, DEPARTMENT, ADDRESS;
