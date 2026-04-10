-- Tạo database ElearningDB
CREATE DATABASE ElearningDB;

-- Tạo schema elearning
CREATE schema elearning;

-- Tạo bảng Students
CREATE TABLE elearning.Students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);

-- Tạo bảng Instructors
CREATE TABLE elearning.Instructors (
    instructor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);

-- Tạo bảng Courses
CREATE TABLE elearning.Courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    instructor_id INT REFERENCES elearning.Instructors(instructor_id)
);

-- Tạo bảng Enrollments
CREATE TABLE elearning.Enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES elearning.Students(student_id),
    course_id INT REFERENCES elearning.Courses(course_id),
    enroll_date DATE NOT NULL
);

-- Tạo bảng Assignments
CREATE TABLE elearning.Assignments (
    assignment_id SERIAL PRIMARY KEY,
    course_id INT REFERENCES elearning.Courses(course_id),
    title VARCHAR(100) NOT NULL,
    due_date DATE NOT NULL
);

-- Tạo bảng Submissions
CREATE TABLE elearning.Submissions (
    submission_id SERIAL PRIMARY KEY,
    assignment_id INT REFERENCES elearning.Assignments(assignment_id),
    student_id INT REFERENCES elearning.Students(student_id),
    submission_date DATE NOT NULL,
    grade NUMERIC(5,2) CHECK (grade >= 0 AND grade <= 100)
);