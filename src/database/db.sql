DROP DATABASE login_register_system;

CREATE DATABASE IF NOT EXISTS login_register_system;

USE login_register_system

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(120) NOT NULL,
  `user_email` VARCHAR(120) NOT NULL,
  `user_password` VARCHAR(255) NOT NULL,
  `user_img_profile` VARCHAR(255) NULL,
  `user_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `posts` (
  `post_id` INT NOT NULL AUTO_INCREMENT,
  `post_title` VARCHAR(255) NOT NULL,
  `post_content` LONGTEXT NOT NULL,
  `post_slug` VARCHAR(255) NOT NULL,
  `post_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `users_user_id` INT NOT NULL,
  PRIMARY KEY (`post_id`),
  INDEX `fk_posts_users_idx` (`users_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_posts_users`
    FOREIGN KEY (`users_user_id`)
    REFERENCES `users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS user_images(
user_image_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
user_image_name VARCHAR(255) NOT NULL,
user_image_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS admin_users(
admin_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
admin_name VARCHAR(100) NOT NULL,
admin_email VARCHAR(100) NOT NULL,
admin_password VARCHAR(255) NOT NULL,
admin_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS `position` (
  `position_id` INT NOT NULL AUTO_INCREMENT,
  `position_name` VARCHAR(100) NOT NULL,
  `position_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`position_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pages` (
  `page_id` INT NOT NULL AUTO_INCREMENT,
  `page_title` VARCHAR(180) NOT NULL,
  `page_status` TINYINT(0) NOT NULL,
  `page_content` TEXT NOT NULL,
  `page_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `position_position_id` INT NOT NULL,
  PRIMARY KEY (`page_id`),
  INDEX `fk_pages_position_idx` (`position_position_id` ASC) VISIBLE,
  CONSTRAINT `fk_pages_position`
    FOREIGN KEY (`position_position_id`)
    REFERENCES `position` (`position_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SELECT 
    users.user_id,
    users.user_name,
    users.user_email,
    users.user_img_profile,
    posts.post_id,
    posts.post_title,
    posts.post_content,
    posts.post_date
FROM 
    users
INNER JOIN 
    posts 
ON 
    users.user_id = posts.users_user_id;

ALTER TABLE `comments`
DROP FOREIGN KEY `fk_comments_posts1`,
ADD CONSTRAINT `fk_comments_posts1`
FOREIGN KEY (`posts_post_id`)
REFERENCES `posts` (`post_id`)
ON DELETE CASCADE
ON UPDATE NO ACTION;