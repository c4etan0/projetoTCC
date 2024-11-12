const path = require("path");
const UploadImagesModel = require("../models/uploadImagesModel");

module.exports = class UploadImagesAdminController {
  static async getUploadAdminImages(req, res) {
    const adminUser = req.session.adminUser;
    const results = await UploadImagesModel.selectAllImages();

    return res.render("uploadAdmin", {
      adminUser,
      msgSuccess: req.query.msgSuccess,
      msgError: req.query.msgError,
      error: req.query.error,
      results,
    });
  }

  static async postUploadAdminImages(req, res) {
    const user_image_date = new Date().toJSON().slice(0, 19).replace("T", " ");

    if (!req.file) {
      return res.redirect(
        "/upload?msgError=Opa você precisa selecionar uma imagem para realizar o Upload!&error=false"
      );
    }

    const user_image_name = `/${req.file.filename}`;
    const imgData = {
      user_image_name,
    };

    const results = await UploadImagesModel.postImages(imgData);

    if (!results) {
      return res.redirect(
        "/upload?msgError=Não Foi possivel fazer Upload da imagem!&error=false"
      );
    }

    return res.redirect(
      "/upload?msgSuccess=Upload da imagem realizado com sucesso!&error=true"
    );
  }
};