const database = require("../database/database");

module.exports = class UploadImagesModel {
  static async selectAllImages() {
    const selectAllImages = "SELECT * FROM user_images";
    const [results] = await database.query(selectAllImages);
    return results;
  }

  static async postImages(user_image_name) {
    const insertImages = "INSERT INTO user_images (user_image_name) VALUES (?)";
    const [result] = await database.query(insertImages, [user_image_name]);
    return result;
  }
};
