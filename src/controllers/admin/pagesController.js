const PagesModel = require("..//../models/pagesModel");
const PositionModel = require("..//../models/positionModel");

module.exports = class PagesController {
  static async getPages(req, res) {
    const adminUser = req.session.adminUser;
    const result = await PagesModel.selectJoinPagesPosition();

    return res.render("pages", {
      adminUser,
      pages: result,
      msgSucess: req.query.msgSucess,
      msgError: req.query.msgError,
    });
  }

  static async getCreatePages(req, res) {
    const adminUser = req.session.adminUser;
    const getPosition = await PositionModel.selectAllPosition();

    return res.render("createPages", {
      adminUser,
      getPosition,
      msgSucess: req.query.msgSucess,
      msgError: req.query.msgError,
    });
  }

  static async postCreatePages(req, res) {
    const { page_title, page_position_id, page_status, page_content } =
      req.body;

    const statusBoolean = page_status === "Publicado" ? 1 : 0;
    const position_position_id = Number(page_position_id);

    const page = {
      page_title,
      page_status: statusBoolean,
      page_content,
      position_position_id,
    };
    //console.log(page);

    const result = await PagesModel.insertPages(page);
    console.log(result);

    return res.redirect(
      "/pages/createPages?msgSucess=Pagina criada com sucesso!"
    );
  }

  static async getEditPage(req, res) {
    const adminUser = req.session.adminUser;
    const getParams = req.params.id;

    const resultPoisition = await PositionModel.selectAllPoisition();
    const result = await PagesModel.selectJoinPagePoisitionById(getParams);
    // console.log(resultJoin);

    return res.render("editPage", {
      adminUser,
      msgSucess: req.query.msgSucess,
      msgError: req.query.msgError,
      page: result,
      positions: resultPoisition,
    });
  }

  static async putEditPage(req, res) {
    const { page_title, page_position_id, page_status, page_content } =
      req.body;
    const getParams = req.params.id;

    const statusBoolen = page_status === "Publicado" ? 1 : 0;
    const position_position_id = Number(page_position_id);

    const getDateUpdate = {
      page_title,
      page_status: statusBoolean,
      page_content,
      position_position_id,
    };

    const result = await PagesModel.updatePage(getParams, getDataUpdate);

    console.log(result);

    return res.redirect("/pages?msgSucess=Atualizada com sucesso!");
  }

  static async deletePage(req, res) {
    const getId = req.params.id;

    const result = await PagesModel.deletePage(getId);
    console.log(result);

    return res.redirect("/pages");
  }
};
