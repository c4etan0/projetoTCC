const bcrypt = require("bcryptjs");
const RegisterUserModel = require("../models/registerUserModels");

class RegisterController {
  static async getRegister(req, res) {
    return res.render("register", {
      msg: "",
    });
  }

  static async postRegister(req, res) {
    const { user_name, user_email, user_password } = req.body;
    const user_date = new Date().toJSON().slice(0, 19).replace("T", " ");

    const passworHashed = await bcrypt.hash(user_password, 10);

    const userData = {
      user_name,
      user_email,
      user_password: passworHashed,
      user_date,
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
