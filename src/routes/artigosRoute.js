const express = require("express");
const ArtigosController = require("../controllers/artigos");

const artigosRoute = express.Router();

artigosRoute.get("/", ArtigosController.getArtigos);

module.exports = artigosRoute;
