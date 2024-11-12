const express = require("express");
const multer = require("multer");
const storage = require("../middlewares/uploadImageMiddleware");
const UploadImagesAdminController = require("../controllers/uploadImagesAdminController");

const uploadAdminRoute = express.Router();

const upload = multer({ storage: storage });

uploadAdminRoute.get("/", UploadImagesAdminController.getUploadAdminImages);

uploadAdminRoute.post(
  "/",
  upload.single("user_upload"),
  UploadImagesAdminController.postUploadAdminImages
);

module.exports = uploadAdminRoute;