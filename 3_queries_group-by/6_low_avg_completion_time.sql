SELECT students.name as student, 
        avg(assignment_submissions.duration) as average_assignment_duration, 
        avg(assignments.duration) as average_estimated_duration
FROM students
  JOIN assignment_submissions ON students.id = student_id
  JOIN assignments ON assignment_id = assignments.id
  WHERE end_date IS NULL
  GROUP BY student 
  HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
  ORDER BY average_assignment_duration;


-- CREATE TABLE cohorts (
--   id SERIAL PRIMARY KEY NOT NULL,
--   name VARCHAR(255) NOT NULL,
--   start_date DATE,
--   end_date DATE
-- );

-- CREATE TABLE students (
--   id SERIAL PRIMARY KEY NOT NULL,
--   name VARCHAR(255) NOT NULL,
--   email VARCHAR(255),
--   phone VARCHAR(32),
--   github VARCHAR(255),
--   start_date DATE,
--   end_date DATE,
--   cohort_id INTEGER REFERENCES cohorts(id) ON DELETE CASCADE
-- );

-- CREATE TABLE assignments (
--   id SERIAL PRIMARY KEY NOT NULL,
--   name VARCHAR(255),
--   content TEXT,
--   day INTEGER,
--   chapter INTEGER,
--   duration INTEGER
-- );


-- CREATE TABLE assignment_submissions (
--   id SERIAL PRIMARY KEY NOT NULL,
--   assignment_id INTEGER REFERENCES assignments(id) ON DELETE CASCADE,
--   student_id INTEGER REFERENCES students(id) ON DELETE CASCADE,
--   duration INTEGER,
--   submission_date DATE
-- );