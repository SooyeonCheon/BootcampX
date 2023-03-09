const { Pool } = require('pg');

const pool = new Pool({
  user: 'labber',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});


pool.query(`
  SELECT distinct teachers.name as teacher, cohorts.name as cohorts
  FROM teachers
  JOIN assistance_requests ON teachers.id = teacher_id
  JOIN students ON students.id = student_id
  JOIN cohorts ON cohorts.id = cohort_id
  WHERE cohorts.name = '${process.argv[2] || 'JUL02'}'
  ORDER BY teachers.name;
`)
.then(res => {
  console.log('connected');
  res.rows.forEach(data => {
    console.log(`${data.cohorts}: ${data.teacher}`);
  })
})
.catch(err => console.error('query error', err.stack));