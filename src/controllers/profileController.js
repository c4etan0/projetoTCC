class ProfileController {
  static async getProfile(req, res) {
    res.render("profile");
  }
}

module.exports = ProfileController;
