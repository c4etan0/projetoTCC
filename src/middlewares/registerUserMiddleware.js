const RegisterUserModel = require("../models/registerUserModels");

module.exports = class RegisterUserMiddleware {
  static async verifyFields(req, res, next) {
    const { ...data_user } = req.body;

    const regex_email = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    const regex_senha = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[$#@%*&!?])/;

    const regex_maiuscula = /^(?=.*[A-Z])/;
    const regex_minuscula = /^(?=.*[a-z])/;
    const regex_numero = /^(?=.*[0-9])/;
    const regex_caracter_especial = /^(?=.*[$#@%*&!?])/;

    if (
      !data_user.user_name ||
      !data_user.user_email ||
      !data_user.user_password ||
      !data_user.userConfirmPassword
    ) {
      // req.message = {
      //   msgFieldsEmpty: "Os campos não podem ser vazios!",
      // };

      return res.redirect(
        "/register?msgFieldsEmpty=Os campos não podem ser vazios!"
      );
    }

    if (data_user.user_name.length < 3) {
      // req.message = {
      //   msgNameError: "Nome precisa ter no minino 3 caracteres!",
      // };

      return res.redirect(
        "/register?msgNameError=Nome precisa ter no minino 3 caracteres!"
      );
    }

    if (!regex_email.test(data_user.user_email)) {
      // req.message = {
      //   msgEmailError: "Digite um email valido!",
      // };

      return res.redirect("/register?msgErrorEmail=Digite um email valido!");
    }

    if (!regex_senha.test(data_user.user_password)) {
      // req.message = {
      //   passwordError:
      //     "Senha precisa ter Letras Maiusculas, Minusculas, Numeros e Caracteres especiais!",
      // };
      return res.redirect(
        "/register?passwordError=Senha precisa ter Letras Maiusculas, Minusculas, Numeros e Caracteres especiais!"
      );
    }

    if (data_user.user_password !== data_user.userConfirmPassword) {
      return res.redirect("/register?msgPassError=Senhas não são iguais!");
    }

    const recebeEmailFromModel = await RegisterUserModel.getUserByEmail(
      data_user.user_email
    );

    if (recebeEmailFromModel) {
      // req.message = {
      //   msgErrorEmail: "Email já existe no sistema!",
      // };

      return res.redirect(
        "/register?msgErrorEmail=Email já existe no sistema!"
      );
    }
    next();
  }
};
