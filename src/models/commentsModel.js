const database = require("../database/database");

class CommentsModel {
  static async selecAllComments() {
    const selectAllComments = `SELECT * FROM comments`;
    const [result] = await database.query(selectAllComments);

    return result;
  }

  static async insertComment(comment) {
    const { comment_content, users_user_id, posts_post_id } = comment;
    const insertComment = `INSERT INTO comments(
            comment_content,
            users_user_id,
            posts_post_id)
        VALUES
            (?, ?, ?)`;
    const [result] = await database.query(insertComment, [
      comment_content,
      users_user_id,
      posts_post_id,
    ]);

    return result;
  }

  static async selectCommentsByPostId(post_id) {
    const selectCommentsByPostId = `SELECT 
                    c.comment_id AS comment_id,
                    c.comment_content AS comment_content,
                    u.user_id AS user_id,
                    u.user_name AS user_name,
                    u.user_email AS user_email,
                    u.user_img_profile AS user_img_profile,
                    p.post_id AS post_id,
                    p.post_title AS post_title,
                    p.post_content AS post_content
                FROM 
                    comments c
                JOIN 
                    users u ON c.users_user_id = u.user_id
                JOIN 
                    posts p ON c.posts_post_id = p.post_id
                WHERE 
                    p.post_id = ?
                ORDER BY 
                    c.comment_date DESC;`;
    const [result] = await database.query(selectCommentsByPostId, [post_id]);

    return result;
  }
}

module.exports = CommentsModel;
