const CommentsModel = require("../models/commentsModel");
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

  static async getReadPost(req, res) {
    const result = await PostModel.selectJoinAllPosts();
    const getSlug = req.params.slug;

    const [getPost] = result.filter((item) => item.post_slug === getSlug);
    const getComments = await CommentsModel.selectCommentsByPostId(
      getPost.post_id
    );

    return res.render("showOnePost", {
      post: getPost,
      comments: getComments,
    });
  }

  static async postComment(req, res) {
    const { posts_post_id, comment_content } = req.body;
    const result = await PostModel.selectJoinAllPosts();
    const getSlug = req.params.slug;
    const getUserId = req.session.user;

    const [getPost] = result.filter((item) => item.post_slug === getSlug);

    const comment = {
      comment_content,
      users_user_id: getUserId.user_id,
      posts_post_id: Number(posts_post_id),
    };

    const insertComment = CommentsModel.insertComment(comment);

    if (!insertComment) {
      return res.redirect(
        `/post/${getPost.post_slug}?msgError=Não foi possivel registrar o post`
      );
    }

    const getComments = await CommentsModel.selectCommentsByPostId(
      Number(posts_post_id)
    );

    console.log(getComments);

    return res.redirect(`/post/${getPost.post_slug}`);
  }
};
