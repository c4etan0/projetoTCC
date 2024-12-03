const PagesModel = require("../models/pagesModel");
const PostModel = require("../models/postModel");

module.exports = class HomeController {
  static async getHome(req, res) {
    const result = await PostModel.selectJoinAllPosts();
    const getPages = await PagesModel.selectJoinPagesPosition();

    return res.render("index", {
      posts: result,
      pages: getPages,
    });
  }
};
