SELECT teachers.name as teacher, cohorts.name as cohort, count(assistance_requests) as total_assistances
FROM teachers
  JOIN assistance_requests ON teachers.id = teacher_id
  JOIN students ON students.id = student_id
  JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
ORDER BY teacher;

-- CREATE TABLE teachers (
--   id SERIAL PRIMARY KEY NOT NULL,
--   name VARCHAR(255) NOT NULL,
--   is_active BOOLEAN DEFAULT TRUE,
--   start_date DATE,
--   end_date DATE  
-- );

-- CREATE TABLE assistance_requests (
--   id SERIAL PRIMARY KEY NOT NULL,
--   student_id INTEGER REFERENCES students(id) ON DELETE CASCADE,
--   teacher_id INTEGER REFERENCES teachers(id) ON DELETE CASCADE,
--   assignment_id INTEGER REFERENCES assignments(id) ON DELETE CASCADE,
--   created_at TIMESTAMP,
--   started_at TIMESTAMP,
--   completed_at TIMESTAMP,
--   student_feedback TEXT,
--   teacher_feedback TEXT
-- );

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