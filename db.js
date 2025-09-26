const mysql = require('mysql2');
const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'if_work_collection'
});
module.exports = pool.promise();