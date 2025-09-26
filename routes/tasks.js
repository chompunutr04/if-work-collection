const express = require('express');
const db = require('../db');
const router = express.Router();

// Middleware ตรวจสอบว่าเข้าสู่ระบบหรือยัง
function requireLogin(req, res, next) {
  if (!req.session.user) return res.redirect('/login');
  next();
}

// แสดงรายการ tasks ทั้งหมดของผู้ใช้ที่เข้าสู่ระบบ
router.get('/', requireLogin, async (req, res) => {
  const [tasks] = await db.query('SELECT * FROM tasks WHERE user_id = ?', [req.session.user.id]);
  res.render('tasks/index', { tasks });
});

// แสดงฟอร์มเพิ่ม task ใหม่
router.get('/new', requireLogin, (req, res) => {
  res.render('tasks/new');
});

// เพิ่ม task ใหม่
router.post('/', requireLogin, async (req, res) => {
  const {
    date,
    task_description,
    due_date,
    completion_date,
    task_type,
    assigned_by,
    status
  } = req.body;

  await db.query(
    `INSERT INTO tasks
      (user_id, date, task_description, due_date, completion_date, task_type, assigned_by, status)
     VALUES (?, ?, ?, ?, ?, ?, ?, ?)`,
    [req.session.user.id, date, task_description, due_date, completion_date, task_type, assigned_by, status]
  );

  res.redirect('/tasks');
});

// แสดงฟอร์มแก้ไข task
router.get('/:id/edit', requireLogin, async (req, res) => {
  const [rows] = await db.query(
    'SELECT * FROM tasks WHERE id = ? AND user_id = ?',
    [req.params.id, req.session.user.id]
  );

  if (rows.length === 0) return res.send('ไม่พบข้อมูลที่ต้องการแก้ไข');
  res.render('tasks/edit', { task: rows[0] });
});

// บันทึกข้อมูล task ที่แก้ไขแล้ว
router.put('/:id', requireLogin, async (req, res) => {
  const {
    date,
    task_description,
    due_date,
    completion_date,
    task_type,
    assigned_by,
    status
  } = req.body;

  await db.query(
    `UPDATE tasks
     SET date = ?, task_description = ?, due_date = ?, completion_date = ?, task_type = ?, assigned_by = ?, status = ?
     WHERE id = ? AND user_id = ?`,
    [date, task_description, due_date, completion_date, task_type, assigned_by, status, req.params.id, req.session.user.id]
  );

  res.redirect('/tasks');
});

// ลบ task
router.delete('/:id', requireLogin, async (req, res) => {
  await db.query(
    'DELETE FROM tasks WHERE id = ? AND user_id = ?',
    [req.params.id, req.session.user.id]
  );

  res.redirect('/tasks');
});

module.exports = router;
