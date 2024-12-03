const bcrypt = require("bcryptjs");
const RegisterUserModel = require("../models/registerUserModels");

class RegisterController {
  static async getRegister(req, res) {
    return res.render("register", {
      msgError: req.query.msgError,
      msgSuccess: req.query.msgSuccess,
      msgFieldsEmpty: req.query.msgFieldsEmpty,
      msgNameError: req.query.msgNameError,
      msgPassError: req.query.msgPassError,
      passwordError: req.query.passwordError,
      msgErrorEmail: req.query.msgErrorEmail,
      msgErrorDB: req.query.msgErrorDB,
      msg: "",
    });
  }

  static async postRegister(req, res) {
    const { user_name, user_email, user_password } = req.body;

    const passworHashed = await bcrypt.hash(user_password, 10);

    const userData = {
      user_name,
      user_email,
      user_password: passworHashed,
    };

    const resultInsert = await RegisterUserModel.postUser(userData);

    if (!resultInsert) {
      req.message = {
        msgErrorDB: "Não foi possivel realizar o cadastro",
      };
      console.log(req.message);
      return res.render("register", {
        msg: req.message,
      });
    }

    return res.redirect("login");
  }
}

module.exports = RegisterController;
