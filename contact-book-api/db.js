const mysql = require('mysql2');

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '123456789',
  database: 'contact_book'
});

db.connect((err) => {
  if (err) throw err;
  console.log('✅ Connected to MySQL database!');
});

module.exports = db;
