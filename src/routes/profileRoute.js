const express = require("express");
const ProfileController = require("../controllers/profileController");

const profileRoute = express.Router();

profileRoute.get("/", ProfileController.getProfile);

module.exports = profileRoute;
