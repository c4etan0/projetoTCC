class DashboardController {
  static async getDashboard(req, res) {
    const msgSuccess = req.query.msgSuccess;
    const adminUser = req.session.adminUser;
    res.render("dashboard", { msgSuccess, adminUser });
  }
}

module.exports = DashboardController;
