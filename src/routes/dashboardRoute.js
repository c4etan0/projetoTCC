const express = require("express");
const DashboardController = require("../controllers/admin/dashboardController");
const AuthAdminMiddleware = require("../middlewares/authAdminMiddleware");

const dashboardRoute = express.Router();

dashboardRoute.get(
  "/",
  AuthAdminMiddleware.authAdmin,
  DashboardController.getDashboard
);

module.exports = dashboardRoute;
