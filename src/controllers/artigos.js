const PagesModel = require("../models/pagesModel");

class ArtigosController {
  static async getArtigos(req, res) {
    const getPages = await PagesModel.selectJoinPagesPosition();
    return res.render("artigos", {
      pages: getPages,
    });
  }
}

module.exports = ArtigosController;
