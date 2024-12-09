const express = require("express");
const HomeController = require("../controllers/homeController");

const homeRoute = express.Router();

homeRoute.get("/", HomeController.getHome);

homeRoute.get("/post/:slug", HomeController.getReadPost);

homeRoute.post("/comment/:slug", HomeController.postComment);

module.exports = homeRoute;
