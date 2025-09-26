const express = require("express");
const session = require("express-session");
const methodOverride = require("method-override");
const path = require("path");
const ejsLayouts = require("express-ejs-layouts");

const app = express();

// Routes
const authRoutes = require("./routes/auth");
const taskRoutes = require("./routes/tasks");

// View Engine
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));
const expressLayouts = require("express-ejs-layouts");
app.use(expressLayouts);
app.set("layout", "layout"); // layout.ejs

// Middleware
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, "public")));
app.use(methodOverride("_method"));
app.use(
  session({
    secret: "secretKey",
    resave: false,
    saveUninitialized: false, // ปรับให้ปลอดภัยขึ้น
  })
);

// Share user info to all views
app.use((req, res, next) => {
  res.locals.user = req.session.user || null;
  next();
});

// Routes
app.use("/", authRoutes);
app.use("/tasks", taskRoutes);

// Dashboard redirect
app.get("/", (req, res) => {
  res.redirect("/dashboard");
});

app.get("/login", (req, res) => {
  res.render("login");
});
app.get("/index", (req, res) => {
  res.render("tasks/index", { title: "Pk" });
});

app.post("/login", (req, res) => {
  const { username, password } = req.body;

  if (username === "admin" && password === "password") {
    req.session.user = { username };
    return res.redirect("/dashboard");
  }
  res.render("login", { error: "Invalid credentials" });
});

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});
