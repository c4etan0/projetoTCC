const PagesModel = require("../../models/pagesModel");
const PositionModel = require("../../models/positionModel");
const UploadImagesModel = require("../../models/uploadImagesModel");

module.exports = class PagesController {
  static async getPages(req, res) {
    const adminUser = req.session.adminUser;
    const result = await PagesModel.selectJoinPagesPosition();

    return res.render("pages", {
      adminUser,
      pages: result,
      msgSuccess: req.query.msgSuccess,
      msgError: req.query.msgError,
    });
  }

  static async getCreatePages(req, res) {
    const adminUser = req.session.adminUser;
    const getPosition = await PositionModel.selectAllPosition();
    const getImages = await UploadImagesModel.selectAllImages();

    return res.render("createPages", {
      adminUser,
      getPosition,
      msgSuccess: req.query.msgSuccess,
      msgError: req.query.msgError,
      images: getImages,
    });
  }

  static async postCreatePages(req, res) {
    const { page_title, page_position_id, page_status, page_content } =
      req.body;

    if (!page_title || !page_position_id || !page_status || !page_content) {
      return res.redirect(
        "/pages/createPages?msgError=Você precisa preencher todos os campos para cadastrar uma página!"
      );
    }

    const statusBoolean = page_status === "Publicado" ? 1 : 0;
    const position_position_id = Number(page_position_id);

    const page = {
      page_title,
      page_status: statusBoolean,
      page_content,
      position_position_id,
    };

    const result = await PagesModel.insertPages(page);
    console.log(result);

    return res.redirect(
      "/pages/createPages?msgSuccess=Pagina criada com sucesso!"
    );
  }

  static async getEditPage(req, res) {
    const adminUser = req.session.adminUser;
    const getParams = req.params.id;

    const resultPosition = await PositionModel.selectAllPosition();
    const result = await PagesModel.selectJoinPagesPositionById(getParams);
    const getImages = await UploadImagesModel.selectAllImages();

    return res.render("editPage", {
      adminUser,
      msgSuccess: req.query.msgSuccess,
      msgError: req.query.msgError,
      page: result,
      positions: resultPosition,
      images: getImages,
    });
  }

  static async putEditPage(req, res) {
    const { page_title, page_position_id, page_status, page_content } =
      req.body;
    const getParams = req.params.id;

    const statusBoolean = page_status === "Publicado" ? 1 : 0;
    const position_position_id = Number(page_position_id);

    const getDataUpdate = {
      page_title,
      page_status: statusBoolean,
      page_content,
      position_position_id,
    };

    const result = await PagesModel.updatePage(getParams, getDataUpdate);

    return res.redirect("/pages?msgSuccess=Atualizado com sucesso!");
  }

  static async deletePage(req, res) {
    const getId = req.params.id;

    const result = await PagesModel.deletePage(getId);

    return res.redirect("/pages?msgSuccess=Pagina deletada com sucesso!");
  }
};
