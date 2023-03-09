const { Pool } = require('pg');

const pool = new Pool({
  user: 'labber',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const queryString = `
  SELECT distinct teachers.name as teacher, cohorts.name as cohorts
  FROM teachers
  JOIN assistance_requests ON teachers.id = teacher_id
  JOIN students ON students.id = student_id
  JOIN cohorts ON cohorts.id = cohort_id
  WHERE cohorts.name = $1
  ORDER BY teachers.name;
`;
const cohortName = process.argv[2] || 'JUL02';
const values = [cohortName];

pool.query(queryString, values)
.then(res => {
  console.log('connected');
  res.rows.forEach(data => {
    console.log(`${data.cohorts}: ${data.teacher}`);
  })
})
.catch(err => console.error('query error', err.stack));