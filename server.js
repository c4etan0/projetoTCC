require("dotenv").config();
const express = require("express");
const route = require("./src/routes/routes");
const path = require("path");
const session = require("express-session");
const cookieParser = require("cookie-parser");
const database = require("./src/database/database");
const adminRoute = require("./src/routes/adminRoute");
const dashboardRoute = require("./src/routes/dashboardRoute");
const registerRoute = require("./src/routes/registerRouters");
const loginRoute = require("./src/routes/loginRoute");
const logoutAdminRoute = require("./src/routes/logoutAdminRoute");
const logoutRoute = require("./src/routes/logoutRoutes");
const profileRoute = require("./src/routes/profileRoute");
const pagesRoute = require("./src/routes/pageRoutes");
const uploadAdminRoute = require("./src/routes/uploadAdminRoute");

const app = express();
const port = process.env.PORTSERVER || 3000;

app.set("view engine", "ejs");
app.set("views", "./src/views");

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.use(express.static(path.join(__dirname, "./public")));

app.use(cookieParser());
app.use(
  session({
    name: "session",
    secret: process.env.SECRET,
    resave: true,
    cookie: {
      maxAge: 60 * 60 * 1000,
    },
    saveUninitialized: true,
  })
);

app.use((req, res, next) => {
  res.locals.session = req.session;

  next();
});

app.use("/", route);
app.use("/admin", adminRoute);
app.use("/dashboard", dashboardRoute);
app.use("/login", loginRoute);
app.use("/register", registerRoute);
app.use("/logoutAdmin", logoutAdminRoute);
app.use("/logout", logoutRoute);
app.use("/profile", profileRoute);
app.use("/pages", pagesRoute);
app.use("/upload", uploadAdminRoute);

app.listen(port, async () => {
  const [result] = await database.query("SELECT 1");
  if (result) {
    console.log(`http://localhost:${port}`);
  }
});
