const express = require("express");
const ProfileController = require("../controllers/profileController");
const storage = require("../middlewares/uploadImageMiddleware");
const multer = require("multer");

const profileRoute = express.Router();

const upload = multer({ storage: storage });

profileRoute.get("/", ProfileController.getProfile);

profileRoute.post(
  "/:id",
  upload.single("user_img_profile"),
  ProfileController.updateProfile
);

profileRoute.get("/createPost", ProfileController.getProfileCreatePost);

profileRoute.post("/createPost/:id", ProfileController.createPost);

profileRoute.get("/listPosts", ProfileController.getListPosts);

profileRoute.get("/editPost/:id", ProfileController.getEditPost);

profileRoute.post("/editPost/:id", ProfileController.postEditPost);

profileRoute.post("/deletePost/:id", ProfileController.deletePost);

module.exports = profileRoute;