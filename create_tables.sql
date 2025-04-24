-- To view databases
show databases;

-- Creating database 
CREATE DATABASE survey_db;

-- Using the db
USE survey_db;

-- Creating tables of db 
-- Customer Table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT,
    name VARCHAR(45),
    email VARCHAR(45),
    phone VARCHAR(45),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (customer_id),
    CONSTRAINT email_unique UNIQUE (email)
);

-- Survey Questions Table
CREATE TABLE SurveyQuestions (
    question_id INT AUTO_INCREMENT,
    question_text VARCHAR(45),
    PRIMARY KEY (question_id)
);

-- Response Table
CREATE TABLE Responses (
    response_id INT AUTO_INCREMENT,
    customer_id INT,
    question_id INT,
    rating ENUM('HIGHLY_SATISFIED', 'SATISFIED', 'NEUTRAL', 'DISSATISFIED', 'HIGHLY_DISSATISFIED'),
    response_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (response_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (question_id) REFERENCES SurveyQuestions(question_id),
    INDEX customer_idx (customer_id),
    INDEX question_id_idx (question_id)
);
