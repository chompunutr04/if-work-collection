const express = require('express');
const bcrypt = require('bcryptjs');
const db = require('../db');
const router = express.Router();

router.get('/register', (req, res) => {
  res.render('register');
});

router.post('/register', async (req, res) => {
  const { employee_id, name, username, password, position, department, role } = req.body;
  const [rows] = await db.query('SELECT * FROM users WHERE employee_id = ?', [employee_id]);
  if (rows.length > 0) return res.send('มีรหัสพนักงานนี้แล้ว');

  const hash = await bcrypt.hash(password, 10);
  await db.query('INSERT INTO users (employee_id, name, username, password, position, department, role) VALUES (?, ?, ?, ?, ?, ?, ?)', [employee_id, name, username, hash, position, department, role || 'employee']);
  res.redirect('/login');
});

router.get('/login', (req, res) => {
  res.render('login');
});

router.post('/login', async (req, res) => {
  const { employee_id, password } = req.body;
  const [rows] = await db.query('SELECT * FROM users WHERE employee_id = ?', [employee_id]);
  if (rows.length === 0) return res.send('ไม่พบผู้ใช้งาน');

  const user = rows[0];
  const match = await bcrypt.compare(password, user.password);
  if (!match) return res.send('รหัสผ่านไม่ถูกต้อง');

  req.session.user = user;
  res.redirect('/dashboard');
});

router.get('/logout', (req, res) => {
  req.session.destroy(() => {
    res.redirect('/login');
  });
});

router.get('/dashboard', async (req, res) => {
  if (!req.session.user) return res.redirect('/login');
  res.render('dashboard');
});

module.exports = router;