-- To view databases
show databases;

-- Using the db
USE survey_db;

-- Insert sample customers
INSERT INTO Customers (name, email, phone) VALUES
('John Doe', 'john.doe@example.com', '1234567890'),
('Jane Smith', 'jane.smith@example.com', '0987654321'),
('Alice Brown', 'alice.brown@example.com', '5555555'),
('Bob Johnson', 'bob.johnson@example.com', '4444444'),
('Emma Davis', 'emma.davis@example.com', '3333333');

-- Insert sample survey questions
INSERT INTO SurveyQuestions (question_text) VALUES
('Food Quality'),
('Hygiene'),
('Service Speed'),
('Staff Behavior'),
('Overall Experience');

-- Insert sample responses
INSERT INTO Responses (customer_id, question_id, rating) VALUES
(1, 1, 'HIGHLY_SATISFIED'), -- John Doe on Food Quality
(1, 2, 'SATISFIED'),        -- John Doe on Hygiene
(1, 3, 'NEUTRAL'),          -- John Doe on Service Speed
(1, 4, 'SATISFIED'),        -- John Doe on Staff Behavior
(1, 5, 'HIGHLY_SATISFIED'), -- John Doe on Overall Experience
(2, 1, 'SATISFIED'),        -- Jane Smith on Food Quality
(2, 2, 'NEUTRAL'),          -- Jane Smith on Hygiene
(2, 3, 'DISSATISFIED'),     -- Jane Smith on Service Speed
(2, 4, 'NEUTRAL'),          -- Jane Smith on Staff Behavior
(2, 5, 'SATISFIED'),        -- Jane Smith on Overall Experience
(3, 1, 'NEUTRAL'),          -- Alice Brown on Food Quality
(3, 2, 'HIGHLY_SATISFIED'), -- Alice Brown on Hygiene
(3, 3, 'SATISFIED'),        -- Alice Brown on Service Speed
(3, 4, 'HIGHLY_SATISFIED'), -- Alice Brown on Staff Behavior
(3, 5, 'SATISFIED'),        -- Alice Brown on Overall Experience
(4, 1, 'DISSATISFIED'),     -- Bob Johnson on Food Quality
(4, 2, 'NEUTRAL'),          -- Bob Johnson on Hygiene
(4, 3, 'HIGHLY_DISSATISFIED'), -- Bob Johnson on Service Speed
(4, 4, 'DISSATISFIED'),     -- Bob Johnson on Staff Behavior
(4, 5, 'NEUTRAL'),          -- Bob Johnson on Overall Experience
(5, 1, 'HIGHLY_SATISFIED'), -- Emma Davis on Food Quality
(5, 2, 'SATISFIED'),        -- Emma Davis on Hygiene
(5, 3, 'NEUTRAL'),          -- Emma Davis on Service Speed
(5, 4, 'SATISFIED'),        -- Emma Davis on Staff Behavior
(5, 5, 'HIGHLY_SATISFIED'); -- Emma Davis on Overall Experience



