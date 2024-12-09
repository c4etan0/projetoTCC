const database = require("../database/database");

module.exports = class PostModel {
  static async selectAllPosts() {
    const selectAllPost = "SELECT * FROM posts;";
    const [result] = await database.query(selectAllPost);

    return result;
  }

  static async selectPostById(post_id) {
    const selectPostById = "SELECT * FROM posts WHERE post_id = ?;";
    const [[result]] = await database.query(selectPostById, [post_id]);

    return result;
  }

  static async insertPost(post) {
    const { post_title, post_content, post_slug, users_user_id } = post;
    const insertPost =
      "INSERT INTO posts(post_title, post_content, post_slug, users_user_id) VALUES (?, ?, ?, ?);";
    const [result] = await database.query(insertPost, [
      post_title,
      post_content,
      post_slug,
      users_user_id,
    ]);

    return result;
  }

  static async updatePost(post_id, post) {
    const { post_title, post_content, post_slug } = post;
    const updatePost =
      "UPDATE posts SET post_title = ?, post_content = ?, post_slug = ? WHERE post_id = ?;";
    const [result] = await database.query(updatePost, [
      post_title,
      post_content,
      post_slug,
      post_id,
    ]);

    return result;
  }

  static async deletePost(post_id) {
    const deletePost = "DELETE FROM posts WHERE post_id = ?;";
    const [result] = await database.query(deletePost, [post_id]);

    return result;
  }

  static async selectJoinAllPosts() {
    const selectJoin = `SELECT 
                            users.user_id,
                            users.user_name,
                            users.user_email,
                            users.user_img_profile,
                            posts.post_id,
                            posts.post_title,
                            posts.post_content,
                            posts.post_slug,
                            posts.post_date
                        FROM 
                            users
                        INNER JOIN 
                            posts 
                        ON 
                            users.user_id = posts.users_user_id
                        ORDER BY 
                            posts.post_date DESC;`;
    const [result] = await database.query(selectJoin);

    return result;
  }
};
