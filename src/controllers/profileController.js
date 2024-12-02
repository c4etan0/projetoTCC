const PostModel = require("../models/postModel");
const RegisterUserModel = require("../models/registerUserModels");

module.exports = class ProfileController {
  static async getProfile(req, res) {
    const userProfile = req.session.user;
    const result = await RegisterUserModel.getUserByEmail(
      userProfile.user_email
    );
    return res.render("profile", {
      user: result,
      msgSuccess: req.query.msgSuccess,
      msgError: req.query.msgError,
    });
  }

  static async updateProfile(req, res) {
    const { user_name, user_email } = req.body;
    const user_id = Number(req.params.id);
    const result = await RegisterUserModel.getUserByEmail(user_email);
    let user_img_profile = "";

    if (!result.user_img_profile && !req.file) {
      user_img_profile = "";
    }

    if (result.user_img_profile && !req.file) {
      user_img_profile = result.user_img_profile;
    }

    if (req.file) {
      user_img_profile = `/${req.file.filename}`;
    }

    const updateUser = {
      user_name,
      user_email,
      user_img_profile,
    };

    const setUpdate = await RegisterUserModel.updateUserProfile(
      user_id,
      updateUser
    );

    if (!setUpdate) {
      return res.redirect(
        "/profile?msgError=Não foi possivel atualizar o perfil!"
      );
    }

    req.session.logged = true;
    req.session.user = result;

    return res.redirect("/profile?msgSuccess=Perfil atualizado com sucesso!");
  }

  static async getProfileCreatePost(req, res) {
    const userProfile = req.session.user;
    const result = await RegisterUserModel.getUserByEmail(
      userProfile.user_email
    );
    return res.render("createPost", {
      user: result,
      msgSuccess: req.query.msgSuccess,
      msgError: req.query.msgError,
    });
  }

  static async createPost(req, res) {
    const { post_title, post_content } = req.body;
    const user_id = req.params.id;
    const post_slug = post_title.replace(/\s+/g, "-");

    const getuser = await RegisterUserModel.selectUserById(user_id);

    if (!getuser) {
      return res.redirect(
        "/profile/createPost?msgError=Não foi possivel criar o post, faça login novamente!"
      );
    }

    const post = {
      post_title,
      post_content,
      post_slug,
      users_user_id: getuser.user_id,
    };

    const result = await PostModel.insertPost(post);

    if (!result) {
      return res.redirect(
        "/profile/createPost?msgError=Não foi possivel criar o post. Tente novamente!"
      );
    }

    return res.redirect(
      "/profile/createPost?msgSuccess=Post criado com sucesso!"
    );
  }

  static async getListPosts(req, res) {
    const userProfile = req.session.user;

    const result = await PostModel.selectAllPosts();

    const findPostsById = result.filter(
      (posts) => posts.users_user_id === userProfile.user_id
    );

    return res.render("listPosts", {
      posts: findPostsById,
      msgSuccess: req.query.msgSuccess,
      msgError: req.query.msgError,
    });
  }

  static async getEditPost(req, res) {
    const getPostId = Number(req.params.id);
    const result = await PostModel.selectPostById(getPostId);
    return res.render("editPost", {
      post: result,
      msgSuccess: req.query.msgSuccess,
      msgError: req.query.msgError,
    });
  }

  static async postEditPost(req, res) {
    const { post_title, post_content } = req.body;
    const getPostId = Number(req.params.id);

    const post_slug = post_title.replace(/\s+/g, "-");

    const post = {
      post_title,
      post_content,
      post_slug,
    };

    const result = await PostModel.updatePost(getPostId, post);

    if (!result) {
      return res.redirect(
        "/profile/editPost?msgError=Não foi possivel atualizar o post. Tente novamente!"
      );
    }

    return res.redirect(
      "/profile/listPosts?msgSuccess=Post Atualizado com Sucesso!"
    );
  }

  static async deletePost(req, res) {
    const getPostId = Number(req.params.id);

    const result = await PostModel.deletePost(getPostId);

    if (!result) {
      return res.redirect(
        "/profile/editPost?msgError=Não foi possivel atualizar o post. Tente novamente!"
      );
    }

    return res.redirect(
      "/profile/listPosts?msgSuccess=Post Deletado com Sucesso!"
    );
  }
};