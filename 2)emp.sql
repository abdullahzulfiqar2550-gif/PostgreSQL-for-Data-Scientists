create database demo;
select current_schema();
CREATE SCHEMA xeven;

CREATE TABLE employee(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    location VARCHAR(100),
    joining_date INT,
    score NUMERIC(3,1),
    job_domain VARCHAR(100),
    language_id INT);

SELECT * FROM xeven.income;

CREATE TABLE xeven.course(
    course_id INT PRIMARY KEY,
    name VARCHAR(100),
    study_year INT);


CREATE TABLE xeven.empstudy(
    emp_id VARCHAR(100),
    course_id INT);


CREATE TABLE xeven.income(
    emp_id NUMERIC(3,1),
    salary NUMERIC(12,2),
    unit VARCHAR(20),
    currency VARCHAR(20));


CREATE TABLE xeven.income(
    languag_id VARCHAR(50) PRIMARY KEY,
    lang VARCHAR(50));

DROP schema xeven cascade;