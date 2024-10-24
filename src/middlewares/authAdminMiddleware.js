const jwt = require("jsonwebtoken");

module.exports = class AuthAdminMiddleware {
  static async authAdmin(req, res, next) {
    const { tokenAdmin } = req.cookies;

    if (!tokenAdmin) {
      res.redirect(
        "/admin?msgError=Você precisa se autenticar para acessar o sistema!"
      );
    }

    next();
  }
};
