const database = require("../database/database");

module.exports = class RegisterUserModel {
  static async getUserByEmail(getEmailFromUserController) {
    const selectEmail = "SELECT * FROM users WHERE user_email = ?";
    const [[result]] = await database.query(selectEmail, [
      getEmailFromUserController,
    ]);
    return result;
  }

  static async selectUserById(user_id) {
    const selectUserById = "SELECT * FROM users WHERE user_id = ?";
    const [[result]] = await database.query(selectUserById, [user_id]);
    return result;
  }

  static async postUser(userData) {
    const { user_name, user_email, user_password } = userData;
    const insertUser =
      "INSERT INTO users(user_name, user_email, user_password) VALUES (?, ?, ?)";
    const [result] = await database.query(insertUser, [
      user_name,
      user_email,
      user_password,
    ]);

    return result;
  }

  static async updateUserProfile(user_id, userData) {
    const { user_name, user_email, user_img_profile } = userData;
    const updateUserProfile =
      "UPDATE users SET user_name =?, user_email = ?, user_img_profile = ? WHERE user_id = ?;";
    const [result] = await database.query(updateUserProfile, [
      user_name,
      user_email,
      user_img_profile,
      user_id,
    ]);

    return result;
  }
};
