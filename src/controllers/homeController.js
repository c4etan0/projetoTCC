const PostModel = require("../models/postModel");

module.exports = class HomeController {
  static async getHome(req, res) {
    const result = await PostModel.selectJoinAllPosts();

    return res.render("index", {
      posts: result,
    });
  }
};