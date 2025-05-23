var express = require("express");
var router = express.Router();
var dadosController = require("../controllers/dadosController");

router.get("/puxar", function (req, res) {
    dadosController.puxar(req, res);
});

module.exports = router;