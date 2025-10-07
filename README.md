# IF Work Collection — Task & Work Logging System

<p align="center">
 <img width="500" height="400" alt="ifdata" src="https://github.com/user-attachments/assets/43b29a11-d3cb-47a6-bf56-c0fca732d29d" />
</p>

## 📘 Overview (English)
This project began as a Year-3 academic assignment and is currently being developed into a real application.  
IF Work Collection is a lightweight task and work-logging system for academic support staff at the Faculty of Informatics, Burapha University.  
Staff can record daily/weekly tasks, attach files, and generate simple reports for supervision and KPI tracking.

## ⚙️ Key Features
- Role-based access (employee, admin, HR, supervisor).  
- CRUD for tasks with metadata: date, due_date, completion_date, task_type, assigned_by, status.  
- File attachment support (store files and save relative path).  
- Edit-approval workflow for task updates.  
- Search and filter tasks by name, date, and user.  
- Reporting dashboard with PDF (UTF-8 / Thai support) and Excel export.  
- Simple, responsive UI with server-rendered EJS templates.

## 🧠 Technologies
- Node.js • Express.js  
- EJS templates  
- MySQL / MariaDB (database: `if_work_collection`)  
- Tailwind CSS and CSS
- multer (file uploads), PDF generation tool (e.g., Puppeteer / html-pdf / other)  
- cookie-session or express-session

## 🚀 Quick Start
1. Clone repository:
   ```bash
   git clone https://github.com/chompunutr04/if-work-collection.git
   cd if-work-collection
2. Install dependencies:
   ```bash
   npm install

3. Prepare database:
  - Create a database named if_work_collection.
  - Run any provided SQL scripts or create tables according to the schema.

4. Create a .env file (example):
    ```ini
    PORT=3000
    DB_HOST=localhost
    DB_USER=root
    DB_PASS=your_db_password
    DB_NAME=if_work_collection
    SESSION_SECRET=change_this_secret
    UPLOAD_DIR=public/uploads/attachment

5. Start the app:
   ```bash
   npm start
   # or
   node index.js

6. Open in browser:
   ```arduino
   http://localhost:3000

## 📁 Example Project Structure
   ```pgsql
   IF_Data/
     controllers/
     middleware/
     routes/
     views/
     public/
     css/
     js/
     images/
       uploads/attachment/
     database.js
     index.js
     package.json
     .env
   README.md


