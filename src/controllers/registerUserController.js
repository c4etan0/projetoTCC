const RegisterUserModel = require("../models/registerUserModels");

const registerUser = new RegisterUserModel();

class RegisterUserController {
  getRegister(req, res) {
    return res.render("register", {
      msg: "",
    });
  }

  async store(req, res) {
    // console.log(data_user);
    return res.send("user register");
  }
}
module.exports = RegisterUserController;
