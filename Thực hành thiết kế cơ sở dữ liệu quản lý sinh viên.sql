-- Tạo database UniversityDB
CREATE DATABASE UniversityDB;

-- Tạo schema university
CREATE schema university;

-- Tạo bảng Students
CREATE TABLE university.Students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    email VARCHAR(255) NOT NULL UNIQUE
);

-- Tạo bảng Courses
CREATE TABLE university.Courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT
);

-- Tạo bảng Enrollments
CREATE TABLE university.Enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES university.Students(student_id),
    course_id INT REFERENCES university.Courses(course_id),
    enroll_date DATE
);

-- Xem danh sách database
SELECT datname FROM pg_database;

-- Xem danh sách schema
SELECT schema_name FROM information_schema.schemata;

-- Xem cấu trúc bảng Students
SELECT column_name, data_type, character_maximum_length, is_nullable
FROM information_schema.columns
WHERE table_schema = 'university' AND table_name = 'students';

-- Xem cấu trúc bảng Courses
SELECT column_name, data_type, character_maximum_length, is_nullable
FROM information_schema.columns
WHERE table_schema = 'university' AND table_name = 'courses';

-- Xem cấu trúc bảng Enrollments
SELECT column_name, data_type, character_maximum_length, is_nullable
FROM information_schema.columns
WHERE table_schema = 'university' AND table_name = 'enrollments';